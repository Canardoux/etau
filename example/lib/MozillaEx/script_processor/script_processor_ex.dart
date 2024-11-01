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

import 'package:flutter/material.dart';
import 'package:tau/tau.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
import 'dart:math';

/// This is a very simple example for τ beginners, that show how to playback a file.
/// Its a translation to Dart from [Mozilla example](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
/// This example is really basic.
class ScriptProcessorEx extends StatefulWidget {
  const ScriptProcessorEx({super.key});
  @override
  State<ScriptProcessorEx> createState() => _ScriptProcessorEx();
}

class _ScriptProcessorEx extends State<ScriptProcessorEx> {
  String pcmAsset = 'assets/wav/viper.ogg'; // The OGG asset to be played

  AudioContext? audioCtx;
  AudioDestinationNode? dest;
  AudioBufferSourceNode? source;
  AudioBuffer? audioBuffer;
  ScriptProcessorNode? scriptProcessor;
  bool playDisabled = false;
  bool stopDisabled = true;
  double pannerValue = 0;
  String path = '';
  bool dataActive = false;

  Future<void> loadAudio() async {
    var asset = await rootBundle.load(pcmAsset);

    var tempDir = await getTemporaryDirectory();
    path = '${tempDir.path}/tau.ogg';
    var file = File(path);
    file.writeAsBytesSync(asset.buffer.asInt8List());
  }

  void initPlatformState() async {
    audioCtx = AudioContext(
        options: const AudioContextOptions(
      latencyHint: AudioContextLatencyCategory.playback(),
      sinkId: '',
      renderSizeHint: AudioContextRenderSizeCategory.default_,
      //sampleRate: 44100,
    ));
    await loadAudio();
    audioBuffer = audioCtx!.decodeAudioDataSync(inputPath: path);
   dest = audioCtx!.destination();
    setState(() {});

    Tau.tau.logger.d('Une bonne journée');
  }


  void pressButton() {
    scriptProcessor =  audioCtx!.createScriptProcessor(bufferSize: 4096, numberOfInputChannels: 1, numberOfOutputChannels: 1);
    scriptProcessor!.setOnaudioprocess(callback: (event)
    {
      AudioBuffer inputBuffer = event.inputBuffer;
      AudioBuffer outputBuffer = event.outputBuffer;
      for (int channel = 0; channel < outputBuffer.numberOfChannels(); ++channel)
      {
        var inputData = inputBuffer.getChannelData(channelNumber: channel);
        var outputData = outputBuffer.getChannelData(channelNumber: channel);
        for (int sample = 0; sample< inputBuffer.length(); ++sample)
        {
          //var x = inputBuffer.getAt(channelNumber: channel, index: sample);
          var x = inputData[sample];
          x += (Random().nextDouble() * 2 - 1) * 0.1;
          //outputBuffer.setAt(channelNumber: channel, index: sample, value: x);
          outputData[sample] = inputData[sample];
          outputData[sample] += (Random().nextDouble() * 2 - 1) * 0.1;
        }
        outputBuffer.setChannelData(source: outputData, channelNumber: channel);
      }
    });
    source = audioCtx!.createBufferSource();
    source!.setBuffer(audioBuffer: audioBuffer!);

    source!.connect(dest:scriptProcessor!);
    scriptProcessor!.connect(dest: dest!);
    source!.start();
    source!.setOnEnded(callback: (event){source!.disconnect(); scriptProcessor!.disconnect();});
    setState(() {

    });
  }

  // Good citizens must dispose nodes and Audio Context
  void disposeEverything() {
    Tau.tau.logger.d("dispose");

    if (dest != null) {
      dest!.dispose();
      dest = null;
    }
    //if (source != null) {
    //src!.stop();
    //source!.dispose();
    //source = null;
    //}
  }

  @override
  void dispose() {
    disposeEverything();
    if (audioCtx != null) {
      audioCtx!.close();
      audioCtx!.dispose();
      audioCtx = null;
      if (source != null) {
        //source!.stop();
        source!.dispose();
        source = null;
      }
      if (audioBuffer != null) {
        audioBuffer!.dispose();
        audioBuffer = null;
      }
    }

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    Widget makeBody() {
      return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

            ElevatedButton(
              onPressed: pressButton,
              //color: Colors.indigo,
              child:  Text(
                dataActive ? 'Stop' : 'Start',
                style: const TextStyle(color: Colors.black),
              ),
            ),

        ]),
      );
    }

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Script Processor'),
        actions: const <Widget>[],
      ),
      body: makeBody(),
    );
  }
}
