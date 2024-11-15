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
import 'package:tau_web/dummy.dart' show tau
  if (dart.library.js_interop) 'package:tau_web/tau_web.dart'
  if (dart.library.io) 'package:tau_wars/tau_wars.dart';
import 'package:flutter/services.dart' show rootBundle;

/// This is a very simple example for τ beginners, that show how to playback a file.
/// Its a translation to Dart from [Mozilla example](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
/// This example is really basic.
class ThrewAsyncProcEx extends StatefulWidget {
  const ThrewAsyncProcEx({super.key});
  @override
  State<ThrewAsyncProcEx> createState() => _ThrewAsyncProcEx();
}

class _ThrewAsyncProcEx extends State<ThrewAsyncProcEx> {

// ----------------------------------------------------- This is the very simple example (the code itself) --------------------------------------------------------------------------


static const String pcmAsset = 'assets/sample2.aac'; // The asset to be played

  bool playEnabled = false;
  bool stopEnabled = false;
  String path = '';
  AudioBuffer? audioBuffer;

  // The Audio Context
  late AudioContext? audioCtx;


  // The three nodes
  AudioBufferSourceNode? source;


  Future<void> init() async
  {
    await tau().init();

      setState(() {playEnabled = true;});

  }
  
  @override
  void initState() {
    super.initState();
    init().then ((e){setState(() {playEnabled = true;});});
   }

  void hitPlayButton() async {

    audioCtx = tau().newAudioContext();
    await audioCtx!.audioWorklet.addModule("./assets/packages/tau_web/assets/js/async_processor.js");
    //audioBuffer = await loadAudio();
    ByteData asset = await rootBundle.load(pcmAsset);

    var audioBuffer = await audioCtx!.decodeAudioData( asset.buffer);

    AudioWorkletNodeOptions opt = tau().newAudioWorkletNodeOptions(
      channelCountMode: 'explicit', 
      channelCount: audioBuffer.numberOfChannels,
      numberOfInputs: 1,
      numberOfOutputs: 1, // Only one output
      outputChannelCount: [audioBuffer.numberOfChannels],
    );
    var streamNode = tau().newAsyncWorkletNode(audioCtx!, "async-processor-1", opt);
    source = audioCtx!.createBufferSource();
    source!.buffer = audioBuffer;
    streamNode.onReceiveData(
      (int inputNo, List<Float32List> data)
      {
          streamNode.send(outputNo: inputNo, data: data);
      });
      streamNode.onBufferUnderflow( (int outputNo){
        //hitStopButton();
      tau().logger().d('onBufferUnderflow($outputNo)');
      }   );
    //source!.onended = hitStopButton;
    source!.connect(streamNode).connect(audioCtx!.destination);
    source!.start();

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
        title: const Text('Play threw and async processor'),
        actions: const <Widget>[],
      ),
      body: makeBody(),
    );
  }
}
