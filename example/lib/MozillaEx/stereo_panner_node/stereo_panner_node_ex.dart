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
    if (dart.library.js_interop) 'package:tauweb/tauweb.dart'
    if (dart.library.io) 'package:tauwars/tauwars.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';

/// This is a very simple example for τ beginners, that show how to playback a file.
/// Its a translation to Dart from [Mozilla example](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
/// This example is really basic.
class StereoPannerNodeEx extends StatefulWidget {
  const StereoPannerNodeEx({super.key});
  @override
  State<StereoPannerNodeEx> createState() => _StereoPannerNodeEx();
}

class _StereoPannerNodeEx extends State<StereoPannerNodeEx> {
  String pcmAsset = 'assets/wav/viper.ogg'; // The OGG asset to be played

  bool playDisabled = true;
  bool stopDisabled = true;
  double pannerValue = 0;
  String path = '';
  AudioBuffer? audioBuffer;

  // For the example, we load the the asset containing the audio data. This is just to be similar to the Mozilla example.
  Future<void> loadAudio() async {
    ByteData asset = await rootBundle.load(pcmAsset);
    audioBuffer = await audioCtx.decodeAudioData( asset.buffer);
    setState(() {playDisabled = false;});
  }

// ----------------------------------------------------- This is the very simple example (the code itself) --------------------------------------------------------------------------


  // The Audio Context
  late AudioContext audioCtx;

  // The three nodes
  AudioBufferSourceNode? source;
  StereoPannerNode? pannerNode;
  AudioDestinationNode? dest;


  @override
  void initState() {
    super.initState();
    audioCtx = Tau().newAudioContext();
    loadAudio();
    setState(() {});
  }

  void hitPlayButton() async {

    dest = audioCtx.destination;

    source = audioCtx.createBufferSource();
    source!.buffer = audioBuffer;

    pannerNode = audioCtx.createStereoPanner();
    pannerNode!.pan.value = pannerValue;

    source!.connect(pannerNode!).connect(dest!);
    source!.loop = true;
    source!.onended = ()
    {
      setState(()
      {
        playDisabled = false;
        stopDisabled = true;
      });
    };
    source!.start();
    setState(() {
      playDisabled = true;
      stopDisabled = false;
    });
  }

  void hitStopButton() {
    source!.stop();

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
      audioCtx.close();
      audioCtx.dispose();
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
        title: const Text('Mozilla Stereo Panner Node'),
        actions: const <Widget>[],
      ),
      body: makeBody(),
    );
  }
}
