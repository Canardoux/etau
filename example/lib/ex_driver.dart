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

import 'package:flutter/material.dart';
import 'display_graph.dart';

import 'BasicEx/from_buffer/from_buffer_ex.dart';
import 'BasicEx/from_url/from_url_ex.dart';
import 'BasicEx/from_mic/from_mic_ex.dart';
import 'BasicEx/from_processor/from_processor_ex.dart';
import 'BasicEx/from_oscillator/from_oscillator_ex.dart';
import 'BasicEx/from_constant/from_constant_ex.dart';
import 'BasicEx/from_selected_device/from_selected_device_ex.dart';
import 'BasicEx/from_asset/from_asset_ex.dart';
import 'BasicEx/from_async_proc/from_async_proc_ex.dart';
import 'BasicEx/to_speaker/to_speaker_ex.dart';
import 'BasicEx/to_selected_device/to_selected_device_ex.dart';
import 'BasicEx/threw_async_proc/threw_async_proc_ex.dart';
import 'BasicEx/to_url/to_url_ex.dart';

/*
import 'RustEx/stereo_panner/stereo_panner_ex.dart';
import 'MozillaEx/audio_basics/audio_basics_ex.dart';
import 'MozillaEx/audio_analyser/audio_analyser_ex.dart';
import 'MozillaEx/audio_buffer_source/audio_buffer_source_ex.dart';
import 'MozillaEx/audio_buffer/audio_buffer_ex.dart';
import 'MozillaEx/offline_audio_context/offline_audio_context_ex.dart';
import 'MozillaEx/loop/loop_ex.dart';
import 'MozillaEx/audio_worklet/audio_worklet_ex.dart';
import 'MozillaEx/iir_filter_node/iir_filter_node_ex.dart';
import 'MozillaEx/playback_rate/playback_rate_ex.dart';
import 'MozillaEx/audio_context_states/audio_context_states_ex.dart';
import 'MozillaEx/multi_track/multi_track_ex.dart';
import 'MozillaEx/output_timestamp/output_timestamp_ex.dart';
import 'MozillaEx/media_stream_destination/media_stream_destination_ex.dart';
*/
import 'MozillaEx/stereo_panner_node/stereo_panner_node_ex.dart';
/*
import 'MozillaEx/media_source_buffer/media_source_buffer_ex.dart';
import 'MozillaEx/audio_param/audio_param_ex.dart';
import 'MozillaEx/compressor/compressor_ex.dart';
import 'MozillaEx/script_processor/script_processor_ex.dart';
import 'MozillaEx/panner_node/panner_node_ex.dart';
import 'MozillaEx/offline_audio_context_promise/offline_audio_context_promise_ex.dart';
import 'MozillaEx/step_sequencer/step_sequencer_ex.dart';
*/
/*
    This APP is just a driver to call the various Tau examples.
    Please refer to the examples/README.md and all the examples located under the examples/lib directory.
*/

///
final List<Example> rustExampleTable = [
  /*
  Example(
      title: 'Stereo Panner',
      subTitle: 'Stereo Panner Example',
      flags: 0,
      route: (_) => const StereoPanner(),
      graphDir: 'stereo_panner',
      graphImage: 'StereoPanner',
      mod: 'Rust',
      description: '''This is an example from Web Audio Api Rust.
Un superbe example
'''),
*/
];

