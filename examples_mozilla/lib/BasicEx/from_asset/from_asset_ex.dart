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
import 'package:etau/etau.dart';
import 'package:tau_web/dummy.dart' show tau
  if (dart.library.js_interop) 'package:_/tau_web.dart'
  if (dart.library.io) 'package:tau_wars/tau_wars.dart';
import 'package:flutter/services.dart' show rootBundle;

/// This is a very simple example for τ beginners, that shows how to playback a file from an asset.
/// The buffer is loaded from an Asset.
/// This example is really basic.
class FromAssetEx extends StatefulWidget {
  const FromAssetEx({super.key});
  @override
  State<FromAssetEx> createState() => _FromAssetEx();
}

class _FromAssetEx extends State<FromAssetEx> {

// ----------------------------------------------------- This is the very simple example (the code itself) --------------------------------------------------------------------------

  String pcmAsset = 'assets/viper.ogg'; // The OGG asset to be played

  bool playDisabled = true;
  bool stopDisabled = true;
  double pannerValue = 0;
  String path = '';
  AudioBuffer? audioBuffer;

  // The Audio Context
  late AudioContext audioCtx;

  // The three nodes
  AudioBufferSourceNode? source;
  StereoPannerNode? pannerNode;
  AudioDestinationNode? dest;


  // For the example, we load the the asset containing the audio data. This is just to be similar to the Mozilla example.
  Future<void> loadAudio() async {
    ByteData asset = await rootBundle.load(pcmAsset);
    audioBuffer = await audioCtx.decodeAudioData( asset.buffer);
    setState(() {playDisabled = false;});
  }

  @override
  void initState() {
    super.initState();
    tau().init().then ((e){
    audioCtx = tau().newAudioContext();
    setState(() 
    {
      playDisabled = false;}
    );});
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
    //source!.loop = true;
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
        title: const Text('Play from an Asset'),
        actions: const <Widget>[],
      ),
      body: makeBody(),
    );
  }
}
