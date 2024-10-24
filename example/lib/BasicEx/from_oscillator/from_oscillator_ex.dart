/*
 * Copyright 2024 Canardoux.
 *
 * This file is part of the τ Project.
 *
 * τ (Tau) is free software: you can redistribute it and/or modify
 * it under the terms of the Mozilla Public License version 2 (MPL2.0),
 * as published by the Mozilla organization.
 *
 * τ is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * MPL General Public License for more details.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:etau/etau.dart';
import 'package:etau/etau.dart'
    if (dart.library.js_interop) 'package:tauweb/tauweb.dart' show Tau
    if (dart.library.io) 'package:tauwars/tauwars.dart' show Tau;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';

/// This is a very simple example for τ beginners, that show how to playback a file.
/// Its a translation to Dart from [Mozilla example](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
/// This example is really basic.
class FromOscillatorEx extends StatefulWidget {
  const FromOscillatorEx({super.key});
  @override
  State<FromOscillatorEx> createState() => _FromOscillatorEx();
}

class _FromOscillatorEx extends State<FromOscillatorEx> {
  String pcmAsset = 'assets/wav/viper.ogg'; // The OGG asset to be played

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
    Tau().init().then ((e){setState(() {playDisabled = false;});});
  }

  void hitPlayButton() async {

    // create web audio api context
    audioCtx = Tau().newAudioContext();

    // create Oscillator node
    var oscillator = audioCtx!.createOscillator();

    oscillator.type = "square";
    oscillator.frequency.setValueAtTime(440, audioCtx!.currentTime); // value in hertz
    oscillator.connect(audioCtx!.destination);
    oscillator.start();


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
        ]),
      );
    }

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Play from an oscillator'),
        actions: const <Widget>[],
      ),
      body: makeBody(),
    );
  }
}
