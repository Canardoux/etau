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
import 'package:tau_web/dummy.dart' show tau
    if (dart.library.js_interop) 'package:tau_web/tau_web.dart'
    if (dart.library.io) 'package:tau_wars/tau_wars.dart';

/// This is a very simple example for τ beginners, that show how to playback a file.
/// Its a translation to Dart from [Mozilla example](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
/// This example is really basic.
class FromMicEx extends StatefulWidget {
  const FromMicEx({super.key});
  @override
  State<FromMicEx> createState() => _FromMicEx();
}

class _FromMicEx extends State<FromMicEx> {
  //String pcmAsset = 'assets/wav/viper.ogg'; // The OGG asset to be played

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

  //MediaElement? audioElt;


  @override
  void initState() {
    super.initState();
    tau().init().then ((e){setState(() {playDisabled = false;});});
  }

  void hitPlayButton() async {

    audioCtx = tau().newAudioContext();
    dest = audioCtx!.destination;

    var mediaStream = await tau().getDevices().getUserMedia();
    var mic = audioCtx!.createMediaStreamSource(mediaStream);
    pannerNode = audioCtx!.createStereoPanner();
    pannerNode!.pan.value = pannerValue;
    mic.connect(pannerNode!);
    pannerNode!.connect(dest!);

    setState(() {
      playDisabled = true;
      stopDisabled = false;
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
        title: const Text('Loop from mic to speaker'),
        actions: const <Widget>[],
      ),
      body: makeBody(),
    );
  }
}
