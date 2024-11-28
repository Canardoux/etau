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
    if (dart.library.io) 'package:tau_wars/tau_wars.dart';


/// This is a very simple example for τ beginners, that show how to playback a file.
/// Its a translation to Dart from [Mozilla example](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
/// This example is really basic.
class FromSelectedDeviceEx extends StatefulWidget {
  const FromSelectedDeviceEx({super.key});
  @override
  State<FromSelectedDeviceEx> createState() => _FromSelectedDeviceEx();
}

class _FromSelectedDeviceEx extends State<FromSelectedDeviceEx> {
  //String pcmAsset = 'assets/wav/viper.ogg'; // The OGG asset to be played

  bool playDisabled = true;
  bool stopDisabled = true;
  List<MediaDeviceInfo> devicesInfos = [];
// ----------------------------------------------------- This is the very simple example (the code itself) --------------------------------------------------------------------------


  // The Audio Context
  AudioContext? audioCtx;

  // The three nodes
  MediaElementAudioSourceNode? source;
  AudioDestinationNode? dest;
  int selectedDeviceIndex = -1;


  Future<List<MediaDeviceInfo>> getDevicesInfos() async {
    MediaDevices devices = tau().getDevices();
    await tau().getDevices().getUserMedia(); // Necessary for the following enumerateDevices() !
    devicesInfos = await devices.enumerateDevices();
   //var nav = w.window.navigator;
    //var nav2 = h.window.navigator;
    //w.MediaDevices dev = nav.mediaDevices;
    //var dev2 = nav2.mediaDevices;

    //final mediaConstraints = <String, dynamic>{
      //'audio': true,
      //'video': true,
    //};

    //var x = nav!.enumerateDevices();
    //var x2 = nav2!.enumeratedDevices();

    //var y =  await dev!.enumerateDevices().toDart;
    //var yyy = y.toDart;

    //for (final toto in devicesInfos)
    //{
    //  print(toto.deviceId);
    //  print(toto.groupId);
    //  print(toto.kind);
    //  print(toto.label);
    //  print('');
    //}
    return devicesInfos;
    //var y2 =  await dev2!.enumerateDevices();

    //var z =  nav!.getUserMedia( // !!!!!!!!!!
    //  audio: true,
     //  video: true,
    //);
    /*
    var yy =  await dev!.getUserMedia(w.MediaStreamConstraints(  audio: true.toJS)).toDart; // !!!!!!!!!!!!!!!!
    //StreamController<dynamic> streamController = StreamController<dynamic>();
    //var mediaStream = w.MediaStream(3.toJS);
    /*var yy2 =  await dev2!.getUserMedia(mediaConstraints);*/
    var p1 = yy.id;
    var p2 = yy.active;
    var p3 = yy.onaddtrack;
    var p4 = yy.getAudioTracks().toDart;
    var p5 = yy.getTracks().toDart;
    var q1 = p4[0].id;
    var q2 = p4[0].kind;
    var q3 = p4[0].onended;
    var q4 = p4[0].enabled;

    var q5 = p4[0].getSettings().deviceId;
    var q6 = p4[0].getSettings().groupId;
    var q7 = p4[0].getSettings().sampleRate;
    var q8 = p4[0].getSettings().channelCount;
    var q9 = p4[0].getSettings().echoCancellation;



    var x =  await dev!.enumerateDevices().toDart;
    var xxx = x.toDart;
    //var x2 =  await dev2!.enumerateDevices();

    var a =  await dev!.enumerateDevices().toDart;
    var aaa = a.toDart;
    //var a2 =  await dev2!.enumerateDevices();
    for (final toto in aaa)
      {
        print(toto.deviceId);
        print(toto.groupId);
        print(toto.kind);
        print(toto.label);
        print('');
      }
*/
    /*
      for (let i = 0; i !== deviceInfos.length; ++i) {
        const deviceInfo = deviceInfos[i];
        const option = document.createElement('option');
        option.value = deviceInfo.deviceId;
        if (deviceInfo.kind === 'audioinput') {
          option.text = deviceInfo.label || `microphone ${audioInputSelect.length + 1}`;
          audioInputSelect.appendChild(option);
        }
      }
      selectors.forEach((select, selectorIndex) => {
        if (Array.prototype.slice.call(select.childNodes).some(n => n.value === values[selectorIndex])) {
          select.value = values[selectorIndex];
        }
      });
      */
  }



  Future<void> init() async
  {
    await tau().init();
    devicesInfos = await getDevicesInfos();
    //devicesInfo = [];
  }


  @override
  void initState() {
    super.initState();
    init().then ((e){setState(() {playDisabled = true;});});
  }

  void hitPlayButton() async {
    if (selectedDeviceIndex < 0)
    {
      return;
    }
    audioCtx = tau().newAudioContext();
    dest = audioCtx!.destination;
    var info = devicesInfos[selectedDeviceIndex];
    Map<String, Object> constraints = { 'deviceId' :  {'exact': info.deviceId}  };
    //{
    //    audio: {deviceId: audioSource ? {exact: audioSource} : undefined}
    //};
    var mediaStream = await tau().getDevices().getUserMediaWithConstraints(audio: constraints);
    var mic = audioCtx!.createMediaStreamSource(mediaStream);
    mic.connect(dest!);

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
    List<Widget> radioButtons()
    {
        List<Widget> r = [];
        int i = 0;
        for (MediaDeviceInfo info in devicesInfos)
        {
            if (info.kind == DeviceKind.audioinput)
            {
                r.add(



                      ColoredBox(
                         color: Colors.green,
                         child: Material(
                              child: ListTile(
                                title:  Text( info.label),
                                leading: Radio<int>(
                                    value: i,
                                    groupValue: selectedDeviceIndex,
                                    onChanged: (value) {
                                        setState(() {
                                          selectedDeviceIndex = value ?? -1;
                                          playDisabled = false;
                                        });
                                    },
                                ),
                              ),
                         )
                      )
                );

            }
            ++i;
        }
        return r;
    }

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
          Column( children: radioButtons(),)
        ]),
      );
    }

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Select the mic to use'),
        actions: const <Widget>[],
      ),
      body: makeBody(),
    );
  }
}
