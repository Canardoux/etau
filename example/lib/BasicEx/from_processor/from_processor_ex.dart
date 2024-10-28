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
class FromProcessorEx extends StatefulWidget {
  const FromProcessorEx({super.key});
  @override
  State<FromProcessorEx> createState() => _FromProcessorEx();
}

class _FromProcessorEx extends State<FromProcessorEx> {

  bool playDisabled = true;
  bool stopDisabled = true;
// ----------------------------------------------------- This is the very simple example (the code itself) --------------------------------------------------------------------------


  // The Audio Context
  AudioContext? audioCtx;
  Timer? timer;
  // The three nodes
  AudioDestinationNode? dest;
  int messageNo = 0;

  Future<void> init() async
  {
    await Tau().init();
  }
  
  @override
  void initState() {
    super.initState();
    init().then ((e){setState(() {playDisabled = false;});});
  }

  void hitPlayButton() async {


    audioCtx = Tau().newAudioContext();
    //await audioCtx!.audioWorklet.addModule("./packages/tauweb/js/stream_processor.js");
    await audioCtx!.audioWorklet.addModule("js/random_noise_processor.js");
    //var paramData = ParameterData();
    var paramData = Tau().newParameterData({'momo':'riri','jojo':'riton'});
    var procOpt = Tau().newProcessorOptions({'momo':'tom','maman':'pass@123'});
    AudioWorkletNodeOptions opt = Tau().newAudioWorkletNodeOptions( channelCountMode: 'explicit', parameterData: paramData, processorOptions: procOpt);
    //var streamNode =  audioCtx!.createAudioWorkletNode("random-noise-processor", opt);
    var streamNode = Tau().newAudioWorkletNode(audioCtx!, "random-noise-processor", opt);

    //var momoParam = streamNode.parameters.get("momo");
    //momoParam.setValueAtTime(0, 'titi');
    //var params = streamNode.parameters;
    streamNode.port.onmessage = (Map<String,dynamic> m)
    {
      print(m['msg']);
    };
    streamNode.parameters.setProperty("toto",'zozo');
    streamNode.parameters.setProperty("momo",'zozo');

    AudioParamMap parameters = streamNode.parameters;
    var momo = parameters.getProperty('momo');
    var mimi = parameters.getProperty('mimi');
    var data = parameters.getProperty('data');
    //var n1 = parameters.length;
    //var k1 = parameters.keys;
    //var v1 = parameters.values;
    var totoParam = streamNode.parameters.getProperty("toto");
    //var totoParam2 = parameters["toto"];

    // send the message containing 'ping' string
    // to the AudioWorkletProcessor from the AudioWorkletNode every second
    //setInterval(() => streamNode.port.postMessage("ping"), 1000);

    // runs every 1 second
    timer = Timer.periodic(new Duration(seconds: 1), (timer) {
      ++messageNo;
      String msg = 'Ping ${messageNo}';
      print ('Post ${msg}');
      streamNode.port.postMessage({'data': msg});
    });
    //streamNode.port.onmessage = (Message e) => print("Rcv ${e['data']}");

    streamNode.connect(audioCtx!.destination);

    setState(() {
      playDisabled = true;
      stopDisabled = false;
    });

  }


  void hitStopButton() {
    timer?.cancel();
    timer = null;
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
    timer?.cancel();
    timer = null;

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
