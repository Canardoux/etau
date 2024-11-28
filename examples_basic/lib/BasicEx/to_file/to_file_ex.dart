/*
 * Copyright 2024 Canardoux.
 *
 * This file is part of the τ project.
 *
 * τ is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 (GPL3), as published by
 * the Free Software Foundation.
 *
 * τ is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with τ.  If not, see <https://www.gnu.org/licenses/>.
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:etau/etau.dart';
import 'package:tau_web/dummy.dart' show tau
  if (dart.library.js_interop) 'package:tau_web/tau_web.dart'
  if (dart.library.io) 'package:tau_wars/tau_wars.dart';

/// This is a very simple example for τ beginners, that show how to playback a file.
/// Its a translation to Dart from [Mozilla example](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
/// This example is really basic.
class ToFileEx extends StatefulWidget {
  const ToFileEx({super.key});
  @override
  State<ToFileEx> createState() => _ToFileEx();
}

class _ToFileEx extends State<ToFileEx> {
  String fileName = 'toto.mp4';

  bool playEnabled = false;
  bool stopPlayerEnabled = false;
  bool recorderEnabled = false;
  bool stopRecorderEnabled = false;


@override
void initState()
{
    super.initState();
    tau().init().then((value)
    {
        setState(() {
        recorderEnabled = true;
        stopRecorderEnabled = false;
        });


    });
}




// ----------------------------------------------------- The Recorder --------------------------------------------------------------------------



AudioContext? recorderCtx;
AudioBuffer? recorderAudioBuffer;
AudioBufferSourceNode? recorderSource;
MediaStreamAudioDestinationNode? recorderDest;
MediaRecorder? mediaRecorder;



Future<void> recordHitButton() async {

recorderCtx = tau().newAudioContext();

var mediaStream = await tau().getDevices().getUserMedia();
var mic = recorderCtx!.createMediaStreamSource(mediaStream);
recorderDest = recorderCtx!.createMediaStreamDestination();
//var options = {'type' : 'audio/ogg; codecs=opus'};
mediaRecorder = tau().newMediaRecorder(recorderDest!.stream, "audio/mp4");
//mediaRecorder!.mimeType = 'audio/ogg; codecs=opus';


mediaRecorder!.onstop = ()
{
    mediaRecorder?.makeFile(fileName);
    recorderCtx?.dispose();
    recorderCtx = null;

    setState(() {
    stopRecorderEnabled = false;
    recorderEnabled = true;
    playEnabled = true;
    stopPlayerEnabled = false;
    });

};
mic.connect(recorderDest!);


mediaRecorder!.start();

setState(() {
recorderEnabled = false;
stopRecorderEnabled = true;
playEnabled = false;
stopPlayerEnabled = false;

});

}


void recorderHitStopButton() {
  mediaRecorder!.stop();
}

/*
// ----------------------------------------------------- The Player --------------------------------------------------------------------------


// The Audio Context
AudioContext? playerCtx;

// The three nodes
MediaElementAudioSourceNode? source;

MediaElement? audioElt;


void playHitButton() async {

      playerCtx = tau().newAudioContext();
      audioElt = tau().newMediaElement(src: '~/Downloads/$fileName' );
      //audioElt!.src = fileName;
      //audioElt!.crossorigin = 'anonymous';
      source =  playerCtx!.createMediaElementSource(audioElt!);
      //!!!!!!!!!!!!source!.mediaElement.onended = (event) => playerHitStopButton();
      source!.connect(playerCtx!.destination);
      audioElt!.play().then( (e) {
          tau().logger().d('audioElt!.play() completed');


        setState(() {
            playEnabled = false;
            recorderEnabled = false;
            stopRecorderEnabled = false;
            stopPlayerEnabled = true;
        });

      }).catchError( (e) {
          tau().logger().d(e);
      });

}


void playerHitStopButton() {
playerCtx!.close();
playerCtx!.dispose();
playerCtx = null;

setState(() {
  stopPlayerEnabled = false;
  stopRecorderEnabled = false;
  playEnabled = true;
  recorderEnabled = true;
//playDisabled = false;
//stopDisabled = true;
});
}


*/
// ---------------------------------------------- That's all guys and girls (everything else is just dressing to run the example) ------------------------------------------------------------



  @override
  void dispose() {

  recorderCtx?.close();
  recorderCtx?.dispose();

  super.dispose();
}


  @override
  Widget build(BuildContext context) {
    Widget makeBody() {
      return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              onPressed: recorderEnabled? recordHitButton : null, //hitRecordButton ,
              //color: Colors.indigo,
              child: const Text(
                'Record',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            ElevatedButton(
              onPressed: stopRecorderEnabled ?  recorderHitStopButton : null, //hitStopButton ,
              //color: Colors.indigo,
              child: const Text(
                'Stop recorder',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
                          width: 20,
                        ),
        ]),
          const SizedBox(
            height: 20,
          ),
         ]),
      );
    }

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Play to a recorder'),
        actions: const <Widget>[],
      ),
      body: makeBody(),
    );
  }
}