final List<Example> basicExampleTable = [
  Example(
      title: 'From Buffer',
      subTitle: 'Play From Asset Example',
      flags: 0,
      route: (_) => const FromBufferEx(),
      graphDir: 'from_buffer',
      graphImage: 'FromBuffer',
      mod: 'Basic',
      description: '''Shows How to playback from a buffer.
The buffer is loaded from an asset.
'''),
  Example(
      title: 'From URL',
      subTitle: 'Play From a remoteURL',
      flags: 0,
      route: (_) => const FromUrlEx(),
      graphDir: 'from_url',
      graphImage: 'FromUrl',
      mod: 'Basic',
      description: '''Shows How to playback from a file or a remote URL.
'''),
  Example(
      title: 'From Mic',
      subTitle: 'Play From microphone',
      flags: 0,
      route: (_) => const FromMicEx(),
      graphDir: 'from_mic',
      graphImage: 'FromMic',
      mod: 'Basic',
      description: '''Shows How to play from the microphone.
This is a loop between the mic and speaker.
This example shows the latency during processing.
'''),
  Example(
      title: 'From Processor',
      subTitle: 'Play From a custom processor',
      flags: 0,
      route: (_) => const FromProcessorEx(),
      graphDir: 'from_processor',
      graphImage: 'FromProcessor',
      mod: 'Basic',
      description: '''Shows How to play from a custom processor.
In this example the processor generates random noise.
'''),
  Example(
      title: 'From Oscillator',
      subTitle: 'Play From an oscillator',
      flags: 0,
      route: (_) => const FromOscillatorEx(),
      graphDir: 'from_oscillator',
      graphImage: 'FromOscillator',
      mod: 'Basic',
      description: '''Shows How to generate sound from an oscillator.
'''),
  Example(
      title: 'From Constant',
      subTitle: 'Play From a constant generator',
      flags: 0,
      route: (_) => const FromConstantEx(),
      graphDir: 'from_constant',
      graphImage: 'FromConstant',
      mod: 'Basic',
      description:
          '''A ConstantSourceNode is created to allow one slider control to change the gain on two GainNodes.
This code starts by creating the gain nodes and setting them and the volume control that will adjust their value all to 0.5. Then the ConstantSourceNode is created by calling AudioContext.createConstantSource(), and the gain parameters of each of the two gain nodes are connected to the ConstantSourceNode. After starting the constant source by calling its start() method. Finally, the two gain nodes are connected to the audio destination (typically speakers or headphones).
Now, whenever the value of constantNode.offset changes, the gain on both gainNode2 and gainNode3 will change to have that same value.
'''),
  Example(
      title: 'From Selected Device',
      subTitle: 'Play From a selected mic',
      flags: 0,
      route: (_) => const FromSelectedDeviceEx(),
      graphDir: 'from_selected_device',
      graphImage: 'FromSelectedDevice',
      mod: 'Basic',
      description:
          '''The user can select which input device (microphone) to use, and connect it to the destination (speaker)
'''),
  Example(
      title: 'From Asset',
      subTitle: 'Play From an asset',
      flags: 0,
      route: (_) => const FromAssetEx(),
      graphDir: 'from_asset',
      graphImage: 'FromAsset',
      mod: 'Basic',
      description: '''Play from an asset file.
'''),
  Example(
      title: 'From Async Processor',
      subTitle: 'Play From an asynchronous processor',
      flags: 0,
      route: (_) => const FromAsyncProcEx(),
      graphDir: 'from_Async_proc',
      graphImage: 'FromAsyncProc',
      mod: 'Basic',
      description: '''Play from an asynchronous processor.
'''),
  Example(
      title: 'To Speaker',
      subTitle: 'Play to the default speaker',
      flags: 0,
      route: (_) => const ToSpeakerEx(),
      graphDir: 'to_speaker',
      graphImage: 'ToSpeaker',
      mod: 'Basic',
      description: '''Play to the default speaker.
'''),
  Example(
      title: 'To Selected Device',
      subTitle: 'Play to the selected device',
      flags: 0,
      route: (_) => const ToSelectedDeviceEx(),
      graphDir: 'to_selected_device',
      graphImage: 'ToSelectedDevice',
      mod: 'Basic',
      description: '''Play to the selected device.
'''),
  Example(
      title: 'Threw Async Processor',
      subTitle: 'Play threw a dart async processor',
      flags: 0,
      route: (_) => const ThrewAsyncProcEx(),
      graphDir: 'threw_async_proc',
      graphImage: 'ThrewAsyncProc',
      mod: 'Basic',
      description: '''Play threw a dart async processor.
'''),

  Example(
      title: 'To URL',
      subTitle: 'Play to a URL',
      flags: 0,
      route: (_) => const ToUrlEx(),
      graphDir: 'to_url',
      graphImage: 'ToUrl',
      mod: 'Basic',
      description: '''Play to a URL.
'''),
];

