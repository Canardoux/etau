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

import 'package:flutter/material.dart';
import 'package:etau/etau.dart';

import 'package:tau_web/dummy.dart' show tau
  if (dart.library.js_interop) 'package:tau_web/tau_web.dart'
  if (dart.library.io) 'package:tauwars/tau_wars.dart';
import 'package:file_picker/file_picker.dart';

/// This is a very simple example for τ beginners, that shows how to playback a file from a buffer.
/// The buffer is loaded from an Asset.
/// This example is really basic.
class FromFileEx extends StatefulWidget {
  const FromFileEx({super.key});
  @override
  State<FromFileEx> createState() => _FromFileEx();
}

class _FromFileEx extends State<FromFileEx> {
  String pcmAsset = 'assets/viper.ogg'; // The OGG asset to be played

  bool playEnabled = false;
  bool stopEnabled = false;
  String? path = '';
  //AudioBuffer? audioBuffer;

  /*
  // For the example, we load the the asset containing the audio data. This is just to be similar to the Mozilla example.
  Future<void> loadAudio() async {
    ByteData asset = await rootBundle.load(pcmAsset);
    audioBuffer = await audioCtx.decodeAudioData( asset.buffer);
    setState(() {playEnabled = true;});
  }
*/
// ----------------------------------------------------- This is the very simple example (the code itself) --------------------------------------------------------------------------


  // The Audio Context
  AudioContext?  audioCtx;

  // The three nodes
  MediaElementAudioSourceNode? source;
  AudioDestinationNode? dest;

  MediaElement? audioElt;


  @override
  void initState() {
    super.initState();
    tau().init().then ((e){
    audioCtx = tau().newAudioContext();
    setState(()
    {
    //playEnabled = true;
    });});
    //loadAudio();
    setState(() {});
  }

  void hitPlayButton() async {
    audioCtx = tau().newAudioContext();
    dest = audioCtx!.destination;
    audioElt = tau().newMediaElement(src: 'path', );
    //audioElt!.src = 'https://flutter-sound.canardoux.xyz/extract/05.mp3';
    audioElt!.crossorigin = 'anonymous';
    //MediaElementAudioSourceOptions opt = Tau().newMediaElementAudioSourceOptions(mediaElement: audioElt);
    //opt.mediaElement = audioElt;
    //source = Tau().newMediaElementAudioSourceNode(audioCtx, opt);
    source =  audioCtx!.createMediaElementSource(audioElt!);
    source!.connect(dest!);
    //source!.loop = true;
/*
    source!.onended = ()
    {
      setState(()
      {
        playEnabled = true;
        stopEnabled = false;
      });
    };
    source!.start();

 */

    audioElt!.play().then( (e) {
        setState(() {
            playEnabled = false;
            stopEnabled = true;
        });
    });
  }


  Future<void> hitSelectButton() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.audio);

      if (result != null)
      {
        path = result.files.single.path;
        //var buffer = result.files.single.bytes!.buffer;

        //audioBuffer = await audioCtx.decodeAudioData( buffer);

        setState(()
        {
          playEnabled = true;
          stopEnabled = false;
        });
      }
  }


  void hitStopButton() {
    audioCtx!.close();
    audioCtx!.dispose();
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
                    onPressed: !stopEnabled ?  hitSelectButton : null,
                    //color: Colors.indigo,
                    child: const Text(
                        'Select file',
                        style: TextStyle(color: Colors.black),
                        ),
                    ),
            const SizedBox(
            width: 5,
            ),
            ElevatedButton(
              onPressed: playEnabled ?  hitPlayButton : null,
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
