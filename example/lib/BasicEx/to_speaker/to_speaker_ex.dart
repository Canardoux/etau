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


import 'package:flutter/material.dart';
import 'package:etau/etau.dart';

/// This is a very simple example for τ beginners, that show how to playback a file.
/// Its a translation to Dart from [Mozilla example](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
/// This example is really basic.
class ToSpeakerEx extends StatefulWidget {
  const ToSpeakerEx({super.key});
  @override
  State<ToSpeakerEx> createState() => _ToSpeakerEx();
}

class _ToSpeakerEx extends State<ToSpeakerEx> {
  String pcmAsset = 'assets/viper.ogg'; // The OGG asset to be played

  bool playDisabled = true;
  bool stopDisabled = true;
  double pannerValue = 0;
  String path = '';
// ----------------------------------------------------- This is the very simple example (the code itself) --------------------------------------------------------------------------


  // The Audio Context
  AudioContext? audioCtx;

  // The three nodes
  MediaElementAudioSourceNode? source;
  StereoPannerNode? pannerNode;
  AudioDestinationNode? dest;

  MediaElement? audioElt;


  @override
  void initState() {
    super.initState();
    /*
    audioElt = Tau().newMediaElement(src: 'https://flutter-sound.canardoux.xyz/extract/05.mp3', );
    audioElt!.onplay = ()
    {
      audioCtx = Tau().newAudioContext();
      dest = audioCtx.destination;
      source =  audioCtx.createMediaElementSource(audioElt!);
      source!.connect(dest!);

    } as EventHandler?;
     setState(() {playDisabled = false;});

     */
    tau().init().then ((e){setState(() {playDisabled = false;});});
  }

  void hitPlayButton() async {

    audioCtx = tau().newAudioContext();
    dest = audioCtx!.destination;
    audioElt = tau().newMediaElement(src: 'https://flutter-sound.canardoux.xyz/extract/05.mp3', );
    audioElt!.src = 'https://flutter-sound.canardoux.xyz/extract/05.mp3';
    audioElt!.crossorigin = 'anonymous';
    //MediaElementAudioSourceOptions opt = Tau().newMediaElementAudioSourceOptions(mediaElement: audioElt);
    //opt.mediaElement = audioElt;
    //source = Tau().newMediaElementAudioSourceNode(audioCtx, opt);
    source =  audioCtx!.createMediaElementSource(audioElt!);
    pannerNode = audioCtx!.createStereoPanner();
    pannerNode!.pan.value = pannerValue;
    source!.connect(pannerNode!);
    pannerNode!.connect(dest!);


     audioElt!.play().then( (e) {
       setState(() {
         stopDisabled = false;
       });
       //print(e);
     //}).catchError( (e) {
       //print(e);
     });

    setState(() {
      playDisabled = true;
    });

  }


  void hitStopButton() {
    audioCtx!.close();
    audioCtx!.dispose();
    audioCtx = null;

      setState(() {
        playDisabled = false;
        stopDisabled = true;
      });
  }


  void pannerChanged(double value) {
    pannerNode?.pan.value = value;
    setState(() {
      pannerValue = value;
    });
  }


  @override
  void dispose() {
      audioCtx?.close();
      audioCtx?.dispose();
      super.dispose();
  }

  // ---------------------------------------------- That's all guys and girls (everything else is just dressing to run the example) ------------------------------------------------------------



  @override
  Widget build(BuildContext context) {
    Widget makeBody() {
      return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              onPressed: playDisabled ? null : hitPlayButton,
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
              onPressed: stopDisabled ? null : hitStopButton,
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
          const Text('Panner:'),
          Slider(
            value: pannerValue,
            min: -1,
            max: 1,
            onChanged: pannerChanged,
            //divisions: 1
          ),
        ]),
      );
    }

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Play To the default speaker'),
        actions: const <Widget>[],
      ),
      body: makeBody(),
    );
  }
}