final List<Example> mozillaExampleTable = [
  /*
  Example(
      title: 'Simples',
      subTitle: 'Mozilla Audio-basics Example',
      flags: 0,
      route: (_) => const AudioBasics(),
      mod: 'Mozilla',
      graphDir: 'audio_basics',
      graphImage: 'AudioBasics',
      description: '''This is an example from mozilla.
'''),
  Example(
      title: 'Audio Analyser',
      subTitle: 'Audio Analyser Example',
      flags: 0,
      route: (_) => const AudioAnalyserEx(),
      graphDir: 'audio_analyser',
      graphImage: 'AudioAnalyser',
      mod: 'Mozilla',
      description: '''This is an other example from Mozilla.
'''),
  Example(
      title: 'Audio Buffer Source',
      subTitle: 'Audio Buffer Source Node Example',
      flags: 0,
      route: (_) => const AudioBufferSourceEx(),
      graphDir: 'audio_buffer_source',
      graphImage: 'AudioBufferSource',
      mod: 'Mozilla',
      description: '''This is an other example from Mozilla.
'''),
  Example(
      title: 'Audio Buffer',
      subTitle: 'Play from an Audio Buffer',
      flags: 0,
      route: (_) => const AudioBufferEx(),
      graphDir: 'audio_buffer',
      graphImage: 'AudioBuffer',
      mod: 'Mozilla',
      description: '''This is an other example from Mozilla.
'''),
  Example(
      title: 'Loop Playback',
      subTitle: 'looping a track',
      flags: 0,
      route: (_) => const LoopEx(),
      graphDir: 'loop',
      graphImage: 'Loop',
      mod: 'Mozilla',
      description: '''This is an other example from Mozilla.
'''),
  Example(
      title: 'Audio Worklet',
      subTitle: 'Worklet Example',
      flags: 0,
      route: (_) => const AudioWorkletEx(),
      graphDir: 'audio_worklet',
      graphImage: 'AudioWorklet',
      mod: 'Mozilla',
      description: '''This is an other example from Mozilla.
'''),
  Example(
      title: 'IIR Filter Node',
      subTitle: 'IIR Filter Node Example',
      flags: 0,
      route: (_) => const IirFilterNodeEx(),
      graphDir: 'iir_filter_node',
      graphImage: 'IirFilterNode',
      mod: 'Mozilla',
      description: '''This is an other example from Mozilla.
'''),
  Example(
      title: 'Playback Rate',
      subTitle: 'Playback Rate Example',
      flags: 0,
      route: (_) => const PlaybackRateEx(),
      graphDir: 'playback_rate',
      graphImage: 'PlaybackRate',
      mod: 'Mozilla',
      description: '''This is an other example from Mozilla.
'''),
  Example(
      title: 'Offline Audio Context',
      subTitle: 'Offline Audio Context Example',
      flags: 0,
      route: (_) => const OfflineAudioContextEx(),
      graphDir: 'offline_audio_context',
      graphImage: 'OfflineAudioContext',
      mod: 'Mozilla',
      description: '''This is an other example from Mozilla.
'''),
  Example(
      title: 'Audio Context States',
      subTitle: 'Audio Context States Example',
      flags: 0,
      route: (_) => const AudioContextStatesEx(),
      graphDir: 'audio_context_states',
      graphImage: 'AudioContextStates',
      mod: 'Mozilla',
      description: '''This is an other example from Mozilla.
'''),
  Example(
      title: 'Multi Track',
      subTitle: 'Multi track Example',
      flags: 0,
      route: (_) => const MultiTrackEx(),
      graphDir: 'multi_track',
      graphImage: 'MultiTrack',
      mod: 'Mozilla',
      description: '''This is an other example from Mozilla.
'''),
  Example(
      title: 'Output Timestamp',
      subTitle: 'Output Timestamp Example',
      flags: 0,
      route: (_) => const OutputTimestampEx(),
      graphDir: 'output_timestamp',
      graphImage: 'OutputTimestamp',
      mod: 'Mozilla',
      description: '''This is an other example from Mozilla.
'''),
  Example(
      title: 'Media Stream Destination',
      subTitle: 'Create Media Stream Destination Example',
      flags: 0,
      route: (_) => const MediaStreamDestinationEx(),
      graphDir: 'media_stream_destination',
      graphImage: 'MediaStreamDestination',
      mod: 'Mozilla',
      description: '''This is an other example from Mozilla.
'''),
*/

  Example(
      title: 'Stereo Panner Node',
      subTitle: 'Stereo Panner Node Example',
      flags: 0,
      route: (_) => const StereoPannerNodeEx(),
      graphDir: 'stereo_panner_node',
      graphImage: 'StereoPannerNode',
      mod: 'Mozilla',
      description: '''This is an other example from Mozilla.
'''),
/*
  Example(
      title: 'Stereo Panner Node from html_audio_element',
      subTitle: 'Stereo Panner Node Example',
      flags: 0,
      route: (_) => const StereoPannerNodeFromAudioElementEx(),
      graphDir: 'stereo_panner_node_from_html_audio_element',
      graphImage: 'StereoPannerNodeFromAudioElement',
      mod: 'Mozilla',
      description: '''This is an other example from Mozilla.
'''),

  Example(
      title: 'Stream Source',
      subTitle: 'Stream Source Example',
      flags: 0,
      route: (_) => const StreamSourceEx(),
      graphDir: 'stream_source',
      graphImage: 'StreamSource',
      mod: 'Mozilla',
      description: '''This is an other example from Mozilla.
'''),


  Example(
      title: 'Media Source Buffer',
      subTitle: 'Media Source Buffer Example',
      flags: 0,
      route: (_) => const MediaSourceBufferEx(),
      graphDir: 'media_source_buffer',
      graphImage: 'MediaSourceBuffer',
      mod: 'Mozilla',
      description: '''This is an other example from Mozilla.
'''),
  Example(
      title: 'Audio Param',
      subTitle: 'Audio Param Example',
      flags: 0,
      route: (_) => const AudioParamEx(),
      graphDir: 'audio_param',
      graphImage: 'AudioParam',
      mod: 'Mozilla',
      description: '''This is an other example from Mozilla.
'''),
  Example(
      title: 'Compressor',
      subTitle: 'Compressor Example',
      flags: 0,
      route: (_) => const CompressorEx(),
      graphDir: 'compressor',
      graphImage: 'Compressor',
      mod: 'Mozilla',
      description: '''This is an other example from Mozilla.
'''),
  Example(
      title: 'Script Processor',
      subTitle: 'Script processor Example',
      flags: 0,
      route: (_) => const ScriptProcessorEx(),
      graphDir: 'script_processor',
      graphImage: 'ScriptProcessor',
      mod: 'Mozilla',
      description: '''This is an other example from Mozilla.
'''),
  Example(
      title: 'Panner Node',
      subTitle: 'panner Node Example',
      flags: 0,
      route: (_) => const PannerNodeEx(),
      graphDir: 'panner_node',
      graphImage: 'PannerNode',
      mod: 'Mozilla',
      description: '''This is an other example from Mozilla.
'''),
  Example(
      title: 'Offline Audio Context Promise',
      subTitle: 'Offline Audio Context Promise',
      flags: 0,
      route: (_) => const OfflineAudioContextPromiseEx(),
      graphDir: 'offline_audio_context_promise',
      graphImage: 'OfflineAudioContextPromise',
      mod: 'Mozilla',
      description: '''This is an other example from Mozilla.
'''),
  Example(
      title: 'Step Sequencer',
      subTitle: 'Step Sequencer Example',
      flags: 0,
      route: (_) => const StepSequencerEx(),
      graphDir: 'step_sequencer',
      graphImage: 'StepSequencer',
      mod: 'Mozilla',
      description: '''This is an other example from Mozilla.
'''),
*/
];

