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
import 'dart:math';

/// This is a very simple example for τ beginners, that show how to playback a file.
/// Its a translation to Dart from [Mozilla example](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
/// This example is really basic.
class FromAsyncProcEx extends StatefulWidget {
  const FromAsyncProcEx({super.key});
  @override
  State<FromAsyncProcEx> createState() => _FromAsyncProcEx();
}

class _FromAsyncProcEx extends State<FromAsyncProcEx> {

// ----------------------------------------------------- This is the very simple example (the code itself) --------------------------------------------------------------------------


static const String PCM_ASSET = 'assets/wav/sample2.aac'; // The asset to be played
static const int BLK_SIZE = 128;

  bool playEnabled = false;
  bool stopEnabled = false;
  double pannerValue = 0;
  String path = '';
  //late AudioBuffer audioBuffer;


  // The Audio Context
  AudioContext? audioCtx;
  // The three nodes
  //AudioDestinationNode? dest;
  //int messageNo = 0;

  Future<void> init() async
  {
    await Tau().init();

      setState(() {playEnabled = true;});

  }
  
  @override
  void initState() {
    super.initState();
    init().then ((e){setState(() {playEnabled = true;});});
   }

  void hitPlayButton() async {

    audioCtx = Tau().newAudioContext();
    await audioCtx!.audioWorklet.addModule("./packages/tauweb/js/async_processor.js");
    //audioBuffer = await loadAudio();
    ByteData asset = await rootBundle.load(PCM_ASSET);

    var audioBuffer = await audioCtx!.decodeAudioData( asset.buffer);

    AudioWorkletNodeOptions opt = Tau().newAudioWorkletNodeOptions( 
      channelCountMode: 'explicit', 
      channelCount: audioBuffer.numberOfChannels,
      numberOfInputs: 0,
      numberOfOutputs: 1, // Only one output
      outputChannelCount:  [audioBuffer.numberOfChannels],
    );
    var streamNode = Tau().newAsyncWorkletNode(audioCtx!, "async-processor", opt);

    streamNode.port.onmessage = (Message e) => print("Rcv ${e['data']}");
    assert (audioBuffer.numberOfChannels >= 1, "audioBuffer.numberOfChannels < 1");
    List<Float32List> data = [];
    for (int channel = 0; channel < audioBuffer.numberOfChannels; ++channel)
    {
        var d = audioBuffer.getChannelData(channel);
        data.add(d);
        assert (d.length == data[0].length, 'Length is not same for all the channels');
    }
    int x = 0;
    int ln = data[0].length;
    while (x < ln)
    {
        List<Float32List> m = [];
        for (int channel = 0; channel < audioBuffer.numberOfChannels; ++channel)
        {
            m.add(data[channel].sublist(x, min ( x + BLK_SIZE, ln)));
        }
        streamNode.send(output: 0,  data: m );
        x += BLK_SIZE;
    }

    streamNode.connect(audioCtx!.destination);

    setState(() {
      playEnabled = false;
      stopEnabled = true;
    });

  }


  void hitStopButton() {
    audioCtx?.close();
    audioCtx?.dispose();
    audioCtx = null;

      setState(() {
        playEnabled = true;
        stopEnabled = false;
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
        title: const Text('Play from a dart stream'),
        actions: const <Widget>[],
      ),
      body: makeBody(),
    );
  }
}
