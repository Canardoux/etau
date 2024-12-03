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

import 'etau_class.dart';
import 'package:logger/logger.dart' as log;

abstract class TauInterface {
// =================================================================================================
//                          Specific to τ
// =================================================================================================

  Future<void> init([log.Level loglevel = log.Level.debug]);

  log.Logger logger();

  MediaDevices getDevices();

// =================================================================================================
//                          Web Audio API factories
// =================================================================================================

  AudioContext newAudioContext([AudioContextOptions contextOptions]);

  AudioContextOptions newAudioContextOptions({
    TauAny latencyHint,
    TauSampleRate sampleRate,
    TauAny sinkId,
    TauAny renderSizeHint,
  });

  // TODO AudioSinkOptions newAudioSinkOptions({required AudioSinkType type});

  AudioTimestamp newAudioTimestamp({
    TauTime contextTime,
    TauHighResTimeStamp performanceTime,
  });

  OfflineAudioContext newOfflineAudioContext(
    TauAny contextOptionsOrNumberOfChannels, [
    int length,
    TauSampleRate sampleRate,
  ]);

  /*
  OfflineAudioContextOptions newOfflineAudioContextOptions({
    int numberOfChannels,
    required int length,
    required TauSampleRate sampleRate,
    TauAny renderSizeHint,
  });

   */
/*
  OfflineAudioCompletionEvent newOfflineAudioCompletionEvent(
    String type,
    OfflineAudioCompletionEventInit eventInitDict,
  );
*/

  /*
  OfflineAudioCompletionEventInit newOfflineAudioCompletionEventInit({
    bool bubbles,
    bool cancelable,
    bool composed,
    required AudioBuffer renderedBuffer,
  });

   */

  AudioBuffer newAudioBuffer(AudioBufferOptions options);

  AudioBufferOptions newAudioBufferOptions({
    int numberOfChannels,
    required int length,
    required TauSampleRate sampleRate,
  });

  AudioNodeOptions newAudioNodeOptions({
    int channelCount,
    ChannelCountMode channelCountMode,
    ChannelInterpretation channelInterpretation,
  });

  AnalyserNode newAnalyserNode(
    BaseAudioContext context, [
    AnalyserOptions options,
  ]);

  AnalyserOptions newAnalyserOptions({
    int channelCount,
    ChannelCountMode channelCountMode,
    ChannelInterpretation channelInterpretation,
    int fftSize,
    num maxDecibels,
    num minDecibels,
    TauTime smoothingTimeConstant,
  });

  AudioBufferSourceNode newAudioBufferSourceNode(
    BaseAudioContext context, [
    AudioBufferSourceOptions options,
  ]);

  AudioBufferSourceOptions newAudioBufferSourceOptions({
    AudioBuffer? buffer,
    num detune,
    bool loop,
    num loopEnd,
    num loopStart,
    num playbackRate,
  });

  AudioProcessingEvent newAudioProcessingEvent(
    String type,
    AudioProcessingEventInit eventInitDict,
  );


  /*
  AudioProcessingEventInit newAudioProcessingEventInit({
    bool bubbles,
    bool cancelable,
    bool composed,
    required TauTime playbackTime,
    required AudioBuffer inputBuffer,
    required AudioBuffer outputBuffer,
  });

   */

  BiquadFilterNode newBiquadFilterNode(
    BaseAudioContext context, [
    BiquadFilterOptions options,
  ]);

  BiquadFilterOptions newBiquadFilterOptions({
    int channelCount,
    ChannelCountMode channelCountMode,
    ChannelInterpretation channelInterpretation,
    BiquadFilterType type,
    num Q,
    num detune,
    num frequency,
    num gain,
  });

  ChannelMergerNode newChannelMergerNode(
    BaseAudioContext context, [
    ChannelMergerOptions options,
  ]);

  ChannelMergerOptions newChannelMergerOptions({
    int channelCount,
    ChannelCountMode channelCountMode,
    ChannelInterpretation channelInterpretation,
    int numberOfInputs,
  });

  ChannelSplitterNode newChannelSplitterNode(
    BaseAudioContext context, [
    ChannelSplitterOptions options,
  ]);

  ChannelSplitterOptions newChannelSplitterOptions({
    int channelCount,
    ChannelCountMode channelCountMode,
    ChannelInterpretation channelInterpretation,
    int numberOfOutputs,
  });

  ConstantSourceNode newConstantSourceNode(
    BaseAudioContext context, [
    ConstantSourceOptions options,
  ]);

  ConstantSourceOptions newConstantSourceOptions({num offset});
  ConvolverNode newConvolverNode(
    BaseAudioContext context, [
    ConvolverOptions options,
  ]);

  ConvolverOptions newConvolverOptions({
    int channelCount,
    ChannelCountMode channelCountMode,
    ChannelInterpretation channelInterpretation,
    AudioBuffer? buffer,
    bool disableNormalization,
  });

  DelayNode newDelayNode(
    BaseAudioContext context, [
    DelayOptions options,
  ]);

  DelayOptions newDelayOptions({
    int channelCount,
    ChannelCountMode channelCountMode,
    ChannelInterpretation channelInterpretation,
    TauTime maxDelayTime,
    TauTime delayTime,
  });

  DynamicsCompressorNode newDynamicsCompressorNode(
    BaseAudioContext context, [
    DynamicsCompressorOptions options,
  ]);