///
class Example {
  ///
  final String? title;

  ///
  final String? subTitle;

  ///
  final String? description;

  ///
  final WidgetBuilder? route;

  ///
  final int? flags;

  ///
  final String? graphDir;

  ///
  final String? graphImage;

  final String? mod;

  ///
  /* ctor */ Example(
      {this.title,
      this.subTitle,
      this.description,
      this.flags,
      this.route,
      this.graphDir,
      this.graphImage,
      this.mod});

  ///
  void go(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute<void>(builder: route!),
      );

  void displayGraph(BuildContext context) => Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => DisplayGraph(
          mod,
          graphDir,
          graphImage,
        ),
      ));
}

class ExDriver extends StatefulWidget {
  final String mod;

  const ExDriver({super.key, required this.mod});
  @override
  State<ExDriver> createState() => _ExDriverState();
}

class _ExDriverState extends State<ExDriver> {
  ///
  List<Example> exampleTable = rustExampleTable;

  Example? selectedExample;

  // This widget is the root of your application.
  @override
  void initState() {
    switch (widget.mod) {
      case 'Rust':
        exampleTable = rustExampleTable;
      case 'Mozilla':
        exampleTable = mozillaExampleTable;
      case 'Basic':
        exampleTable = basicExampleTable;
    }
    selectedExample = exampleTable[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget cardBuilder(BuildContext context, int index) {
      var isSelected = (exampleTable[index] == selectedExample);
      return GestureDetector(
        onTap: () => setState(() {
          selectedExample = exampleTable[index];
        }),
        child: Card(
          shape: const RoundedRectangleBorder(),
          borderOnForeground: false,
          elevation: 3.0,
          child: Container(
            height: 55,
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: isSelected ? Colors.indigo : const Color(0xFFFAF0E6),
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
            ),

            //color: isSelected ? Colors.indigo : Colors.cyanAccent,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(exampleTable[index].title!,
                  style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black)),
              Text(exampleTable[index].subTitle!,
                  style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black)),
            ]),
          ),
        ),
      );
    }

    Widget makeBody() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: const Color(0xFFFAF0E6),
                border: Border.all(
                  color: Colors.indigo,
                  width: 3,
                ),
              ),
              child: ListView.builder(
                  itemCount: exampleTable.length, itemBuilder: cardBuilder),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: const Color(0xFFFAF0E6),
                border: Border.all(
                  color: Colors.indigo,
                  width: 3,
                ),
              ),
              child: SingleChildScrollView(
                child: Text(selectedExample!.description!),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('${widget.mod} Examples'),
      ),
      body: makeBody(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Container(
            margin: const EdgeInsets.all(3),
            padding: const EdgeInsets.all(3),
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFFAF0E6),
              border: Border.all(
                color: Colors.indigo,
                width: 3,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () => selectedExample!.displayGraph(context),
                  //color: Colors.indigo,
                  child: const Text(
                    'Show Graph',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () => selectedExample!.go(context),
                  //color: Colors.indigo,
                  child: const Text(
                    'GO',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
