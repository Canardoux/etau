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
import 'package:etau/etau.dart'
  if (dart.library.js_interop) 'package:tauweb/tauweb.dart' show Tau
  if (dart.library.io) 'package:tauwars/tauwars.dart' show Tau;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';

/// This is a very simple example for τ beginners, that shows how to playback a file from a buffer.
/// The buffer is loaded from an Asset.
/// This example is really basic.
class FromConstantEx extends StatefulWidget {
  const FromConstantEx({super.key});
  @override
  State<FromConstantEx> createState() => _FromConstantEx();
}

class _FromConstantEx extends State<FromConstantEx> {

  bool playDisabled = true;
  bool stopDisabled = true;
  double volumeValue = 0;

  OscillatorNode?  oscNode1;
  OscillatorNode?  oscNode2;
  OscillatorNode?  oscNode3;


// ----------------------------------------------------- This is the very simple example (the code itself) --------------------------------------------------------------------------


  // The Audio Context
  late AudioContext audioCtx;
  late ConstantSourceNode constantNode;
  late GainNode gainNode1;
  late GainNode gainNode2;
  late GainNode gainNode3;

  Future<void> setup() async {
    await Tau().init();
    audioCtx = Tau().newAudioContext();

    //gainNode1 = audioCtx.createGain();
    //gainNode1.gain.value = 0.5;
    //gainNode1 = Tau().newGainNode(audioCtx, Tau().newGainOptions(gain: 0.5));
    //gainNode2 = Tau().newGainNode(audioCtx, Tau().newGainOptions(gain: gainNode1.gain.value));
    //gainNode3 = Tau().newGainNode(audioCtx, Tau().newGainOptions(gain: gainNode1.gain.value));

    gainNode1 = Tau().newGainNode(audioCtx,); gainNode1.gain.value = 0.5;
    gainNode2 = Tau().newGainNode(audioCtx,); gainNode2.gain.value = gainNode1.gain.value;
    gainNode3 = Tau().newGainNode(audioCtx,); gainNode3.gain.value = gainNode1.gain.value;

    volumeValue = gainNode1.gain.value;

    //constantNode = Tau().newConstantSourceNode(audioCtx, Tau().newConstantSourceOptions(offset: volumeValue,));
    constantNode = Tau().newConstantSourceNode(audioCtx); constantNode.offset.value = volumeValue;
    constantNode.connectParam(gainNode2.gain);
    constantNode.connectParam(gainNode3.gain);
    constantNode.start();

    gainNode1.connect(audioCtx.destination);
    gainNode2.connect(audioCtx.destination);
    gainNode3.connect(audioCtx.destination);

    // All is set up. We can hook the volume control.
    //volumeControl.addEventListener("input", changeVolume, false);
  }

  void startOscillators() {
    //oscNode1 = Tau().newOscillatorNode(audioCtx, Tau().newOscillatorOptions(
      //type: "sine",
      //frequency: 261.625565300598634, // middle C$
    //));
    oscNode1 = Tau().newOscillatorNode(audioCtx,); oscNode1!.type = 'sine'; oscNode1!.frequency.value = 261.625565300598634; // middle C$
    oscNode1!.connect(gainNode1);

    //oscNode2 = Tau().newOscillatorNode(audioCtx, Tau().newOscillatorOptions(
      //type: "sine",
      //frequency: 329.627556912869929, // E
    //));
    oscNode2 = Tau().newOscillatorNode(audioCtx,); oscNode2!.type = 'sine'; oscNode2!.frequency.value = 329.627556912869929; // E
    oscNode2!.connect(gainNode2);

    //oscNode2 = Tau().newOscillatorNode(audioCtx, Tau().newOscillatorOptions(
      //type: "sine",
      //frequency: 391.995435981749294, // G
    //));
    oscNode3 = Tau().newOscillatorNode(audioCtx,); oscNode3!.type = 'sine'; oscNode3!.frequency.value = 391.995435981749294; // G
    oscNode3!.connect(gainNode3);

    oscNode1!.start();
    oscNode2!.start();
    oscNode3!.start();
  }

  void stopOscillators() {
    oscNode1!.stop();
    oscNode2!.stop();
    oscNode3!.stop();
  }  

  @override
  void initState() {
    super.initState();
    setup().then ((e){
    setState(() 
    {
      playDisabled = false;}
    );});
    setState(() {});
  }

  void hitPlayButton() async {
/*
    gainNode2 = audioCtx.createGain();
    gainNode3 = audioCtx.createGain();
    gainNode2.gain.value = gainNode3.gain.value = 0.5;
    volumeSliderControl.value = gainNode2.gain.value;

    constantNode = audioCtx.createConstantSource();
    constantNode.connect(gainNode2.gain);
    constantNode.connect(gainNode3.gain);
    constantNode.start();

    gainNode2.connect(audioCtx.destination);
    gainNode3.connect(audioCtx.destination);
 
    pannerNode = audioCtx.createStereoPanner();
    pannerNode!.pan.value = pannerValue;
*/
    startOscillators();

    setState(() {
      playDisabled = true;
      stopDisabled = false;
    });
  }

  void hitStopButton() {
      stopOscillators();
      setState(() {
        playDisabled = false;
        stopDisabled = true;
      });
  }


  void volumeChanged(double value) {
    constantNode.offset.value = value;

    setState(() {
      volumeValue = value;
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
          const Text('Volume:'),
          Slider(
            value: volumeValue,
            min: 0,
            max: 1,
            onChanged: volumeChanged,
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