  DynamicsCompressorOptions newDynamicsCompressorOptions({
    int channelCount,
    ChannelCountMode channelCountMode,
    ChannelInterpretation channelInterpretation,
    num attack,
    num knee,
    num ratio,
    num release,
    num threshold,
  });

  GainNode newGainNode(
    BaseAudioContext context, [
    GainOptions options,
  ]);

  GainOptions newGainOptions({
    int channelCount,
    ChannelCountMode channelCountMode,
    ChannelInterpretation channelInterpretation,
    num gain,
  });

  IIRFilterNode newIIRFilterNode(
    BaseAudioContext context,
    IIRFilterOptions options,
  );

  IIRFilterOptions newIIRFilterOptions({
    int channelCount,
    ChannelCountMode channelCountMode,
    ChannelInterpretation channelInterpretation,
    required TauArray<TauNumber> feedforward,
    required TauArray<TauNumber> feedback,
  });

  MediaElementAudioSourceNode newMediaElementAudioSourceNode(
    AudioContext context,
    MediaElementAudioSourceOptions options,
  );

  MediaElementAudioSourceOptions newMediaElementAudioSourceOptions(
      {required MediaElement mediaElement});

  MediaStreamAudioDestinationNode newMediaStreamAudioDestinationNode(
    AudioContext context, [
    AudioNodeOptions options,
  ]);

  MediaStreamAudioSourceNode newMediaStreamAudioSourceNode(
    AudioContext context,
    MediaStreamAudioSourceOptions options,
  );

  MediaStreamAudioSourceOptions newMediaStreamAudioSourceOptions(
      {required MediaStream mediaStream});

  MediaStreamTrackAudioSourceNode newMediaStreamTrackAudioSourceNode(
    AudioContext context,
    MediaStreamTrackAudioSourceOptions options,
  );

  MediaStreamTrackAudioSourceOptions newMediaStreamTrackAudioSourceOptions(
      {required MediaStreamTrack mediaStreamTrack});

  OscillatorNode newOscillatorNode(
    BaseAudioContext context, [
    OscillatorOptions options,
  ]);

  OscillatorOptions newOscillatorOptions({
    int channelCount,
    ChannelCountMode channelCountMode,
    ChannelInterpretation channelInterpretation,
    OscillatorType type,
    num frequency,
    num detune,
    PeriodicWave periodicWave,
  });

  PannerNode newPannerNode(
    BaseAudioContext context, [
    PannerOptions options,
  ]);

  PannerOptions newPannerOptions({
    int channelCount,
    ChannelCountMode channelCountMode,
    ChannelInterpretation channelInterpretation,
    PanningModelType panningModel,
    DistanceModelType distanceModel,
    num positionX,
    num positionY,
    num positionZ,
    num orientationX,
    num orientationY,
    num orientationZ,
    num refDistance,
    num maxDistance,
    num rolloffFactor,
    num coneInnerAngle,
    num coneOuterAngle,
    num coneOuterGain,
  });

  PeriodicWave newPeriodicWave(
    BaseAudioContext context, [
    PeriodicWaveOptions options,
  ]);

  PeriodicWaveConstraints newPeriodicWaveConstraints(
      {bool disableNormalization});

  PeriodicWaveOptions newPeriodicWaveOptions({
    bool disableNormalization,
    TauArray<TauNumber> real,
    TauArray<TauNumber> imag,
  });

  StereoPannerNode newStereoPannerNode(
    BaseAudioContext context, [
    StereoPannerOptions options,
  ]);

  StereoPannerOptions newStereoPannerOptions({
    int channelCount,
    ChannelCountMode channelCountMode,
    ChannelInterpretation channelInterpretation,
    num pan,
  });

  WaveShaperNode newWaveShaperNode(
    BaseAudioContext context, [
    WaveShaperOptions options,
  ]);

  WaveShaperOptions newWaveShaperOptions({
    int channelCount,
    ChannelCountMode channelCountMode,
    ChannelInterpretation channelInterpretation,
    TauArray<TauNumber> curve,
    OverSampleType oversample,
  });

  AudioWorkletNode newAudioWorkletNode(
    BaseAudioContext context,
    String name, [
    AudioWorkletNodeOptions options,
  ]);

  AudioWorkletNodeOptions newAudioWorkletNodeOptions({
    int channelCount,
    ChannelCountMode channelCountMode,
    ChannelInterpretation channelInterpretation,
    int numberOfInputs,
    int numberOfOutputs,
    TauArray<int> outputChannelCount,
    ParameterData parameterData,
    ProcessorOptions processorOptions,
  });

  AudioWorkletProcessor newAudioWorkletProcessor();

  AsyncWorkletNode newAsyncWorkletNode(BaseAudioContext context, String name,
      [AudioWorkletNodeOptions opt]);

  ParameterData newParameterData(Map<String, dynamic> m);

  ProcessorOptions newProcessorOptions(Map<String, dynamic> m);

// =================================================================================================
//                          Added because of Tau_web
// =================================================================================================

  MediaStream newMediaStream();

  MediaElement newMediaElement({
    required String src,
  });

  MediaRecorder newMediaRecorder(
    MediaStream stream,
    String type, [
    MediaRecorderOptions options,
  ]);

  MediaRecorderOptions newMediaRecorderOptions({
    String mimeType,
    int audioBitsPerSecond,
    int videoBitsPerSecond,
    int bitsPerSecond,
    BitrateMode audioBitrateMode,
    Duration videoKeyFrameIntervalDuration,
    int videoKeyFrameIntervalCount,
  });
}
