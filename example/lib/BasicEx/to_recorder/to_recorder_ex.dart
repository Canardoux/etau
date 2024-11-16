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
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:etau/etau.dart';
import 'package:tau_web/dummy.dart' show tau, tauwebJS
  if (dart.library.js_interop) 'package:tau_web/tau_web.dart'
  if (dart.library.io) 'package:tau_wars/tau_wars.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:tau_web/src/tauweb_class.dart' as x; // JUST FOR DEBUGGING
import 'package:tau_web/src/tauweb_audio.dart' as j; // JUST FOR DEBUGGING
/// This is a very simple example for τ beginners, that show how to playback a file.
/// Its a translation to Dart from [Mozilla example](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
/// This example is really basic.
class ToRecorderEx extends StatefulWidget {
  const ToRecorderEx({super.key});
  @override
  State<ToRecorderEx> createState() => _ToRecorderEx();
}

class _ToRecorderEx extends State<ToRecorderEx> {

  bool playEnabled = true;
  bool stopEnabled = true;

@override
void initState() {
super.initState();
 tau().init().then((value){});
}

Future<void> hitPlayButton() async {
await playerHitPlayButton();
await recorderhitPlayButton();

}


void hitStopButton() {
    playerHitStopButton();
    recorderHitStopButton();
}


// ----------------------------------------------------- The Recorder --------------------------------------------------------------------------
AudioContext? recorderCtx;
static const String pcmAsset = 'assets/sample2.aac'; // The asset to be recorded
AudioBuffer? recorderAudioBuffer;
AudioBufferSourceNode? recorderSource;
MediaStreamAudioDestinationNode? recorderDest;
MediaRecorder? mediaRecorder;


Future<void> initRecorder() async
{

}



Future<void> recorderhitPlayButton() async {

recorderCtx = tau().newAudioContext();
ByteData asset = await rootBundle.load(pcmAsset);
recorderAudioBuffer = await recorderCtx!.decodeAudioData( asset.buffer);


recorderSource = recorderCtx!.createBufferSource();
recorderSource!.buffer = recorderAudioBuffer;

//source!.loop = true;
recorderSource!.onended = ()
{
setState(()
{
});
};


recorderDest = recorderCtx!.createMediaStreamDestination();
mediaRecorder = tau().newMediaRecorder(recorderDest!.stream);
/*
if (recorderDest!.stream  is x.MediaStream) {
  var m = recorderDest!.stream as x.MediaStream;
  var y = m.delegate;

  tauwebJS().zozo(y);
}

 */

mediaRecorder!.ondataavailable ( (Float32List d){
  tau().logger().d('data');
  streamNode!.send(data: [d]);
});

recorderSource!.connect(recorderDest!);

mediaRecorder!.start();
recorderSource!.start();

}


void recorderHitStopButton() {
recorderSource!.stop();
recorderCtx?.close();
recorderCtx?.dispose();
recorderCtx = null;

setState(() {
});
}


// ----------------------------------------------------- The Player --------------------------------------------------------------------------
// The Audio Context
AudioContext? playerCtx;
AsyncWorkletNode? streamNode;
// The three nodes
//AudioDestinationNode? dest;
//int messageNo = 0;


Future<void> initPlayer() async
{

}

Future<void> playerHitPlayButton() async {

playerCtx = tau().newAudioContext();
await playerCtx!.audioWorklet.addModule("./assets/packages/tau_web/assets/js/async_processor.js");

AudioWorkletNodeOptions opt = tau().newAudioWorkletNodeOptions(
channelCountMode: 'explicit',
channelCount: 2,
numberOfInputs: 0,
numberOfOutputs: 1, // Only one output
outputChannelCount: [2],
);
streamNode = tau().newAsyncWorkletNode(playerCtx!, "async-processor-1", opt);


streamNode!.onBufferUnderflow( (int outputNo){
//hitStopButton();
} );
streamNode!.connect(playerCtx!.destination);

setState(() {
playEnabled = false;
stopEnabled = true;
});

}

playerHitStopButton() {
playerCtx?.close();
playerCtx?.dispose();
playerCtx = null;

setState(() {
});
}

  // ---------------------------------------------- That's all guys and girls (everything else is just dressing to run the example) ------------------------------------------------------------


  @override
  void dispose() {

playerCtx?.close();
playerCtx?.dispose();

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
              onPressed: playEnabled ? hitPlayButton : null,
              //color: Colors.indigo,
              child: const Text(
                'Play',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            ElevatedButton(
              onPressed: stopEnabled ? hitStopButton : null,
              //color: Colors.indigo,
              child: const Text(
                'Stop',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(
              width: 5,
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
