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

// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
//
// API docs from [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web).
// Attributions and copyright licensing by Mozilla Contributors is licensed
// under [CC-BY-SA 2.5](https://creativecommons.org/licenses/by-sa/2.5/.

// Generated from Web IDL definitions.

// ignore_for_file: unintended_html_in_doc_comment

library;

import 'dart:typed_data';

typedef TauSampleRate = double;
typedef TauTime = int;
typedef TauAny = Object;
typedef TauNumber = num;
typedef TauArray<T> = List<T>;
typedef TauPromise<T> = Future<T>;
typedef TauArrayBuffer = ByteBuffer;
typedef TauFloat32Array = Float32List;
typedef TauObject = Object;
typedef TauUint8Array = Uint8List;
typedef TauHighResTimeStamp = double;
typedef RecordingState = String; // Enum
typedef BitrateMode = String;
typedef DOMHighResTimeStamp = int;
typedef BlobPart = TauAny;
typedef EndingType = String;
typedef EventHandler = void Function();
typedef DataEventHandler = void Function(Float32List);
typedef DecodeErrorCallback = void Function();
typedef DecodeSuccessCallback = void Function();
typedef AudioWorkletProcessorConstructor = void Function();
typedef OnAudioBufferUnderflowFn = void Function(int outputNo);
typedef OnReceiveDataFn = void Function(int inputNo, List<Float32List> data);
typedef OnDataAvailableFn = void Function(Float32List data);
typedef AudioContextState = String;
typedef AudioContextRenderSizeCategory = String;
typedef AudioContextLatencyCategory = String;
typedef AudioSinkType = String;
typedef ChannelCountMode = String;
typedef ChannelInterpretation = String;
typedef AutomationRate = String;
typedef BiquadFilterType = String;
typedef OscillatorType = String;
typedef PanningModelType = String;
typedef DistanceModelType = String;
typedef OverSampleType = String;

// ------------------------------------------------------------------------------------------------------------------

/// The `BaseAudioContext` of the
/// [Web Audio API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API)
/// acts as a base definition for online and offline audio-processing graphs, as
/// represented by [AudioContext] and [OfflineAudioContext] respectively. You
/// wouldn't use `BaseAudioContext` directly — you'd use its features via one of
/// these two inheriting interfaces.
///
/// A `BaseAudioContext` can be a target of events, therefore it implements the
/// [EventTarget] interface.
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/BaseAudioContext).
abstract class BaseAudioContext implements EventTarget {
  /// The `createAnalyser()` method of the
  /// [BaseAudioContext] creates an [AnalyserNode], which
  /// can be used to expose audio time and frequency data and create data
  /// visualizations.
  ///
  /// > **Note:** The [AnalyserNode.AnalyserNode] constructor is the
  /// > recommended way to create an [AnalyserNode]; see
  /// > [Creating an AudioNode](https://developer.mozilla.org/en-US/docs/Web/API/AudioNode#creating_an_audionode).
  ///
  /// > **Note:** For more on using this node, see the
  /// > [AnalyserNode] page.
  AnalyserNode createAnalyser();

  /// The `createBiquadFilter()` method of the [BaseAudioContext]
  /// creates a [BiquadFilterNode], which represents a second order
  /// filter configurable as several different common filter types.
  ///
  /// > **Note:** The [BiquadFilterNode.BiquadFilterNode] constructor is the
  /// > recommended way to create a [BiquadFilterNode]; see
  /// > [Creating an AudioNode](https://developer.mozilla.org/en-US/docs/Web/API/AudioNode#creating_an_audionode).
  BiquadFilterNode createBiquadFilter();

  /// The `createBuffer()` method of the [BaseAudioContext]
  /// is used to create a new, empty [AudioBuffer] object, which
  /// can then be populated by data, and played via an [AudioBufferSourceNode].
  ///
  /// For more details about audio buffers, check out the [AudioBuffer]
  /// reference page.
  ///
  /// > **Note:** `createBuffer()` used to be able to take compressed
  /// > data and give back decoded samples, but this ability was removed from
  /// > the specification,
  /// > because all the decoding was done on the main thread, so
  /// > `createBuffer()` was blocking other code execution. The asynchronous
  /// > method
  /// > `decodeAudioData()` does the same thing — takes compressed audio, such
  /// > as an
  /// > MP3 file, and directly gives you back an [AudioBuffer] that you can
  /// > then play via an [AudioBufferSourceNode]. For simple use cases
  /// > like playing an MP3, `decodeAudioData()` is what you should be using.
  AudioBuffer createBuffer(
    int numberOfChannels,
    int length,
    TauSampleRate sampleRate,
  );

  /// The `createBufferSource()` method of the [BaseAudioContext]
  /// is used to create a new [AudioBufferSourceNode], which can be
  /// used to play audio data contained within an [AudioBuffer] object.
  /// [AudioBuffer]s are created using [BaseAudioContext.createBuffer] or
  /// returned by [BaseAudioContext.decodeAudioData] when it successfully
  /// decodes an audio track.
  ///
  /// > **Note:** The [AudioBufferSourceNode.AudioBufferSourceNode]
  /// > constructor is the recommended way to create a [AudioBufferSourceNode];
  /// > see
  /// > [Creating an AudioNode](https://developer.mozilla.org/en-US/docs/Web/API/AudioNode#creating_an_audionode).
  AudioBufferSourceNode createBufferSource();

  /// The `createChannelMerger()` method of the [BaseAudioContext] interface
  /// creates a [ChannelMergerNode],
  /// which combines channels from multiple audio streams into a single audio
  /// stream.
  ///
  /// > **Note:** The [ChannelMergerNode.ChannelMergerNode] constructor is the
  /// > recommended way to create a [ChannelMergerNode]; see
  /// > [Creating an AudioNode](https://developer.mozilla.org/en-US/docs/Web/API/AudioNode#creating_an_audionode).
  ChannelMergerNode createChannelMerger([int numberOfInputs]);

  /// The `createChannelSplitter()` method of the [BaseAudioContext] Interface
  /// is used to create a [ChannelSplitterNode],
  /// which is used to access the individual channels of an audio stream and
  /// process them separately.
  ///
  /// > **Note:** The [ChannelSplitterNode.ChannelSplitterNode]
  /// > constructor is the recommended way to create a [ChannelSplitterNode];
  /// > see
  /// > [Creating an AudioNode](https://developer.mozilla.org/en-US/docs/Web/API/AudioNode#creating_an_audionode).
  ChannelSplitterNode createChannelSplitter([int numberOfOutputs]);

  /// The **`createConstantSource()`**
  /// property of the [BaseAudioContext] creates a
  /// [ConstantSourceNode] object, which is an audio source that continuously
  /// outputs a monaural (one-channel) sound signal whose samples all have the
  /// same
  /// value.
  ///
  /// > **Note:** The [ConstantSourceNode.ConstantSourceNode]
  /// > constructor is the recommended way to create a [ConstantSourceNode]; see
  /// > [Creating an AudioNode](https://developer.mozilla.org/en-US/docs/Web/API/AudioNode#creating_an_audionode).
  ConstantSourceNode createConstantSource();

  /// The `createConvolver()` method of the [BaseAudioContext]
  /// creates a [ConvolverNode], which is commonly used to apply
  /// reverb effects to your audio. See the
  /// [spec definition of Convolution](https://webaudio.github.io/web-audio-api/#background-3)
  /// for more information.
  ///
  /// > **Note:** The [ConvolverNode.ConvolverNode]
  /// > constructor is the recommended way to create a [ConvolverNode]; see
  /// > [Creating an AudioNode](https://developer.mozilla.org/en-US/docs/Web/API/AudioNode#creating_an_audionode).
  ConvolverNode createConvolver();

  /// The `createDelay()` method of the
  /// [BaseAudioContext] is used to create a [DelayNode],
  /// which is used to delay the incoming audio signal by a certain amount of
  /// time.
  ///
  /// > **Note:** The [DelayNode.DelayNode]
  /// > constructor is the recommended way to create a [DelayNode]; see
  /// > [Creating an AudioNode](https://developer.mozilla.org/en-US/docs/Web/API/AudioNode#creating_an_audionode).
  DelayNode createDelay([TauTime maxDelayTime]);

  /// The `createDynamicsCompressor()` method of the [BaseAudioContext]
  /// is used to create a [DynamicsCompressorNode], which can be used
  /// to apply compression to an audio signal.
  ///
  /// Compression lowers the volume of the loudest parts of the signal and
  /// raises the volume
  /// of the softest parts. Overall, a louder, richer, and fuller sound can be
  /// achieved. It is
  /// especially important in games and musical applications where large numbers
  /// of individual
  /// sounds are played simultaneously, where you want to control the overall
  /// signal level and
  /// help avoid clipping (distorting) of the audio output.
  ///
  /// > **Note:** The [DynamicsCompressorNode.DynamicsCompressorNode]
  /// > constructor is the recommended way to create a [DynamicsCompressorNode];
  /// > see
  /// > [Creating an AudioNode](https://developer.mozilla.org/en-US/docs/Web/API/AudioNode#creating_an_audionode).
  DynamicsCompressorNode createDynamicsCompressor();

  /// The `createGain()` method of the [BaseAudioContext]
  /// creates a [GainNode], which can be used to control the
  /// overall gain (or volume) of the audio graph.
  ///
  /// > **Note:** The [GainNode.GainNode]
  /// > constructor is the recommended way to create a [GainNode]; see
  /// > [Creating an AudioNode](https://developer.mozilla.org/en-US/docs/Web/API/AudioNode#creating_an_audionode).
  GainNode createGain();

  /// The **`createIIRFilter()`** method of the [BaseAudioContext] interface
  /// creates an [IIRFilterNode], which represents a general
  /// **[infinite impulse response](https://en.wikipedia.org/wiki/Infinite_impulse_response)**
  /// (IIR) filter which can be configured to serve as various types of filter.
  ///
  /// > **Note:** The [IIRFilterNode.IIRFilterNode]
  /// > constructor is the recommended way to create a [IIRFilterNode]; see
  /// > [Creating an AudioNode](https://developer.mozilla.org/en-US/docs/Web/API/AudioNode#creating_an_audionode).
  IIRFilterNode createIIRFilter(
    List<double> feedforward,
    List<double> feedback,
  );

  /// The `createOscillator()` method of the [BaseAudioContext]
  /// creates an [OscillatorNode], a source representing a periodic
  /// waveform. It basically generates a constant tone.
  ///
  /// > **Note:** The [OscillatorNode.OscillatorNode]
  /// > constructor is the recommended way to create a [OscillatorNode]; see
  /// > [Creating an AudioNode](https://developer.mozilla.org/en-US/docs/Web/API/AudioNode#creating_an_audionode).
  OscillatorNode createOscillator();

  /// The `createPanner()` method of the [BaseAudioContext]
  /// is used to create a new [PannerNode], which is used to
  /// spatialize an incoming audio stream in 3D space.
  ///
  /// The panner node is spatialized in relation to the AudioContext's
  /// [AudioListener] (defined by the [BaseAudioContext.listener]
  /// attribute), which represents the position and orientation of the person
  /// listening to the
  /// audio.
  ///
  /// > **Note:** The [PannerNode.PannerNode]
  /// > constructor is the recommended way to create a [PannerNode]; see
  /// > [Creating an AudioNode](https://developer.mozilla.org/en-US/docs/Web/API/AudioNode#creating_an_audionode).
  PannerNode createPanner();

  /// The `createPeriodicWave()` method of the [BaseAudioContext] Interface
  /// is used to create a [PeriodicWave], which is used to define a periodic
  /// waveform
  /// that can be used to shape the output of an [OscillatorNode].
  PeriodicWave createPeriodicWave(
    Float32List real,
    Float32List imag, [
    PeriodicWaveConstraints constraints,
  ]);

  // TODO ! AudioWorkletNode createAudioWorkletNode();

  /// The `createScriptProcessor()` method of the [BaseAudioContext] interface
  /// creates a [ScriptProcessorNode] used for direct audio processing.
  ///
  /// > **Note:** This feature was replaced by
  /// > [AudioWorklets](https://developer.mozilla.org/en-US/docs/Web/API/AudioWorklet)
  /// > and the [AudioWorkletNode] interface.
  ScriptProcessorNode createScriptProcessor([
    int bufferSize,
    int numberOfInputChannels,
    int numberOfOutputChannels,
  ]);

  /// The `createStereoPanner()` method of the [BaseAudioContext] interface
  /// creates a [StereoPannerNode], which can be used to apply
  /// stereo panning to an audio source.
  /// It positions an incoming audio stream in a stereo image using a
  /// [low-cost panning algorithm](https://webaudio.github.io/web-audio-api/#stereopanner-algorithm).
  ///
  /// > **Note:** The [StereoPannerNode.StereoPannerNode]
  /// > constructor is the recommended way to create a [StereoPannerNode]; see
  /// > [Creating an AudioNode](https://developer.mozilla.org/en-US/docs/Web/API/AudioNode#creating_an_audionode).
  StereoPannerNode createStereoPanner();

  /// The `createWaveShaper()` method of the [BaseAudioContext]
  /// creates a [WaveShaperNode], which represents a non-linear
  /// distortion. It is used to apply distortion effects to your audio.
  ///
  /// > **Note:** The [WaveShaperNode.WaveShaperNode]
  /// > constructor is the recommended way to create a [WaveShaperNode]; see
  /// > [Creating an AudioNode](https://developer.mozilla.org/en-US/docs/Web/API/AudioNode#creating_an_audionode).
  WaveShaperNode createWaveShaper();

  /// The `decodeAudioData()` method of the [BaseAudioContext]
  /// is used to asynchronously decode audio file data contained in an
  /// `ArrayBuffer` that is loaded from [fetch],
  /// [XMLHttpRequest], or [FileReader]. The decoded
  /// [AudioBuffer] is resampled to the [AudioContext]'s sampling
  /// rate, then passed to a callback or promise.
  ///
  /// This is the preferred method of creating an audio source for Web Audio API
  /// from an
  /// audio track. This method only works on complete file data, not fragments
  /// of audio file
  /// data.
  ///
  /// This function implements two alternative ways to asynchronously return the
  /// audio data or error messages: it returns a `Promise` that fulfills with
  /// the audio data, and also accepts callback arguments to handle success or
  /// failure. The primary method of interfacing with this function is via its
  /// Promise return value, and the callback parameters are provided for legacy
  /// reasons.
  TauPromise<AudioBuffer> decodeAudioData(
    TauArrayBuffer audioData, [
    DecodeSuccessCallback? successCallback,
    DecodeErrorCallback? errorCallback,
  ]);

  /// The `destination` property of the [BaseAudioContext]
  /// returns an [AudioDestinationNode] representing the final
  /// destination of all audio in the context. It often represents an actual
  /// audio-rendering
  /// device such as your device's speakers.
  AudioDestinationNode get destination;

  /// The `sampleRate` property of the [BaseAudioContext] returns a
  /// floating point number representing the sample rate, in samples per second,
  /// used by all nodes in this audio context.
  /// This limitation means that sample-rate converters are not supported.
  TauSampleRate get sampleRate;

  /// The `currentTime` read-only property of the [BaseAudioContext]
  /// returns a double representing an ever-increasing hardware
  /// timestamp in seconds that
  /// can be used for scheduling audio playback, visualizing timelines, etc. It
  /// starts at 0.
  TauTime get currentTime;

  /// The `listener` property of the [BaseAudioContext] interface
  /// returns an [AudioListener] object that can then be used for
  /// implementing 3D audio spatialization.
  AudioListener get listener;

  /// The `state` read-only property of the [BaseAudioContext]
  /// returns the current state of the `AudioContext`.
  AudioContextState get state;

  /// The `audioWorklet` read-only property of the
  /// [BaseAudioContext] returns an instance of
  /// [AudioWorklet] that can be used for adding
  /// [AudioWorkletProcessor]-derived classes which implement custom audio
  /// processing.
  AudioWorklet get audioWorklet;
  EventHandler get onstatechange;
  set onstatechange(EventHandler value);

// =================================================================================================
//                          Added specific to Tau
// =================================================================================================

  //TauStreamSourceNode createTauStreamSourceNode(Stream stream);
  //TauStreamDestinationNode createTauStreamDestinationNode(Stream stream);
  //TauStreamNode createTauStreamNode(String name, [TauStreamNodeOptions? options]);

  void dispose();
}

// ------------------------------------------------------------------------------------------------------------------

/// The `AudioContext` represents an audio-processing graph built from
/// audio modules linked together, each represented by an [AudioNode].
///
/// An audio context controls both the creation of the nodes it contains and the
/// execution of the audio processing, or decoding. You need to create an
/// `AudioContext` before you do anything else, as everything happens inside a
/// context. It's recommended to create one AudioContext and reuse it instead of
/// initializing a new one each time, and it's OK to use a single `AudioContext`
/// for several different audio sources and pipeline concurrently.
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/AudioContext).
abstract class AudioContext implements BaseAudioContext {
  /// The
  /// **`getOutputTimestamp()`** method of the
  /// [AudioContext] returns a new `AudioTimestamp` object
  /// containing two audio timestamp values relating to the current audio
  /// context.
  ///
  /// The two values are as follows:
  ///
  /// - `AudioTimestamp.contextTime`: The time of the sample frame currently
  /// being rendered by the audio output device (i.e., output audio stream
  /// position), in the
  /// same units and origin as the context's [BaseAudioContext.currentTime].
  /// Basically, this is the time after the audio context was first created.
  /// - `AudioTimestamp.performanceTime`: An estimation of the moment when the
  /// sample frame corresponding to the stored `contextTime` value was rendered
  /// by the audio output device, in the same units and origin as
  /// [performance.now]. This is the time after the document containing the
  /// audio context was first rendered.
  AudioTimestamp getOutputTimestamp();

  /// The **`resume()`** method of the [AudioContext]
  /// resumes the progression of time in an audio context that has
  /// previously been
  /// suspended.
  ///
  /// This method will cause an `INVALID_STATE_ERR` exception to be thrown if
  /// called on an [OfflineAudioContext].
  TauPromise<TauAny?> resume();

  /// The `suspend()` method of the [AudioContext] suspends the
  /// progression of time in the audio context, temporarily halting audio
  /// hardware access and reducing CPU/battery usage in the process — this is
  /// useful if you want an application to power down the audio hardware when it
  /// will not be using an audio context for a while.
  ///
  /// This method will cause an `INVALID_STATE_ERR` exception to be thrown if
  /// called on an [OfflineAudioContext].
  TauPromise<TauAny?> suspend();

  /// The `close()` method of the [AudioContext] closes the audio
  /// context, releasing any system audio resources that it uses.
  ///
  /// This function does not automatically release all `AudioContext`-created
  /// objects, unless other references have been released as well; however, it
  /// will forcibly release any system audio resources that might prevent
  /// additional `AudioContexts` from being created and used, suspend the
  /// progression of audio time in the audio context, and stop processing audio
  /// data. The returned `Promise` resolves when all
  /// `AudioContext`-creation-blocking resources have been released. This method
  /// throws an `INVALID_STATE_ERR` exception if called on an
  /// [OfflineAudioContext].
  TauPromise<TauAny?> close();

  /// The `createMediaElementSource()` method of the [AudioContext] is
  /// used to create a new [MediaElementAudioSourceNode] object, given an
  /// existing HTML `audio` or `video` element, the audio from which can then be
  /// played and manipulated.
  ///
  /// For more details about media element audio source nodes, check out the
  /// [MediaElementAudioSourceNode] reference page.
  MediaElementAudioSourceNode createMediaElementSource(
      MediaElement mediaElement);

  /// The `createMediaStreamSource()` method of the [AudioContext]
  /// is used to create a new [MediaStreamAudioSourceNode]
  /// object, given a media stream (say, from a [MediaDevices.getUserMedia]
  /// instance), the audio from which can then be played and manipulated.
  ///
  /// For more details about media stream audio source nodes, check out the
  /// [MediaStreamAudioSourceNode] reference page.
  MediaStreamAudioSourceNode createMediaStreamSource(MediaStream mediaStream);

  /// The **`createMediaStreamTrackSource()`** method of the [AudioContext]
  /// creates and returns a [MediaStreamTrackAudioSourceNode] which
  /// represents an audio source whose data comes from the specified
  /// [MediaStreamTrack].
  ///
  /// This differs from [AudioContext.createMediaStreamSource], which creates a
  /// [MediaStreamAudioSourceNode] whose audio comes from the audio track in a
  /// specified [MediaStream] whose [MediaStreamTrack.id] is first,
  /// lexicographically (alphabetically).
  MediaStreamTrackAudioSourceNode createMediaStreamTrackSource(
      MediaStreamTrack mediaStreamTrack);

  /// The `createMediaStreamDestination()` method of the [AudioContext]
  /// is used to create a new [MediaStreamAudioDestinationNode] object
  /// associated with a
  /// [WebRTC](https://developer.mozilla.org/en-US/docs/Web/API/WebRTC_API)
  /// [MediaStream] representing an audio stream, which may be stored in a local
  /// file or sent to another computer.
  ///
  /// The [MediaStream] is created when the node is created and is accessible
  /// via the [MediaStreamAudioDestinationNode]'s `stream` attribute. This
  /// stream can be used in a similar way as a `MediaStream` obtained via
  /// [navigator.getUserMedia] — it can, for example, be sent to a remote peer
  /// using the `addStream()` method of `RTCPeerConnection`.
  ///
  /// For more details about media stream destination nodes, check out the
  /// [MediaStreamAudioDestinationNode] reference page.
  MediaStreamAudioDestinationNode createMediaStreamDestination();

  /// The **`baseLatency`** read-only property of the
  /// [AudioContext] returns a double that represents the number of
  /// seconds of processing latency incurred by the `AudioContext` passing an
  /// audio
  /// buffer from the [AudioDestinationNode] — i.e. the end of the audio graph —
  /// into the host system's audio subsystem ready for playing.
  ///
  /// > **Note:** You can request a certain latency during
  /// > [AudioContext.AudioContext] with the
  /// > `latencyHint` option, but the browser may ignore the option.
  double get baseLatency;

  /// The **`outputLatency`** read-only property of
  /// the [AudioContext] provides an estimation of the output latency
  /// of the current audio context.
  ///
  /// This is the time, in seconds, between the browser passing an audio buffer
  /// out of an
  /// audio graph over to the host system's audio subsystem to play, and the
  /// time at which the
  /// first sample in the buffer is actually processed by the audio output
  /// device.
  ///
  /// It varies depending on the platform and the available hardware.
  double get outputLatency;

  /// Tau:
  Future<void> setSinkId(String sinkId);
}

// ------------------------------------------------------------------------------------------------------------------

abstract class AudioContextOptions implements EventTarget {
  TauAny get latencyHint;
  set latencyHint(TauAny value);
  TauSampleRate get sampleRate;
  set sampleRate(TauSampleRate value);
  TauAny get sinkId;
  set sinkId(TauAny value);
  TauAny get renderSizeHint;
  set renderSizeHint(TauAny value);
}

// ------------------------------------------------------------------------------------------------------------------

class AudioSinkOptions {
  //AudioSinkType get type;
  //set type(AudioSinkType value);
}

// ------------------------------------------------------------------------------------------------------------------

abstract class AudioTimestamp {
  TauTime get contextTime;
  set contextTime(TauTime value);
  TauTime get performanceTime;
  set performanceTime(TauTime value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The `OfflineAudioContext` is an [AudioContext] interface
/// representing an audio-processing graph built from linked together
/// [AudioNode]s. In contrast with a standard [AudioContext], an
/// `OfflineAudioContext` doesn't render the audio to the device hardware;
/// instead, it generates it, as fast as it can, and outputs the result to an
/// [AudioBuffer].
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/OfflineAudioContext).
abstract class OfflineAudioContext implements BaseAudioContext {
  /// The `startRendering()` method of the [OfflineAudioContext] Interface
  /// starts rendering the audio graph, taking into account the current
  /// connections and the current scheduled changes.
  ///
  /// The [OfflineAudioContext.complete_event] event (of type
  /// [OfflineAudioCompletionEvent]) is raised when the rendering is finished,
  /// containing the resulting [AudioBuffer] in its `renderedBuffer` property.
  ///
  /// Browsers currently support two versions of the `startRendering()` method —
  /// an older event-based version and a newer promise-based version.
  /// The former will eventually be removed, but currently both mechanisms are
  /// provided for legacy reasons.
  TauPromise<AudioBuffer> startRendering();

  /// The **`resume()`** method of the
  /// [OfflineAudioContext] resumes the progression of time in an
  /// audio
  /// context that has been suspended. The promise resolves immediately because
  /// the
  /// `OfflineAudioContext` does not require the audio hardware.
  TauPromise<TauAny?> resume();

  /// The **`suspend()`** method of the [OfflineAudioContext] interface
  /// schedules a suspension of the time
  /// progression in the audio context at the specified time and returns a
  /// promise. This is
  /// generally useful at the time of manipulating the audio graph synchronously
  /// on
  /// OfflineAudioContext.
  ///
  /// Note that the maximum precision of suspension is the size of the render
  /// quantum and the
  /// specified suspension time will be rounded down to the nearest render
  /// quantum boundary.
  /// For this reason, it is not allowed to schedule multiple suspends at the
  /// same quantized
  /// frame. Also scheduling should be done while the context is not running to
  /// ensure the
  /// precise suspension.
  TauPromise<TauAny?> suspend(TauTime suspendTime);

  /// The **`length`** property of the
  /// [OfflineAudioContext] returns an integer representing the size
  /// of
  /// the buffer in sample-frames.
  int get length;
  EventHandler get oncomplete;
  set oncomplete(EventHandler value);
}

// ------------------------------------------------------------------------------------------------------------------

abstract class OfflineAudioContextOptions {
  int get numberOfChannels;
  set numberOfChannels(int value);
  int get length;
  set length(int value);
  TauSampleRate get sampleRate;
  set sampleRate(TauSampleRate value);
  TauAny get renderSizeHint;
  set renderSizeHint(TauAny value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The
/// [Web Audio API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API)
/// `OfflineAudioCompletionEvent` represents events that occur when
/// the processing of an [OfflineAudioContext] is terminated. The
/// [OfflineAudioContext.complete_event] event uses this interface.
///
/// > **Note:** This is marked as deprecated; it is still supported
/// > for legacy reasons, but it will soon be superseded when the promise
/// > version of [OfflineAudioContext.startRendering] is supported in browsers,
/// > which will no longer need it.
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/OfflineAudioCompletionEvent).
abstract class OfflineAudioCompletionEvent implements Event {
  /// The **`renderedBuffer`** read-only property of the
  /// [OfflineAudioCompletionEvent] is an [AudioBuffer]
  /// containing the result of processing an [OfflineAudioContext].
  AudioBuffer get renderedBuffer;
}

// ------------------------------------------------------------------------------------------------------------------

abstract class OfflineAudioCompletionEventInit implements EventInit {
  AudioBuffer get renderedBuffer;
  set renderedBuffer(AudioBuffer value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The **`AudioBuffer`** represents a short audio asset residing in
/// memory, created from an audio file using the
/// [BaseAudioContext.decodeAudioData] method, or from raw data using
/// [BaseAudioContext.createBuffer]. Once put into an AudioBuffer, the audio can
/// then be played by being passed into an [AudioBufferSourceNode].
///
/// Objects of these types are designed to hold small audio snippets, typically
/// less than 45 s. For longer sounds, objects implementing the
/// [MediaElementAudioSourceNode] are more suitable. The buffer contains the
/// audio signal waveform encoded as a series of amplitudes in the following
/// format: non-interleaved IEEE754 32-bit linear PCM with a nominal range
/// between `-1` and `+1`, that is, a 32-bit floating point buffer, with each
/// sample between -1.0 and 1.0. If the [AudioBuffer] has multiple channels,
/// they are stored in separate buffers.
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/AudioBuffer).
abstract class AudioBuffer {
  /// The **`getChannelData()`** method of the [AudioBuffer] returns a
  /// `Float32Array` containing the PCM data associated with the channel,
  /// defined by the channel parameter (with 0 representing the first channel).
  TauFloat32Array getChannelData(int channel);

  /// The
  /// **`copyFromChannel()`** method of the
  /// [AudioBuffer] copies the audio sample data from the specified
  /// channel of the `AudioBuffer` to a specified
  /// `Float32Array`.
  void copyFromChannel(
    TauFloat32Array destination,
    int channelNumber, [
    int bufferOffset,
  ]);

  /// The `copyToChannel()` method of the [AudioBuffer] copies
  /// the samples to the specified channel of the `AudioBuffer`, from the source
  /// array.
  void copyToChannel(
    TauFloat32Array source,
    int channelNumber, [
    int bufferOffset,
  ]);

  /// The **`sampleRate`** property of the [AudioBuffer] returns a
  /// float representing the sample rate, in samples per second, of the PCM data
  /// stored in the buffer.
  TauSampleRate get sampleRate;

  /// The **`length`** property of the [AudioBuffer]
  /// returns an integer representing the length, in sample-frames, of
  /// the PCM data
  /// stored in the buffer.
  int get length;

  /// The **`duration`** property of the [AudioBuffer] returns a
  /// double representing the duration, in seconds, of the PCM data stored in
  /// the buffer.
  double get duration;

  /// The `numberOfChannels` property of the [AudioBuffer]
  /// returns an integer representing the number of discrete audio
  /// channels
  /// described by the PCM data stored in the buffer.
  int get numberOfChannels;
}

// ------------------------------------------------------------------------------------------------------------------

abstract class AudioBufferOptions {
  int get numberOfChannels;
  set numberOfChannels(int value);
  int get length;
  set length(int value);
  TauSampleRate get sampleRate;
  set sampleRate(TauSampleRate value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The **`AudioNode`** is a generic for representing an
/// audio processing module.
///
/// Examples include:
///
/// - an audio source (e.g. an HTML `audio` or `video` element, an
///   [OscillatorNode], etc.),
/// - the audio destination,
/// - intermediate processing module (e.g. a filter like [BiquadFilterNode] or
///   [ConvolverNode]), or
/// - volume control (like [GainNode])
///
/// > **Note:** An `AudioNode` can be target of events, therefore it implements
/// > the [EventTarget] interface.
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/AudioNode).
abstract class AudioNode implements EventTarget {
  /// The `connect()` method of the [AudioNode] lets
  /// you connect one of the node's outputs to a target, which may be either
  /// another
  /// `AudioNode` (thereby directing the sound data to the specified node).
  /// See also [AudioNode.connectParam]
  AudioNode connect(
    AudioNode destinationNode, [
    int output,
    int input,
  ]);

  /// This is a variant of [AudioNode.connect] with a `DestinationParam` argument instead of an `AudioNode`.
  /// Note : The W3C recommandation uses just one verb for both.
  void connectParam(
    AudioParam destinationParam, //TauObject destinationNodeOrDestinationParam,
    [
    int output,
    int input,
  ]);

  /// The **`disconnect()`** method of the [AudioNode] lets you
  /// disconnect one or more nodes from the node on which the method is called.
  /// See also [AudioNode.disconnectParam]
  void disconnect([
    AudioNode
        destinationParamOrOutput, // TauAny destinationNodeOrDestinationParamOrOutput,
    int output,
    int input,
  ]);

  /// This is a variant of [AudioNode.disconnect] with a `DestinationParam` argument instead of an `AudioNode`.
  /// Note : The W3C recommandation uses just one verb for both.
  void disconnectParam(
    AudioParam destinationParam, [
    int output,
    int input,
  ]);

  /// The read-only `context` property of the
  /// [AudioNode] returns the associated
  /// [BaseAudioContext], that is the object representing the processing graph
  /// the node is participating in.
  BaseAudioContext get context;

  /// The `numberOfInputs` property of
  /// the [AudioNode] returns the number of inputs feeding the
  /// node. Source nodes are defined as nodes having a `numberOfInputs`
  /// property with a value of 0.
  int get numberOfInputs;

  /// The `numberOfOutputs` property of
  /// the [AudioNode] returns the number of outputs coming out of
  /// the node. Destination nodes — like [AudioDestinationNode] — have
  /// a value of 0 for this attribute.
  int get numberOfOutputs;

  /// The **`channelCount`** property of the [AudioNode] represents an
  /// integer used to determine how many channels are used when
  /// [up-mixing and down-mixing](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing)
  /// connections to any inputs to the node.
  ///
  /// `channelCount`'s usage and precise definition depend on the value of
  /// [AudioNode.channelCountMode]:
  ///
  /// - It is ignored if the `channelCountMode` value is `max`.
  /// - It is used as a maximum value if the `channelCountMode` value is
  ///   `clamped-max`.
  /// - It is used as the exact value if the `channelCountMode` value is
  ///   `explicit`.
  int get channelCount;
  set channelCount(int value);

  /// The `channelCountMode` property of the [AudioNode] represents an
  /// enumerated value describing the way channels must be matched between the
  /// node's inputs and outputs.
  ChannelCountMode get channelCountMode;
  set channelCountMode(ChannelCountMode value);

  /// The **`channelInterpretation`** property of the [AudioNode] interface
  /// represents an enumerated value describing how input channels are mapped to
  /// output channels when the number of inputs/outputs is different. For
  /// example, this setting defines how a mono input will be up-mixed to a
  /// stereo or 5.1 channel output, or how a quad channel input will be
  /// down-mixed to a stereo or mono output.
  ///
  /// The property has two options: `speakers` and `discrete`. These are
  /// documented in [Basic concepts behind Web Audio API > up-mixing and
  /// down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing).
  ChannelInterpretation get channelInterpretation;
  set channelInterpretation(ChannelInterpretation value);
}

// ------------------------------------------------------------------------------------------------------------------

abstract class AudioNodeOptions {
  int get channelCount;
  set channelCount(int value);
  ChannelCountMode get channelCountMode;
  set channelCountMode(ChannelCountMode value);
  ChannelInterpretation get channelInterpretation;
  set channelInterpretation(ChannelInterpretation value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The Web Audio API's `AudioParam` represents an audio-related
/// parameter, usually a parameter of an [AudioNode] (such as [GainNode.gain]).
///
/// An `AudioParam` can be set to a specific value or a change in value, and can
/// be scheduled to happen at a specific time and following a specific pattern.
///
/// Each `AudioParam` has a list of events, initially empty, that define when
/// and how values change. When this list is not empty, changes using the
/// `AudioParam.value` attributes are ignored. This list of events allows us to
/// schedule changes that have to happen at very precise times, using arbitrary
/// timeline-based automation curves. The time used is the one defined in
/// [BaseAudioContext.currentTime].
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/AudioParam).
abstract class AudioParam {
  /// The `setValueAtTime()` method of the
  /// [AudioParam] schedules an instant change to the
  /// `AudioParam` value at a precise time, as measured against
  /// [BaseAudioContext.currentTime]. The new value is given in the value
  /// parameter.
  AudioParam setValueAtTime(
    TauTime value,
    TauTime startTime,
  );

  /// The `linearRampToValueAtTime()` method of the [AudioParam]
  /// schedules a gradual linear change in the value of the
  /// `AudioParam`. The change starts at the time specified for the
  /// _previous_ event, follows a linear ramp to the new value given in the
  /// `value` parameter, and reaches the new value at the time given in the
  /// `endTime` parameter.
  AudioParam linearRampToValueAtTime(
    TauTime value,
    TauTime endTime,
  );

  /// The **`exponentialRampToValueAtTime()`** method of the [AudioParam]
  /// schedules a gradual exponential change in the value of the
  /// [AudioParam].
  /// The change starts at the time specified for the _previous_ event, follows
  /// an exponential ramp to the new value given in the `value` parameter, and
  /// reaches the new value at the time given in the
  /// `endTime` parameter.
  ///
  /// > **Note:** Exponential ramps are considered more useful when changing
  /// > frequencies or playback rates than linear ramps because of the way the
  /// > human ear
  /// > works.
  AudioParam exponentialRampToValueAtTime(
    TauTime value,
    TauTime endTime,
  );

  /// The `setTargetAtTime()` method of the
  /// [AudioParam] schedules the start of a gradual change to the
  /// `AudioParam` value. This is useful for decay or release portions of ADSR
  /// envelopes.
  AudioParam setTargetAtTime(
    num target,
    TauTime startTime,
    TauTime timeConstant,
  );

  /// The
  /// **`setValueCurveAtTime()`** method of the
  /// [AudioParam] schedules the parameter's value to change
  /// following a curve defined by a list of values.
  ///
  /// The curve is a linear
  /// interpolation between the sequence of values defined in an array of
  /// floating-point
  /// values, which are scaled to fit into the given interval starting at
  /// `startTime` and a specific duration.
  AudioParam setValueCurveAtTime(
    TauArray<TauNumber> values,
    TauTime startTime,
    TauTime duration,
  );

  /// The `cancelScheduledValues()` method of the [AudioParam]
  /// cancels all scheduled future changes to the `AudioParam`.
  AudioParam cancelScheduledValues(TauTime cancelTime);

  /// The **`cancelAndHoldAtTime()`** method of the
  /// [AudioParam] cancels all scheduled future changes to the
  /// `AudioParam` but holds its value at a given time until further changes are
  /// made using other methods.
  AudioParam cancelAndHoldAtTime(TauTime cancelTime);

  /// The [Web Audio
  /// API's](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API)
  /// [AudioParam] property **`value`** gets
  /// or sets the value of this [AudioParam] at the current time. Initially, the
  /// value is set to [AudioParam.defaultValue].
  ///
  /// Setting `value` has the same effect as
  /// calling [AudioParam.setValueAtTime] with the time returned by the
  /// `AudioContext`'s [BaseAudioContext.currentTime]
  /// property.
  double get value;
  set value(num value);
  AutomationRate get automationRate;
  set automationRate(AutomationRate value);

  /// The **`defaultValue`**
  /// read-only property of the [AudioParam] represents the initial
  /// value of the attributes as defined by the specific [AudioNode] creating
  /// the `AudioParam`.
  double get defaultValue;

  /// The **`minValue`**
  /// read-only property of the [AudioParam] represents the minimum
  /// possible value for the parameter's nominal (effective) range.
  double get minValue;

  /// The **`maxValue`**
  /// read-only property of the [AudioParam] represents the maximum
  /// possible value for the parameter's nominal (effective) range.
  double get maxValue;
}

// ------------------------------------------------------------------------------------------------------------------

/// The `AudioScheduledSourceNode` interface—part of the Web Audio API—is a
/// parent for several types of audio source node interfaces which
/// share the ability to be started and stopped, optionally at specified times.
/// Specifically, this defines the [AudioScheduledSourceNode.start]
/// and [AudioScheduledSourceNode.stop] methods, as well as the
/// [AudioScheduledSourceNode.ended_event] event.
///
/// > **Note:** You can't create an `AudioScheduledSourceNode` object directly.
/// > Instead, use an which extends it, such as
/// > [AudioBufferSourceNode], [OscillatorNode] or [ConstantSourceNode].
///
/// Unless stated otherwise, nodes based upon `AudioScheduledSourceNode` output
/// silence when not playing (that is, before `start()` is called and after
/// `stop()` is called). Silence is represented, as always, by a stream of
/// samples with the value zero (0).
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/AudioScheduledSourceNode).
abstract class AudioScheduledSourceNode implements AudioNode {
  /// The `start()` method on [AudioScheduledSourceNode] schedules a sound to
  /// begin playback at the specified time.
  /// If no time is specified, then the sound begins playing immediately.
  void start([num when]);

  /// The `stop()` method on [AudioScheduledSourceNode] schedules a
  /// sound to cease playback at the specified time. If no time is specified,
  /// then the sound
  /// stops playing immediately.
  ///
  /// Each time you call `stop()` on the same node, the specified time replaces
  /// any previously-scheduled stop time that hasn't occurred yet. If the node
  /// has already
  /// stopped, this method has no effect.
  ///
  /// > **Note:** If a scheduled stop time occurs before the node's scheduled
  /// > start time, the node never starts to play.
  void stop([num when]);
  EventHandler get onended;
  set onended(EventHandler value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The **`AnalyserNode`** represents a node able to provide real-time
/// frequency and time-domain analysis information. It is an [AudioNode] that
/// passes the audio stream unchanged from the input to the output, but allows
/// you to take the generated data, process it, and create audio visualizations.
///
/// An `AnalyserNode` has exactly one input and one output. The node works even
/// if the output is not connected.
///
/// ![Without modifying the audio stream, the node allows to get the frequency
/// and time-domain data associated to it, using a FFT.](fttaudiodata_en.svg)
///
/// <table class="properties">
///   <tbody>
///     <tr>
///       <th scope="row">Number of inputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Number of outputs</th>
///       <td><code>1</code> (but may be left unconnected)</td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count mode</th>
///       <td><code>"max"</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count</th>
///       <td><code>2</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel interpretation</th>
///       <td><code>"speakers"</code></td>
///     </tr>
///   </tbody>
/// </table>
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/AnalyserNode).
abstract class AnalyserNode implements AudioNode {
  /// The **`getFloatFrequencyData()`** method of the [AnalyserNode] Interface
  /// copies the current frequency data into a `Float32Array` array passed into
  /// it. Each array value is a _sample_, the magnitude of the signal at a
  /// particular time.
  ///
  /// Each item in the array represents the decibel value for a specific
  /// frequency. The frequencies are spread linearly from 0 to 1/2 of the sample
  /// rate. For example, for a `48000` Hz sample rate, the last item of the
  /// array will represent the decibel value for `24000` Hz.
  ///
  /// If you need higher performance and don't care about precision, you can use
  /// [AnalyserNode.getByteFrequencyData] instead, which works on a
  /// `Uint8Array`.
  void getFloatFrequencyData(TauFloat32Array array);

  /// The **`getByteFrequencyData()`** method of the [AnalyserNode] interface
  /// copies the current frequency data into a `Uint8Array` (unsigned byte
  /// array) passed into it.
  ///
  /// The frequency data is composed of integers on a scale from 0 to 255.
  ///
  /// Each item in the array represents the decibel value for a specific
  /// frequency. The frequencies are spread linearly from 0 to 1/2 of the sample
  /// rate. For example, for `48000` sample rate, the last item of the array
  /// will represent the decibel value for `24000` Hz.
  ///
  /// If the array has fewer elements than the [AnalyserNode.frequencyBinCount],
  /// excess elements are dropped. If it has more elements than needed, excess
  /// elements are ignored.
  void getByteFrequencyData(TauUint8Array array);

  /// The **`getFloatTimeDomainData()`** method of the [AnalyserNode] Interface
  /// copies the current waveform, or time-domain, data into a `Float32Array`
  /// array passed into it. Each array value is a _sample_, the magnitude of the
  /// signal at a particular time.
  void getFloatTimeDomainData(TauFloat32Array array);

  /// The **`getByteTimeDomainData()`** method of the [AnalyserNode] Interface
  /// copies the current waveform, or time-domain, data into a `Uint8Array`
  /// (unsigned byte array) passed into it.
  ///
  /// If the array has fewer elements than the [AnalyserNode.fftSize], excess
  /// elements are dropped. If it has more elements than needed, excess elements
  /// are ignored.
  void getByteTimeDomainData(TauUint8Array array);

  /// The **`fftSize`** property of the [AnalyserNode] is an unsigned
  /// long value and represents the window size in samples that is used when
  /// performing a
  /// [Fast Fourier Transform](https://en.wikipedia.org/wiki/Fast_Fourier_transform)
  /// (FFT) to get frequency domain data.
  int get fftSize;
  set fftSize(int value);

  /// The **`frequencyBinCount`** read-only property of the [AnalyserNode]
  /// contains the total number of data points available to
  /// [AudioContext] [BaseAudioContext.sampleRate]. This is half of the `value`
  /// of the [AnalyserNode.fftSize]. The two methods' indices have a linear
  /// relationship with the frequencies they represent, between 0 and the
  /// [Nyquist frequency](https://en.wikipedia.org/wiki/Nyquist_frequency).
  int get frequencyBinCount;

  /// The **`minDecibels`** property of the [AnalyserNode] is a double
  /// value representing the minimum power value in the scaling range for the
  /// FFT analysis data, for conversion to unsigned byte values — basically,
  /// this specifies the minimum value for the range of results when using
  /// `getByteFrequencyData()`.
  double get minDecibels;
  set minDecibels(num value);

  /// The **`maxDecibels`** property of the [AnalyserNode] is a double
  /// value representing the maximum power value in the scaling range for the
  /// FFT analysis data, for conversion to unsigned byte values — basically,
  /// this specifies the maximum value for the range of results when using
  /// `getByteFrequencyData()`.
  double get maxDecibels;
  set maxDecibels(num value);

  /// The **`smoothingTimeConstant`** property of the [AnalyserNode] interface
  /// is a double value representing the averaging constant with the last
  /// analysis frame. It's basically an average between the current buffer and
  /// the last buffer the `AnalyserNode` processed, and results in a much
  /// smoother set of value changes over time.
  TauTime get smoothingTimeConstant;
  set smoothingTimeConstant(TauTime value);
}

// ------------------------------------------------------------------------------------------------------------------

abstract class AnalyserOptions implements AudioNodeOptions {
  int get fftSize;
  set fftSize(int value);
  double get maxDecibels;
  set maxDecibels(num value);
  double get minDecibels;
  set minDecibels(num value);
  TauTime get smoothingTimeConstant;
  set smoothingTimeConstant(TauTime value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The **`AudioBufferSourceNode`** is an [AudioScheduledSourceNode]
/// which represents an audio source consisting of in-memory audio data, stored
/// in an [AudioBuffer].
///
/// This is especially useful for playing back audio which has
/// particularly stringent timing accuracy requirements, such as for sounds that
/// must match a specific rhythm and can be kept in memory rather than being
/// played from disk or the network. To play sounds which require accurate
/// timing but must be streamed from the network or played from disk, use a
/// [AudioWorkletNode] to implement its playback.
///
/// An `AudioBufferSourceNode` has no inputs and exactly one output, which has
/// the same number of channels as the `AudioBuffer` indicated by its
/// [AudioBufferSourceNode.buffer] property. If there's no buffer set—that is,
/// if `buffer` is `null`—the output contains a single channel of silence (every
/// sample is 0).
///
/// An `AudioBufferSourceNode` can only be played once; after each call to
/// [AudioBufferSourceNode.start], you have to create a new node if you want to
/// play the same sound again. Fortunately, these nodes are very inexpensive to
/// create, and the actual `AudioBuffer`s can be reused for multiple plays of
/// the sound. Indeed, you can use these nodes in a "fire and forget" manner:
/// create the node, call `start()` to begin playing the sound, and don't even
/// bother to hold a reference to it. It will automatically be garbage-collected
/// at an appropriate time, which won't be until sometime after the sound has
/// finished playing.
///
/// Multiple calls to [AudioScheduledSourceNode.stop] are allowed. The most
/// recent call replaces the previous one, if the `AudioBufferSourceNode` has
/// not already reached the end of the buffer.
///
/// ![The AudioBufferSourceNode takes the content of an AudioBuffer and m](webaudioaudiobuffersourcenode.png)
///
/// <table class="properties">
///   <tbody>
///     <tr>
///       <th scope="row">Number of inputs</th>
///       <td><code>0</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Number of outputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count</th>
///       <td>defined by the associated [AudioBuffer]</td>
///     </tr>
///   </tbody>
/// </table>
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/AudioBufferSourceNode).
abstract class AudioBufferSourceNode implements AudioScheduledSourceNode {
  /// The `start()` method of the [AudioBufferSourceNode]
  /// is used to schedule playback of the audio data contained in the
  /// buffer, or
  /// to begin playback immediately.
  @override
  void start([
    num? when,
    num? offset,
    num? duration,
  ]);

  /// The **`buffer`** property of the [AudioBufferSourceNode] interface
  /// provides the ability to play back audio using an [AudioBuffer] as the
  /// source of the sound data.
  ///
  /// If the `buffer` property is set to the value `null`, the node
  /// generates a single channel containing silence (that is, every sample is
  /// 0).
  AudioBuffer? get buffer;
  set buffer(AudioBuffer? value);

  /// The **`playbackRate`** property of
  /// the [AudioBufferSourceNode] Is a
  /// [k-rate](https://developer.mozilla.org/en-US/docs/Web/API/AudioParam#k-rate)
  /// [AudioParam] that
  /// defines the speed at which the audio asset will be played.
  ///
  /// A value of 1.0 indicates it should play at the same speed as its sampling
  /// rate,
  /// values less than 1.0 cause the sound to play more slowly, while values
  /// greater than
  /// 1.0 result in audio playing faster than normal. The default value is
  /// `1.0`.
  /// When set to another value, the `AudioBufferSourceNode` resamples the audio
  /// before sending it to the output.
  AudioParam get playbackRate;

  /// The **`detune`** property of the
  /// [AudioBufferSourceNode] is a
  /// [k-rate](https://developer.mozilla.org/en-US/docs/Web/API/AudioParam#k-rate)
  /// [AudioParam]
  /// representing detuning of oscillation in
  /// [cents](https://en.wikipedia.org/wiki/Cent_%28music%29).
  ///
  /// For example, values of +100 and -100 detune the source up or down by one
  /// semitone,
  /// while +1200 and -1200 detune it up or down by one octave.
  AudioParam get detune;

  /// The `loop` property of the [AudioBufferSourceNode]
  /// is a Boolean indicating if the audio asset must be replayed when
  /// the end of
  /// the [AudioBuffer] is reached.
  ///
  /// The `loop` property's default value is `false`.
  bool get loop;
  set loop(bool value);

  /// The **`loopStart`** property of the [AudioBufferSourceNode] is a
  /// floating-point value indicating, in seconds, where in the [AudioBuffer]
  /// the restart of the play must happen.
  ///
  /// The `loopStart` property's default value is `0`.
  double get loopStart;
  set loopStart(num value);

  /// The `loopEnd` property of the [AudioBufferSourceNode]
  /// specifies is a floating point number specifying, in seconds, at
  /// what offset
  /// into playing the [AudioBuffer] playback should loop back to the time
  /// indicated by the [AudioBufferSourceNode.loopStart] property.
  /// This is only used if the [AudioBufferSourceNode.loop] property is
  /// `true`.
  double get loopEnd;
  set loopEnd(num value);
}

// ------------------------------------------------------------------------------------------------------------------

abstract class AudioBufferSourceOptions {
  AudioBuffer? get buffer;
  set buffer(AudioBuffer? value);
  double get detune;
  set detune(num value);
  bool get loop;
  set loop(bool value);
  double get loopEnd;
  set loopEnd(num value);
  double get loopStart;
  set loopStart(num value);
  double get playbackRate;
  set playbackRate(num value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The `AudioDestinationNode` represents the end destination of an
/// audio graph in a given context — usually the speakers of your device. It can
/// also be the node that will "record" the audio data when used with an
/// `OfflineAudioContext`.
///
/// `AudioDestinationNode` has no output (as it _is_ the output, no more
/// `AudioNode` can be linked after it in the audio graph) and one input. The
/// number of channels in the input must be between `0` and the
/// `maxChannelCount` value or an exception is raised.
///
/// The `AudioDestinationNode` of a given `AudioContext` can be retrieved using
/// the [BaseAudioContext.destination] property.
///
/// <table class="properties">
///   <tbody>
///     <tr>
///       <th scope="row">Number of inputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Number of outputs</th>
///       <td><code>0</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count mode</th>
///       <td><code>"explicit"</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count</th>
///       <td><code>2</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel interpretation</th>
///       <td><code>"speakers"</code></td>
///     </tr>
///   </tbody>
/// </table>
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/AudioDestinationNode).
abstract class AudioDestinationNode implements AudioNode {
  /// The `maxchannelCount` property of the [AudioDestinationNode] is
  /// an `unsigned long` defining the maximum amount of channels that the
  /// physical device can handle.
  ///
  /// The [AudioNode.channelCount] property can be set between 0 and this value
  /// (both included). If `maxChannelCount` is `0`, like in
  /// [OfflineAudioContext], the channel count cannot be changed.
  int get maxChannelCount;
}

// ------------------------------------------------------------------------------------------------------------------

/// The `AudioListener` represents the position and orientation of the
/// unique person listening to the audio scene, and is used in
/// [audio spatialization](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API/Web_audio_spatialization_basics).
/// All [PannerNode]s spatialize in relation to the `AudioListener` stored in
/// the [BaseAudioContext.listener] attribute.
///
/// It is important to note that there is only one listener per context and that
/// it isn't an [AudioNode].
///
/// ![We see the position, up and front vectors of an AudioListener, with the up
/// and front vectors at 90° from the other.](webaudiolistenerreduced.png)
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/AudioListener).
abstract class AudioListener {
  /// The `setPosition()` method of the [AudioListener] defines the
  /// position of the listener.
  ///
  /// The three parameters `x`, `y` and `z` are unitless and describe the
  /// listener's position in 3D space according to the right-hand Cartesian
  /// coordinate system. [PannerNode] objects use this position relative to
  /// individual audio sources for spatialization.
  ///
  /// The default value of the position vector is `(0, 0, 0)`.
  ///
  /// > **Note:** As this method is deprecated, use the three
  /// > [AudioListener.positionX], [AudioListener.positionY], and
  /// > [AudioListener.positionZ] properties instead.
  void setPosition(
    num x,
    num y,
    num z,
  );

  /// The `setOrientation()` method of the [AudioListener] defines the
  /// orientation of the listener.
  ///
  /// It consists of two direction vectors:
  ///
  /// - The _front vector_, defined by the three unitless parameters `x`, `y`
  ///   and `z`, describes the direction of the face of the listener, that is
  ///   the direction the nose of the person is pointing towards. The front
  ///   vector's default value is `(0, 0, -1)`.
  /// - The _up vector_, defined by three unitless parameters `xUp`, `yUp` and
  ///   `zUp`, describes the direction of the top of the listener's head. The up
  ///   vector's default value is `(0, 1, 0)`.
  ///
  /// The two vectors must be separated by an angle of 90° — in linear analysis
  /// terms, they must be perpendicular to each other.
  void setOrientation(
    num x,
    num y,
    num z,
    num xUp,
    num yUp,
    num zUp,
  );

  /// The `positionX` read-only property of the [AudioListener] is an
  /// [AudioParam] representing the x position of the listener in 3D cartesian
  /// space.
  ///
  /// > **Note:** The parameter is
  /// > [_a-rate_](https://developer.mozilla.org/en-US/docs/Web/API/AudioParam#a-rate)
  /// > when used with a [PannerNode] whose [PannerNode.panningModel] is set to
  /// > equalpower, or
  /// > [_k-rate_](https://developer.mozilla.org/en-US/docs/Web/API/AudioParam#k-rate)
  /// > otherwise.
  AudioParam get positionX;

  /// The `positionY` read-only property of the [AudioListener] is an
  /// [AudioParam] representing the y position of the listener in 3D cartesian
  /// space.
  ///
  /// > **Note:** The parameter is
  /// > [_a-rate_](https://developer.mozilla.org/en-US/docs/Web/API/AudioParam#a-rate)
  /// > when used with a [PannerNode] whose [PannerNode.panningModel] is set to
  /// > equalpower, or
  /// > [_k-rate_](https://developer.mozilla.org/en-US/docs/Web/API/AudioParam#k-rate)
  /// > otherwise.
  AudioParam get positionY;

  /// The `positionZ` read-only property of the [AudioListener] is an
  /// [AudioParam] representing the z position of the listener in 3D cartesian
  /// space.
  ///
  /// > **Note:** The parameter is
  /// > [_a-rate_](https://developer.mozilla.org/en-US/docs/Web/API/AudioParam#a-rate)
  /// > when used with a [PannerNode] whose [PannerNode.panningModel] is set to
  /// > equalpower, or
  /// > [_k-rate_](https://developer.mozilla.org/en-US/docs/Web/API/AudioParam#k-rate)
  /// > otherwise.
  AudioParam get positionZ;

  /// The `forwardX` read-only property of the [AudioListener] is an
  /// [AudioParam] representing the x value of the direction vector defining the
  /// forward direction the listener is pointing in.
  ///
  /// > **Note:** The parameter is _a-rate_ when used with a [PannerNode] whose
  /// > [PannerNode.panningModel] is set to equalpower, or _k-rate_ otherwise.
  AudioParam get forwardX;

  /// The `forwardY` read-only property of the [AudioListener] is an
  /// [AudioParam] representing the y value of the direction vector defining the
  /// forward direction the listener is pointing in.
  ///
  /// > **Note:** The parameter is _a-rate_ when used with a [PannerNode] whose
  /// > [PannerNode.panningModel] is set to equalpower, or _k-rate_ otherwise.
  AudioParam get forwardY;

  /// The `forwardZ` read-only property of the [AudioListener] is an
  /// [AudioParam] representing the z value of the direction vector defining the
  /// forward direction the listener is pointing in.
  ///
  /// > **Note:** The parameter is _a-rate_ when used with a [PannerNode] whose
  /// > [PannerNode.panningModel] is set to equalpower, or _k-rate_ otherwise.
  AudioParam get forwardZ;

  /// The `upX` read-only property of the [AudioListener] is an
  /// [AudioParam] representing the x value of the direction vector defining the
  /// up direction the listener is pointing in.
  ///
  /// > **Note:** The parameter is _a-rate_ when used with a [PannerNode] whose
  /// > [PannerNode.panningModel] is set to equalpower, or _k-rate_ otherwise.
  AudioParam get upX;

  /// The `upY` read-only property of the [AudioListener] is an
  /// [AudioParam] representing the y value of the direction vector defining the
  /// up direction the listener is pointing in.
  ///
  /// > **Note:** The parameter is _a-rate_ when used with a [PannerNode] whose
  /// > [PannerNode.panningModel] is set to equalpower, or _k-rate_ otherwise.
  AudioParam get upY;

  /// The `upZ` read-only property of the [AudioListener] is an
  /// [AudioParam] representing the z value of the direction vector defining the
  /// up direction the listener is pointing in.
  ///
  /// > **Note:** The parameter is _a-rate_ when used with a [PannerNode] whose
  /// > [PannerNode.panningModel] is set to equalpower, or _k-rate_ otherwise.
  AudioParam get upZ;
}

// ------------------------------------------------------------------------------------------------------------------

/// The `AudioProcessingEvent` of the
/// [Web Audio API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API)
/// represents events that occur when a [ScriptProcessorNode] input buffer is
/// ready to be processed.
///
/// An `audioprocess` event with this is fired on a
/// [ScriptProcessorNode] when audio processing is required. During audio
/// processing, the input buffer is read and processed to produce output audio
/// data, which is then written to the output buffer.
///
/// > **Warning:** This feature has been deprecated and should be replaced by an
/// > [`AudioWorklet`](https://developer.mozilla.org/en-US/docs/Web/API/AudioWorklet).
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/AudioProcessingEvent).
abstract class AudioProcessingEvent implements Event {
  /// The **`playbackTime`** read-only property of the [AudioProcessingEvent]
  /// represents the time when the audio will be played. It is in the
  /// same coordinate system as the time used by the [AudioContext].
  TauTime get playbackTime;

  /// The **`inputBuffer`** read-only property of the [AudioProcessingEvent]
  /// represents the input buffer of an audio processing event.
  ///
  /// The input buffer is represented by an [AudioBuffer] object, which contains
  /// a collection of audio channels, each of which is an array of
  /// floating-point values representing the audio signal waveform encoded as a
  /// series of amplitudes. The number of channels and the length of each
  /// channel are determined by the channel count and buffer size properties of
  /// the `AudioBuffer`.
  AudioBuffer get inputBuffer;

  /// The **`outputBuffer`** read-only property of the [AudioProcessingEvent]
  /// represents the output buffer of an audio processing event.
  ///
  /// The output buffer is represented by an [AudioBuffer] object, which
  /// contains a collection of audio channels, each of which is an array of
  /// floating-point values representing the audio signal waveform encoded as a
  /// series of amplitudes. The number of channels and the length of each
  /// channel are determined by the channel count and buffer size properties of
  /// the `AudioBuffer`.
  AudioBuffer get outputBuffer;
}

// ------------------------------------------------------------------------------------------------------------------

abstract class AudioProcessingEventInit implements EventInit {
  TauTime get playbackTime;
  set playbackTime(TauTime value);
  AudioBuffer get inputBuffer;
  set inputBuffer(AudioBuffer value);
  AudioBuffer get outputBuffer;
  set outputBuffer(AudioBuffer value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The `BiquadFilterNode` represents a simple low-order filter, and
/// is created using the [BaseAudioContext.createBiquadFilter] method. It is an
/// [AudioNode] that can represent different kinds of filters, tone control
/// devices, and graphic equalizers. A `BiquadFilterNode` always has exactly one
/// input and one output.
///
/// <table class="properties">
///   <tbody>
///     <tr>
///       <th scope="row">Number of inputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Number of outputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count mode</th>
///       <td><code>"max"</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count</th>
///       <td><code>2</code> (not used in the default count mode)</td>
///     </tr>
///     <tr>
///       <th scope="row">Channel interpretation</th>
///       <td><code>"speakers"</code></td>
///     </tr>
///   </tbody>
/// </table>
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/BiquadFilterNode).
abstract class BiquadFilterNode implements AudioNode {
  /// The `getFrequencyResponse()` method of the [BiquadFilterNode] interface
  /// takes the current filtering algorithm's settings and calculates the
  /// frequency response for frequencies specified in a specified array of
  /// frequencies.
  ///
  /// The two output arrays, `magResponseOutput` and
  /// `phaseResponseOutput`, must be created before calling this method; they
  /// must be the same size as the array of input frequency values
  /// (`frequencyArray`).
  void getFrequencyResponse(
    TauFloat32Array frequencyHz,
    TauFloat32Array magResponse,
    TauFloat32Array phaseResponse,
  );

  /// The `type` property of the [BiquadFilterNode] is a string (enum)
  /// value defining the kind of filtering algorithm the node is implementing.
  BiquadFilterType get type;
  set type(BiquadFilterType value);

  /// The `frequency` property of the [BiquadFilterNode] is an
  /// [a-rate](https://developer.mozilla.org/en-US/docs/Web/API/AudioParam#a-rate)
  /// [AudioParam] — a double representing a frequency in the current filtering
  /// algorithm measured in hertz (Hz).
  ///
  /// Its default value is `350`, with a nominal range of `10` to the
  /// [Nyquist frequency](https://en.wikipedia.org/wiki/Nyquist_frequency) —
  /// that is, half of the sample rate.
  AudioParam get frequency;

  /// The `detune` property of the [BiquadFilterNode] is an
  /// [a-rate](https://developer.mozilla.org/en-US/docs/Web/API/AudioParam#a-rate)
  /// [AudioParam] representing detuning of the frequency in
  /// [cents](https://en.wikipedia.org/wiki/Cent_%28music%29).
  AudioParam get detune;

  /// The `Q` property of the [BiquadFilterNode] is an
  /// [a-rate](https://developer.mozilla.org/en-US/docs/Web/API/AudioParam#a-rate)
  /// [AudioParam], a double representing a
  /// [Q factor](https://en.wikipedia.org/wiki/Q_factor), or _quality factor_.
  ///
  /// It is a dimensionless value with a default value of `1` and a nominal
  /// range of `0.0001` to `1000`.
  AudioParam get Q;

  /// The `gain` property of the [BiquadFilterNode] is an
  /// [a-rate](https://developer.mozilla.org/en-US/docs/Web/API/AudioParam#a-rate)
  /// [AudioParam] — a double representing the
  /// [gain](https://en.wikipedia.org/wiki/Gain) used in the current filtering
  /// algorithm.
  ///
  /// When its value is positive, it represents a real gain; when negative, it
  /// represents an attenuation.
  ///
  /// It is expressed in dB, has a default value of `0`, and can take a value in
  /// a nominal range of `-40` to `40`.
  AudioParam get gain;
}

// ------------------------------------------------------------------------------------------------------------------

abstract class BiquadFilterOptions implements AudioNodeOptions {
  BiquadFilterType get type;
  set type(BiquadFilterType value);
  double get Q;
  set Q(num value);
  double get detune;
  set detune(num value);
  double get frequency;
  set frequency(num value);
  double get gain;
  set gain(num value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The `ChannelMergerNode` interface, often used in conjunction with its
/// opposite, [ChannelSplitterNode], reunites different mono inputs into a
/// single output. Each input is used to fill a channel of the output. This is
/// useful for accessing each channels separately, e.g. for performing channel
/// mixing where gain must be separately controlled on each channel.
///
/// ![Default channel merger node with six mono inputs combining to form a
/// single output.](webaudiomerger.png)
///
/// If `ChannelMergerNode` has one single output, but as many inputs as there
/// are channels to merge; the number of inputs is defined as a parameter of its
/// constructor and the call to [BaseAudioContext.createChannelMerger]. In the
/// case that no value is given, it will default to `6`.
///
/// Using a `ChannelMergerNode`, it is possible to create outputs with more
/// channels than the rendering hardware is able to process. In that case, when
/// the signal is sent to the [BaseAudioContext.listener] object, supernumerary
/// channels will be ignored.
///
/// <table class="properties">
///   <tbody>
///     <tr>
///       <th scope="row">Number of inputs</th>
///       <td>variable; default to <code>6</code>.</td>
///     </tr>
///     <tr>
///       <th scope="row">Number of outputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count mode</th>
///       <td><code>"explicit"</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count</th>
///       <td><code>2 </code>(not used in the default count mode)</td>
///     </tr>
///     <tr>
///       <th scope="row">Channel interpretation</th>
///       <td><code>"speakers"</code></td>
///     </tr>
///   </tbody>
/// </table>
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/ChannelMergerNode).
abstract class ChannelMergerNode implements AudioNode {}

// ------------------------------------------------------------------------------------------------------------------

abstract class ChannelMergerOptions implements AudioNodeOptions {
  int get numberOfInputs;
  set numberOfInputs(int value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The `ChannelSplitterNode` interface, often used in conjunction with its
/// opposite, [ChannelMergerNode], separates the different channels of an audio
/// source into a set of mono outputs. This is useful for accessing each channel
/// separately, e.g. for performing channel mixing where gain must be separately
/// controlled on each channel.
///
/// ![Default channel splitter node with a single input splitting to form 6 mono
/// outputs.](webaudiosplitter.png)
///
/// If your `ChannelSplitterNode` always has one single input, the amount of
/// outputs is defined by a parameter on its constructor and the call to
/// [BaseAudioContext.createChannelSplitter]. In the case that no value is
/// given, it will default to `6`. If there are fewer channels in the input than
/// there are outputs, supernumerary outputs are silent.
///
/// <table class="properties">
///   <tbody>
///     <tr>
///       <th scope="row">Number of inputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Number of outputs</th>
///       <td>variable; default to <code>6</code>.</td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count mode</th>
///       <td>
///         <code>"explicit"</code> Older implementations, as per earlier versions
/// of the spec use <code>"max"</code>.
///       </td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count</th>
///       <td>
/// Fixed to the number of outputs. Older implementations, as per earlier
/// versions of the spec use <code>2 </code>(not used in the default count
/// mode).
///       </td>
///     </tr>
///     <tr>
///       <th scope="row">Channel interpretation</th>
///       <td><code>"discrete"</code></td>
///     </tr>
///   </tbody>
/// </table>
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/ChannelSplitterNode).
abstract class ChannelSplitterNode implements AudioNode {}

// ------------------------------------------------------------------------------------------------------------------

abstract class ChannelSplitterOptions implements AudioNodeOptions {
  int get numberOfOutputs;
  set numberOfOutputs(int value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The `ConstantSourceNode` interface—part of the Web Audio API—represents an
/// audio source (based upon [AudioScheduledSourceNode]) whose output is single
/// unchanging value. This makes it useful for cases in which you need a
/// constant value coming in from an audio source. In addition, it can be used
/// like a constructible [AudioParam] by automating the value of its
/// [ConstantSourceNode.offset] or by connecting another node to it; see
/// [Controlling multiple parameters with ConstantSourceNode](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API/Controlling_multiple_parameters_with_ConstantSourceNode).
///
/// A `ConstantSourceNode` has no inputs and exactly one monaural (one-channel)
/// output. The output's value is always the same as the value of the
/// [ConstantSourceNode.offset] parameter.
///
/// <table class="properties">
///   <tbody>
///     <tr>
///       <th scope="row">Number of inputs</th>
///       <td><code>0</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Number of outputs</th>
///       <td><code>1</code></td>
///     </tr>
///   </tbody>
/// </table>
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/ConstantSourceNode).
abstract class ConstantSourceNode implements AudioScheduledSourceNode {
  /// The read-only `offset` property of the [ConstantSourceNode]
  /// returns a [AudioParam] object indicating the numeric
  /// [a-rate](https://developer.mozilla.org/en-US/docs/Web/API/AudioParam#a-rate)
  /// value which is always returned
  /// by the source when asked for the next sample.
  ///
  /// > **Note:** While the `AudioParam` named `offset` is read-only, the
  /// > `value` property within is not. So you can change the value of
  /// > `offset` by setting the value of
  /// > `ConstantSourceNode.offset.value`:
  /// >
  /// > ```js
  /// > myConstantSourceNode.offset.value = newValue;
  /// > ```
  AudioParam get offset;
}

// ------------------------------------------------------------------------------------------------------------------

abstract class ConstantSourceOptions {
  double get offset;
  set offset(num value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The `ConvolverNode` is an [AudioNode] that performs a Linear
/// Convolution on a given [AudioBuffer], often used to achieve a reverb effect.
/// A `ConvolverNode` always has exactly one input and one output.
///
/// > **Note:** For more information on the theory behind Linear Convolution,
/// > see the
/// > [Convolution article on Wikipedia](https://en.wikipedia.org/wiki/Convolution).
///
/// <table class="properties">
///   <tbody>
///     <tr>
///       <th scope="row">Number of inputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Number of outputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count mode</th>
///       <td><code>"clamped-max"</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count</th>
///       <td><code>1</code>, <code>2</code>, or <code>4</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel interpretation</th>
///       <td><code>"speakers"</code></td>
///     </tr>
///   </tbody>
/// </table>
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/ConvolverNode).
abstract class ConvolverNode implements AudioNode {
  /// The **`buffer`** property of the [ConvolverNode] represents a
  /// mono, stereo, or 4-channel [AudioBuffer] containing the (possibly
  /// multichannel) impulse response used by the `ConvolverNode` to create the
  /// reverb effect.
  ///
  /// This is normally a simple recording of as-close-to-an-impulse as can be
  /// found in the space you want to model. For example, if you want to model
  /// the reverb in your bathroom, you might set up a microphone near the door
  /// to record the sound of a balloon pop or synthesized impulse from the sink.
  /// That audio recording could then be used as the buffer.
  ///
  /// This audio buffer must have the same sample-rate as the `AudioContext` or
  /// an exception will be thrown. At the time when this attribute is set, the
  /// buffer and the state of the attribute will be used to configure the
  /// `ConvolverNode` with this impulse response having the given normalization.
  /// The initial value of this attribute is `null`.
  AudioBuffer? get buffer;
  set buffer(AudioBuffer? value);

  /// The `normalize` property of the [ConvolverNode] interface
  /// is a boolean that controls whether the impulse response from the buffer
  /// will be
  /// scaled by an equal-power normalization when the `buffer` attribute is set,
  /// or not.
  ///
  /// Its default value is `true` in order to achieve a more uniform output
  /// level from the convolver, when loaded with diverse impulse responses. If
  /// normalize is
  /// set to `false`, then the convolution will be rendered with no
  /// pre-processing/scaling of the impulse response. Changes to this value do
  /// not take
  /// effect until the next time the `buffer` attribute is set.
  bool get normalize;
  set normalize(bool value);
}

// ------------------------------------------------------------------------------------------------------------------

abstract class ConvolverOptions implements AudioNodeOptions {
  AudioBuffer? get buffer;
  set buffer(AudioBuffer? value);
  bool get disableNormalization;
  set disableNormalization(bool value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The **`DelayNode`** represents a
/// [delay-line](https://en.wikipedia.org/wiki/Digital_delay_line); an
/// [AudioNode] audio-processing module that causes a delay between the arrival
/// of an input data and its propagation to the output.
///
/// A `DelayNode` always has exactly one input and one output, both with the
/// same amount of channels.
///
/// ![The DelayNode acts as a delay-line, here with a value of
/// 1s.](webaudiodelaynode.png)
///
/// When creating a graph that has a cycle, it is mandatory to have at least one
/// `DelayNode` in the cycle, or the nodes taking part in the cycle will be
/// muted.
///
/// <table class="properties">
///   <tbody>
///     <tr>
///       <th scope="row">Number of inputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Number of outputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count mode</th>
///       <td><code>"max"</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count</th>
///       <td><code>2</code> (not used in the default count mode)</td>
///     </tr>
///     <tr>
///       <th scope="row">Channel interpretation</th>
///       <td><code>"speakers"</code></td>
///     </tr>
///   </tbody>
/// </table>
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/DelayNode).
abstract class DelayNode implements AudioNode {
  /// The `delayTime` property of the [DelayNode] is an
  /// [a-rate](https://developer.mozilla.org/en-US/docs/Web/API/AudioParam#a-rate)
  /// [AudioParam] representing the amount of delay to apply.
  ///
  /// `delayTime` is expressed in seconds, its minimal value is `0`, and its
  /// maximum value is defined by the `maxDelayTime` argument of the
  /// [BaseAudioContext.createDelay] method that created it.
  ///
  /// > **Note:** Though the [AudioParam] returned is read-only, the value it
  /// > represents is not.
  AudioParam get delayTime;
}

// ------------------------------------------------------------------------------------------------------------------

abstract class DelayOptions implements AudioNodeOptions {
  TauTime get maxDelayTime;
  set maxDelayTime(TauTime value);
  TauTime get delayTime;
  set delayTime(TauTime value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The `DynamicsCompressorNode` provides a compression effect, which
/// lowers the volume of the loudest parts of the signal in order to help
/// prevent clipping and distortion that can occur when multiple sounds are
/// played and multiplexed together at once. This is often used in musical
/// production and game audio. `DynamicsCompressorNode` is an [AudioNode] that
/// has exactly one input and one output.
///
/// <table class="properties">
///   <tbody>
///     <tr>
///       <th scope="row">Number of inputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Number of outputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count mode</th>
///       <td><code>"clamped-max"</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count</th>
///       <td><code>2</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel interpretation</th>
///       <td><code>"speakers"</code></td>
///     </tr>
///   </tbody>
/// </table>
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/DynamicsCompressorNode).
abstract class DynamicsCompressorNode implements AudioNode {
  /// The `threshold` property of the [DynamicsCompressorNode] is a
  /// [k-rate](https://developer.mozilla.org/en-US/docs/Web/API/AudioParam#k-rate)
  /// [AudioParam] representing the decibel value above which the compression
  /// will start taking effect.
  ///
  /// The `threshold` property's default value is `-24` and it can be set
  /// between `-100` and `0`.
  ///
  /// ![The threshold attribute has no effect on signals lowers than its value,
  /// but induce volume reduction on signal stronger than its
  /// value.](webaudiothreshold.png)
  AudioParam get threshold;

  /// The `knee` property of the [DynamicsCompressorNode] is a
  /// [k-rate](https://developer.mozilla.org/en-US/docs/Web/API/AudioParam#k-rate)
  /// [AudioParam] containing a decibel value representing the range above the
  /// threshold where the curve smoothly transitions to the compressed portion.
  ///
  /// The `knee` property's default value is `30` and it can be set between `0`
  /// and `40`.
  ///
  /// ![Describes the effect of a knee, showing two curves one for a hard knee,
  /// the other for a soft knee.](webaudioknee.png)
  AudioParam get knee;

  /// The `ratio` property of the [DynamicsCompressorNode] Is a
  /// [k-rate](https://developer.mozilla.org/en-US/docs/Web/API/AudioParam#k-rate)
  /// [AudioParam] representing the amount of change, in dB, needed in the input
  /// for a 1 dB change in the output.
  ///
  /// The `ratio` property's default value is `12` and it can be set between `1`
  /// and `20`.
  ///
  /// ![Describes the effect of different ratio on the output signal](webaudioratio.png)
  AudioParam get ratio;

  /// The **`reduction`** read-only property of the [DynamicsCompressorNode]
  /// is a float representing the amount of gain reduction currently
  /// applied by the compressor to the signal.
  ///
  /// Intended for metering purposes, it returns a value in dB, or `0` (no gain
  /// reduction) if no signal is fed into the `DynamicsCompressorNode`. The
  /// range of this value is between `-20` and `0` (in dB).
  double get reduction;

  /// The `attack` property of the [DynamicsCompressorNode] is a
  /// [k-rate](https://developer.mozilla.org/en-US/docs/Web/API/AudioParam#k-rate)
  /// [AudioParam] representing the amount of time, in seconds, required to
  /// reduce the gain by 10 dB. It defines how quickly the signal is adapted
  /// when its volume is increased.
  ///
  /// The `attack` property's default value is `0.003` and it can be set between
  /// `0` and `1`.
  AudioParam get attack;

  /// The `release` property of the [DynamicsCompressorNode] Is a
  /// [k-rate](https://developer.mozilla.org/en-US/docs/Web/API/AudioParam#k-rate)
  /// [AudioParam] representing the amount of time, in seconds, required to
  /// increase the gain by 10 dB. It defines how quick the signal is adapted
  /// when its volume is reduced.
  ///
  /// The `release` property's default value is `0.25` and it can be set between
  /// `0` and `1`.
  AudioParam get release;
}

// ------------------------------------------------------------------------------------------------------------------

abstract class DynamicsCompressorOptions implements AudioNodeOptions {
  double get attack;
  set attack(num value);
  double get knee;
  set knee(num value);
  double get ratio;
  set ratio(num value);
  double get release;
  set release(num value);
  double get threshold;
  set threshold(num value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The `GainNode` represents a change in volume. It is an [AudioNode]
/// audio-processing module that causes a given gain to be applied to the input
/// data before its propagation to the output. A `GainNode` always has exactly
/// one input and one output, both with the same number of channels.
///
/// The gain is a unitless value, changing with time, that is multiplied to each
/// corresponding sample of all input channels. If modified, the new gain is
/// instantly applied, causing unaesthetic 'clicks' in the resulting audio. To
/// prevent this from happening, never change the value directly but use the
/// exponential interpolation methods on the [AudioParam] interface.
///
/// ![The GainNode is increasing the gain of the output.](webaudiogainnode.png)
///
/// <table class="properties">
///   <tbody>
///     <tr>
///       <th scope="row">Number of inputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Number of outputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count mode</th>
///       <td><code>"max"</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count</th>
///       <td><code>2</code> (not used in the default count mode)</td>
///     </tr>
///     <tr>
///       <th scope="row">Channel interpretation</th>
///       <td><code>"speakers"</code></td>
///     </tr>
///   </tbody>
/// </table>
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/GainNode).
abstract class GainNode implements AudioNode {
  /// The `gain` property of the [GainNode] is an
  /// [a-rate](https://developer.mozilla.org/en-US/docs/Web/API/AudioParam#a-rate)
  /// [AudioParam] representing the amount of gain to apply.
  AudioParam get gain;
}

// ------------------------------------------------------------------------------------------------------------------

abstract class GainOptions implements AudioNodeOptions {
  double get gain;
  set gain(num value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The **`IIRFilterNode`** of the
/// [Web Audio API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API)
/// is a [AudioNode] processor which implements a general
/// **[infinite impulse response](https://en.wikipedia.org/wiki/Infinite_impulse_response)**
/// (IIR) filter; this type of filter can be used to implement tone control
/// devices and graphic equalizers as well. It lets the parameters of the filter
/// response be specified, so that it can be tuned as needed.
///
/// <table class="properties">
///   <tbody>
///     <tr>
///       <th scope="row">Number of inputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Number of outputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count mode</th>
///       <td><code>"max"</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count</th>
///       <td>Same as on the input</td>
///     </tr>
///     <tr>
///       <th scope="row">Channel interpretation</th>
///       <td><code>"speakers"</code></td>
///     </tr>
///   </tbody>
/// </table>
///
/// Typically, it's best to use the [BiquadFilterNode] to implement
/// higher-order filters. There are several reasons why:
///
/// - Biquad filters are typically less sensitive to numeric quirks.
/// - The filter parameters of biquad filters can be automated.
/// - All even-ordered IIR filters can be created using [BiquadFilterNode].
///
/// However, if you need to create an odd-ordered IIR filter, you'll need to use
/// `IIRFilterNode`. You may also find this useful if you don't need
/// automation, or for other reasons.
///
/// > **Note:** Once the node has been created, you can't change its
/// > coefficients.
///
/// `IIRFilterNode`s have a tail-time reference; they continue to output
/// non-silent audio with zero input. As an IIR filter, the non-zero input
/// continues forever, but this can be limited after some finite time in
/// practice, when the output has approached zero closely enough. The actual
/// time that takes depends on the filter coefficients provided.
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/IIRFilterNode).
abstract class IIRFilterNode implements AudioNode {
  /// The `getFrequencyResponse()` method of the [IIRFilterNode]
  /// takes the current filtering algorithm's settings and calculates
  /// the
  /// frequency response for frequencies specified in a specified array of
  /// frequencies.
  ///
  /// The two output arrays, `magResponseOutput` and
  /// `phaseResponseOutput`, must be created before calling this method; they
  /// must be the same size as the array of input frequency values
  /// (`frequencyArray`).
  void getFrequencyResponse(
    TauFloat32Array frequencyHz,
    TauFloat32Array magResponse,
    TauFloat32Array phaseResponse,
  );
}

// ------------------------------------------------------------------------------------------------------------------

abstract class IIRFilterOptions implements AudioNodeOptions {
  TauArray<TauNumber> get feedforward;
  set feedforward(TauArray<TauNumber> value);
  TauArray<TauNumber> get feedback;
  set feedback(TauArray<TauNumber> value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The `MediaElementAudioSourceNode` represents an audio source
/// consisting of an HTML `audio` or `video` element. It is an [AudioNode] that
/// acts as an audio source.
///
/// A `MediaElementAudioSourceNode` has no inputs and exactly one output, and is
/// created using the [AudioContext.createMediaElementSource] method. The number
/// of channels in the output equals the number of channels of the audio
/// referenced by the [HTMLMediaElement] used in the creation of the node, or is
/// 1 if the [HTMLMediaElement] has no audio.
///
/// <table class="properties">
///   <tbody>
///     <tr>
///       <th scope="row">Number of inputs</th>
///       <td><code>0</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Number of outputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count</th>
///       <td>
/// 2 (but note that [AudioNode.channelCount] is only used for up-mixing and
/// down-mixing [AudioNode] inputs, and [MediaElementAudioSourceNode] doesn't
/// have any input)
///       </td>
///     </tr>
///   </tbody>
/// </table>
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/MediaElementAudioSourceNode).
abstract class MediaElementAudioSourceNode implements AudioNode {
  /// The [MediaElementAudioSourceNode] interface's
  /// read-only **`mediaElement`** property indicates the
  /// [HTMLMediaElement] that contains the audio track from which the node is
  /// receiving audio.
  ///
  /// This stream was specified when the node was first created,
  /// either using the [MediaElementAudioSourceNode.MediaElementAudioSourceNode]
  /// constructor or the [AudioContext.createMediaElementSource] method.
  MediaElement get mediaElement;
}

// ------------------------------------------------------------------------------------------------------------------

abstract class MediaElementAudioSourceOptions {
  MediaElement get mediaElement;
  set mediaElement(MediaElement value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The `MediaStreamAudioDestinationNode` represents an audio
/// destination consisting of a
/// [WebRTC](https://developer.mozilla.org/en-US/docs/Web/API/WebRTC_API)
/// [MediaStream] with a single `AudioMediaStreamTrack`, which can be used in a
/// similar way to a `MediaStream` obtained from [MediaDevices.getUserMedia].
///
/// It is an [AudioNode] that acts as an audio destination, created using the
/// [AudioContext.createMediaStreamDestination] method.
///
/// <table class="properties">
///   <tbody>
///     <tr>
///       <th scope="row">Number of inputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Number of outputs</th>
///       <td><code>0</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count</th>
///       <td><code>2</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count mode</th>
///       <td><code>"explicit"</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count interpretation</th>
///       <td><code>"speakers"</code></td>
///     </tr>
///   </tbody>
/// </table>
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamAudioDestinationNode).
abstract class MediaStreamAudioDestinationNode implements AudioNode {
  /// The `stream` property of the [AudioContext] represents a
  /// [MediaStream] containing a single audio [MediaStreamTrack] with the same
  /// number of channels as the node itself.
  ///
  /// You can use this property to get a stream out of the audio graph and feed
  /// it into another construct, such as a
  /// [Media Recorder](https://developer.mozilla.org/en-US/docs/Web/API/MediaStream_Recording_API).
  MediaStream get stream;
}

// ------------------------------------------------------------------------------------------------------------------
abstract class MediaRecorder {
  /* ctor */ MediaRecorder(MediaStream stream, String mimeType,
      [MediaRecorderOptions? options]);

  /// Specific τ
  String makeUrl();

  /// Specific τ
  void makeFile(String fileName);

  /// Specific τ
  Future<ByteBuffer> makeBuffer();

  /// The **`isTypeSupported()`** static method of the [MediaRecorder] interface
  /// returns a `Boolean` which is `true` if the MIME media type specified is
  /// one the user agent should be able to successfully record.
  bool isTypeSupported(String type);

  /// The **`start()`** method of the [MediaRecorder] interface begins recording
  /// media into one or more [Blob] objects.
  ///
  /// You can
  /// record the entire duration of the media into a single `Blob` (or until you
  /// call [MediaRecorder.requestData]), or you can specify the
  /// number of milliseconds to record at a time. Then, each time that amount of
  /// media has
  /// been recorded, an event will be delivered to let you act upon the recorded
  /// media, while
  /// a new `Blob` is created to record the next slice of the media.
  ///
  /// Assuming the `MediaRecorder`'s [MediaRecorder.state]
  /// is `inactive`, `start()` sets the `state` to
  /// `recording`, then begins capturing media from the input stream. A
  /// `Blob` is created and the data is collected in it until the time slice
  /// period
  /// elapses or the source media ends. Each time a `Blob` is filled up to that
  /// point (the timeslice duration or the end-of-media, if no slice duration
  /// was provided), a
  /// [MediaRecorder.dataavailable_event] event is sent to the `MediaRecorder`
  /// with the
  /// recorded data. If the source is still playing, a new `Blob` is created and
  /// recording continues into that, and so forth.
  ///
  /// When the source stream ends, `state` is set to `inactive` and
  /// data gathering stops. A final [MediaRecorder.dataavailable_event] event is
  /// sent to the
  /// `MediaRecorder`, followed by a [MediaRecorder.stop_event] event.
  ///
  /// > **Note:** If the browser is unable to start recording or continue
  /// > recording, it will raise an [MediaRecorder.error_event] event, followed
  /// > by a
  /// > [MediaRecorder.dataavailable_event] event containing the `Blob` it
  /// > has gathered, followed by the [MediaRecorder.stop_event] event.
  void start([int timeslice]);

  /// The **`stop()`** method of the [MediaRecorder] interface is
  /// used to stop media capture.
  ///
  /// When the `stop()` method is invoked, the UA queues a task that runs the
  /// following steps:
  ///
  /// 1. If [MediaRecorder.state] is "inactive", raise a DOM
  /// `InvalidState` error and terminate these steps. If the
  /// [MediaRecorder.state] is not "inactive", continue on to the next step.
  /// 2. Set the [MediaRecorder.state] to "inactive" and stop capturing media.
  /// 3. Raise a `dataavailable` event containing the Blob of data that has been
  /// gathered.
  /// 4. Raise a `stop` event.
  void stop();

  /// The **`pause()`** method of the [MediaRecorder] interface is used
  /// to pause recording of media streams.
  ///
  /// When a `MediaRecorder` object's `pause()`method is called, the
  /// browser queues a task that runs the below steps:
  ///
  /// 1. If [MediaRecorder.state] is "inactive", raise a DOM
  /// `InvalidState` error and terminate these steps. If not, continue to the
  /// next step.
  /// 2. Set [MediaRecorder.state] to "paused".
  /// 3. Stop gathering data into the current [Blob], but keep it available so
  /// that recording can be resumed later on.
  /// 4. Raise a [MediaRecorder.pause_event] event.
  void pause();

  /// The **`resume()`** method of the [MediaRecorder] interface is used to
  /// resume media recording when it has been previously paused.
  ///
  /// If [MediaRecorder.state] is already "recording", calling `resume()` has no
  /// effect.
  ///
  /// When the `resume()` method is invoked, the browser queues a task that runs
  /// the following steps:
  ///
  /// 1. If [MediaRecorder.state] is "inactive", raise a DOM
  /// `InvalidStateError` exception and terminate these steps. If
  /// [MediaRecorder.state] is not "inactive", continue to the next step.
  /// 2. Set [MediaRecorder.state] to "recording".
  /// 3. Continue gathering data into the current [Blob].
  /// 4. Raise a `resume` event.
  void resume();

  /// The **`requestData()`**
  /// method of the [MediaRecorder] interface is used to raise a
  /// [MediaRecorder.dataavailable_event] event containing a
  /// [Blob] object of the captured media as it was when the method was
  /// called. This can then be grabbed and manipulated as you wish.
  ///
  /// When the `requestData()` method is invoked, the browser queues a task that
  /// runs the following steps:
  ///
  /// 1. If [MediaRecorder.state] is "inactive", raise a DOM
  /// `InvalidState` error and terminate these steps. If
  /// [MediaRecorder.state] is not "inactive", continue to the next step.
  /// 2. Raise a [MediaRecorder.dataavailable_event] event containing a [Blob]
  /// of the
  /// currently captured data (the Blob is available under the event's `data`
  /// attribute.)
  /// 3. Create a new Blob and place subsequently captured data into it.
  void requestData();

  /// The **`stream`** read-only property of the [MediaRecorder] interface
  /// returns the stream that was passed into the [MediaRecorder.MediaRecorder]
  /// constructor when the `MediaRecorder` was created.
  MediaStream get stream;

  /// The **`mimeType`** read-only property of the [MediaRecorder] interface
  /// returns the  media type that was specified when creating the
  /// [MediaRecorder] object, or, if none was specified, which was chosen by the
  /// browser.
  /// This is the file format of the file that would result from writing all of
  /// the recorded data to disk.
  ///
  /// Keep in mind that not all codecs are supported by a given container; if
  /// you write media using a codec that is not supported by a given media
  /// container, the resulting file may not work reliably if at all when you try
  /// to play it back.
  /// See our
  /// [media type and format guide](https://developer.mozilla.org/en-US/docs/Web/Media/Formats)
  /// for information about container and codec support across browsers.
  ///
  /// > **Note:** The term "MIME type" is officially considered to be
  /// > historical; these strings are now officially known as **media types**.
  /// > MDN Web Docs content uses the terms interchangeably.
  String get mimeType;

  /// The **`state`** read-only property of the [MediaRecorder] interface
  /// returns the current state of the current `MediaRecorder` object.
  RecordingState get state;
  //EventHandler get onstart;
  set onstart(EventHandler value);
  //EventHandler get onstop;
  set onstop(EventHandler value);
  //EventHandler get ondataavailable;
  set ondataavailable(EventHandler value);
  //EventHandler get onpause;
  set onpause(EventHandler value);
  //EventHandler get onresume;
  set onresume(EventHandler value);
  //EventHandler get onerror;
  set onerror(EventHandler value);

  /// The **`videoBitsPerSecond`** read-only
  /// property of the [MediaRecorder] interface returns the video encoding
  /// bit rate in use.
  ///
  /// This may differ from the bit rate specified in the
  /// constructor, if it was provided.
  int get videoBitsPerSecond;

  /// The **`audioBitsPerSecond`** read-only
  /// property of the [MediaRecorder] interface returns the audio encoding bit
  /// rate in use.
  ///
  /// This may differ from the bit rate specified in the constructor (if
  /// it was provided).
  int get audioBitsPerSecond;
}

/*
abstract class TauRecorder  extends MediaRecorder {
  /* ctor */ TauRecorder(MediaStream stream, String type, [MediaRecorderOptions? options]) :  super(stream, options);

  String makeUrl();
  void  makeFile(fileName);
  void start([int? timeslice]);



}
*/

// ------------------------------------------------------------------------------------------------------------------

abstract class MediaRecorderOptions {
  /* ctor */ MediaRecorderOptions({
    String? mimeType,
    int? audioBitsPerSecond,
    int? videoBitsPerSecond,
    int? bitsPerSecond,
    BitrateMode? audioBitrateMode,
    DOMHighResTimeStamp? videoKeyFrameIntervalDuration,
    int? videoKeyFrameIntervalCount,
  });

  String get mimeType;
  set mimeType(String value);
  int get audioBitsPerSecond;
  set audioBitsPerSecond(int value);
  int get videoBitsPerSecond;
  set videoBitsPerSecond(int value);
  int get bitsPerSecond;
  set bitsPerSecond(int value);
  BitrateMode get audioBitrateMode;
  set audioBitrateMode(BitrateMode value);
  int get videoKeyFrameIntervalDuration;
  set videoKeyFrameIntervalDuration(DOMHighResTimeStamp value);
  int get videoKeyFrameIntervalCount;
  set videoKeyFrameIntervalCount(int value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The **`MediaStreamAudioSourceNode`** is a type of [AudioNode]
/// which operates as an audio source whose media is received from a
/// [MediaStream] obtained using the WebRTC or Media Capture and Streams APIs.
///
/// This media could be from a microphone (through [MediaDevices.getUserMedia])
/// or from a remote peer on a WebRTC call (using the [RTCPeerConnection]'s
/// audio tracks).
///
/// A `MediaStreamAudioSourceNode` has no inputs and exactly one output, and is
/// created using the [AudioContext.createMediaStreamSource] method.
///
/// The `MediaStreamAudioSourceNode` takes the audio from the _first_
/// [MediaStreamTrack] whose [MediaStreamTrack.kind] attribute's value is
/// `audio`. See [Track ordering](#track_ordering) for more information about
/// the order of tracks.
///
/// The number of channels output by the node matches the number of tracks found
/// in the selected audio track.
///
/// <table class="properties">
///   <tbody>
///     <tr>
///       <th scope="row">Number of inputs</th>
///       <td><code>0</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Number of outputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count</th>
///       <td>
/// 2 (but note that [AudioNode.channelCount] is only used for up-mixing and
/// down-mixing [AudioNode] inputs, and [MediaStreamAudioSourceNode] doesn't
/// have any input)
///       </td>
///     </tr>
///   </tbody>
/// </table>
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamAudioSourceNode).
abstract class MediaStreamAudioSourceNode implements AudioNode {
  /// The [MediaStreamAudioSourceNode] interface's
  /// read-only **`mediaStream`** property indicates the
  /// [MediaStream] that contains the audio track from which the node is
  /// receiving audio.
  ///
  /// This stream was specified when the node was first created,
  /// either using the [MediaStreamAudioSourceNode.MediaStreamAudioSourceNode]
  /// constructor or the [AudioContext.createMediaStreamSource] method.
  MediaStream get mediaStream;
}

// ------------------------------------------------------------------------------------------------------------------

abstract class MediaStreamAudioSourceOptions {
  MediaStream get mediaStream;
  set mediaStream(MediaStream value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The **`MediaStreamTrackAudioSourceNode`** is a type of [AudioNode]
/// which represents a source of audio data taken from a specific
/// [MediaStreamTrack] obtained through the
/// [WebRTC](https://developer.mozilla.org/en-US/docs/Web/API/WebRTC_API) or
/// [Media Capture and Streams](https://developer.mozilla.org/en-US/docs/Web/API/Media_Capture_and_Streams_API)
/// APIs.
///
/// The audio itself might be input from a microphone or other audio sampling
/// device, or might be received through a [RTCPeerConnection], among other
/// possible options.
///
/// A `MediaStreamTrackAudioSourceNode` has no inputs and exactly one output,
/// and is created using the [AudioContext.createMediaStreamTrackSource] method.
/// This is similar to [MediaStreamAudioSourceNode], except it lets
/// you specifically state the track to use, rather than assuming the first
/// audio track on a stream.
///
/// <table class="properties">
///   <tbody>
///     <tr>
///       <th scope="row">Number of inputs</th>
///       <td><code>0</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Number of outputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count</th>
///       <td>
/// defined by the first audio [MediaStreamTrack]
/// passed to the
/// [AudioContext.createMediaStreamTrackSource]
/// method that created it.
///       </td>
///     </tr>
///   </tbody>
/// </table>
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/MediaStreamTrackAudioSourceNode).
abstract class MediaStreamTrackAudioSourceNode implements AudioNode {}

// ------------------------------------------------------------------------------------------------------------------

abstract class MediaStreamTrackAudioSourceOptions {
  MediaStreamTrack get mediaStreamTrack;
  set mediaStreamTrack(MediaStreamTrack value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The **`OscillatorNode`** represents a periodic waveform, such as a
/// sine wave. It is an [AudioScheduledSourceNode] audio-processing module that
/// causes a specified frequency of a given wave to be created—in effect, a
/// constant tone.
///
/// <table class="properties">
///   <tbody>
///     <tr>
///       <th scope="row">Number of inputs</th>
///       <td><code>0</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Number of outputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count mode</th>
///       <td><code>max</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count</th>
///       <td><code>2</code> (not used in the default count mode)</td>
///     </tr>
///     <tr>
///       <th scope="row">Channel interpretation</th>
///       <td><code>speakers</code></td>
///     </tr>
///   </tbody>
/// </table>
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/OscillatorNode).
abstract class OscillatorNode implements AudioScheduledSourceNode {
  /// The **`setPeriodicWave()`** method of the [OscillatorNode] is
  /// used to point to a [PeriodicWave]
  /// defining a periodic waveform that can be used to shape the oscillator's
  /// output, when
  /// [OscillatorNode.type] is `custom`.
  void setPeriodicWave(PeriodicWave periodicWave);

  /// The **`type`** property of the [OscillatorNode] specifies what
  /// shape of [waveform](https://en.wikipedia.org/wiki/Waveform) the
  /// oscillator will output. There are several common waveforms available, as
  /// well as an
  /// option to specify a custom waveform shape. The shape of the waveform will
  /// affect the
  /// tone that is produced.
  OscillatorType get type;
  set type(OscillatorType value);

  /// The **`frequency`** property of the [OscillatorNode] is an
  /// [a-rate](https://developer.mozilla.org/en-US/docs/Web/API/AudioParam#a-rate)
  /// [AudioParam] representing the frequency of oscillation in hertz.
  ///
  /// > **Note:** though the `AudioParam` returned is read-only, the value it
  /// > represents is not.
  AudioParam get frequency;

  /// The `detune` property of the [OscillatorNode] is an
  /// [a-rate](https://developer.mozilla.org/en-US/docs/Web/API/AudioParam#a-rate)
  /// [AudioParam] representing detuning of oscillation in
  /// [cents](https://en.wikipedia.org/wiki/Cent_%28music%29).
  ///
  /// > **Note:** though the `AudioParam` returned is read-only, the value it
  /// > represents is not.
  AudioParam get detune;
}

// ------------------------------------------------------------------------------------------------------------------

abstract class OscillatorOptions implements AudioNodeOptions {
  OscillatorType get type;
  set type(OscillatorType value);
  double get frequency;
  set frequency(num value);
  double get detune;
  set detune(num value);
  PeriodicWave get periodicWave;
  set periodicWave(PeriodicWave value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The `PannerNode` defines an audio-processing object that
/// represents the location, direction, and behavior of an audio source signal
/// in a simulated physical space. This [AudioNode] uses right-hand Cartesian
/// coordinates to describe the source's _position_ as a vector and its
/// _orientation_ as a 3D directional cone.
///
/// A `PannerNode` always has exactly one input and one output: the input can be
/// _mono_ or _stereo_ but the output is always _stereo_ (2 channels); you can't
/// have panning effects without at least two audio channels!
///
/// ![The PannerNode defines a spatial position and direction for a given
/// signal.](webaudiopannernode.png)
///
/// <table class="properties">
///   <tbody>
///     <tr>
///       <th scope="row">Number of inputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Number of outputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count mode</th>
///       <td><code>"clamped-max"</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count</th>
///       <td><code>2</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel interpretation</th>
///       <td><code>"speakers"</code></td>
///     </tr>
///   </tbody>
/// </table>
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/PannerNode).
abstract class PannerNode implements AudioNode {
  /// > **Note:** The suggested replacement for this deprecated method is to
  /// > instead set the
  /// > [`positionX`](https://developer.mozilla.org/en-US/docs/Web/API/PannerNode/positionX),
  /// > [`positionY`](https://developer.mozilla.org/en-US/docs/Web/API/PannerNode/positionY),
  /// > and
  /// > [`positionZ`](https://developer.mozilla.org/en-US/docs/Web/API/PannerNode/positionZ)
  /// > attributes directly.
  ///
  /// The `setPosition()` method of the [PannerNode] defines the
  /// position of the audio source relative to the listener (represented by an
  /// [AudioListener] object stored in the [BaseAudioContext.listener]
  /// attribute.) The three parameters `x`, `y` and `z` are unitless and
  /// describe the source's position in 3D space using the right-hand Cartesian
  /// coordinate system.
  ///
  /// The `setPosition()` method's default value of the position is `(0, 0, 0)`.
  void setPosition(
    num x,
    num y,
    num z,
  );

  /// > **Note:** The suggested replacement for this deprecated method is to
  /// > instead set the
  /// > [`orientationX`](https://developer.mozilla.org/en-US/docs/Web/API/PannerNode/orientationX),
  /// > [`orientationY`](https://developer.mozilla.org/en-US/docs/Web/API/PannerNode/orientationY),
  /// > and
  /// > [`orientationZ`](https://developer.mozilla.org/en-US/docs/Web/API/PannerNode/orientationZ)
  /// > attributes directly.
  ///
  /// The `setOrientation()` method of the [PannerNode] defines the
  /// direction the audio source is playing in.
  ///
  /// This can have a big effect if the sound is very directional — controlled
  /// by the three cone-related attributes [PannerNode.coneInnerAngle],
  /// [PannerNode.coneOuterAngle], and [PannerNode.coneOuterGain]. In such a
  /// case, a sound pointing away from the listener can be very quiet or even
  /// silent.
  ///
  /// The three parameters `x`, `y` and `z` are unitless and describe a
  /// direction vector in 3D space using the right-hand Cartesian coordinate
  /// system. The default value of the direction vector is `(1, 0, 0)`.
  void setOrientation(
    num x,
    num y,
    num z,
  );

  /// The `panningModel` property of the [PannerNode] is an enumerated
  /// value determining which spatialization algorithm to use to position the
  /// audio in 3D space.
  ///
  /// The possible values are:
  ///
  /// - `equalpower`: Represents the equal-power panning algorithm, generally
  ///   regarded as simple and efficient. `equalpower` is the default value.
  /// - `HRTF`: Renders a stereo output of higher quality than `equalpower` — it
  ///   uses a convolution with measured impulse responses from human subjects.
  PanningModelType get panningModel;
  set panningModel(PanningModelType value);

  /// The **`positionX`** property of the [PannerNode] specifies the X
  /// coordinate of the audio source's position in 3D Cartesian
  /// coordinates, corresponding to the _horizontal_ axis (left-right).
  ///
  /// The complete vector is defined by the position of the audio source, given
  /// as
  /// ([PannerNode.positionX], [PannerNode.positionY],
  /// [PannerNode.positionZ]), and the orientation
  /// of the audio source (that is, the direction in which it's facing), given
  /// as
  /// ([PannerNode.orientationX],
  /// [PannerNode.orientationY],
  /// [PannerNode.orientationZ]).
  ///
  /// Depending on the directionality of the sound (as specified using the
  /// attributes
  /// [PannerNode.coneInnerAngle],
  /// [PannerNode.coneOuterAngle], and
  /// [PannerNode.coneOuterGain]), the orientation of the
  /// sound may alter the perceived volume of the sound as it's being played. If
  /// the sound
  /// is pointing toward the listener, it will be louder than if the sound is
  /// pointed away
  /// from the listener.
  ///
  /// The [AudioParam] contained by this property is read only; however, you
  /// can still change the value of the parameter by assigning a new value to
  /// its
  /// [AudioParam.value] property.
  AudioParam get positionX;

  /// The **`positionY`** property of the [PannerNode] specifies the Y
  /// coordinate of the audio source's position in 3D Cartesian
  /// coordinates, corresponding to the _vertical_ axis (top-bottom). The
  /// complete
  /// vector is defined by the position of the audio source, given as
  /// ([PannerNode.positionX], [PannerNode.positionY], [PannerNode.positionZ]),
  /// and the orientation
  /// of the audio source (that is, the direction in which it's facing), given
  /// as
  /// ([PannerNode.orientationX],
  /// [PannerNode.orientationY],
  /// [PannerNode.orientationZ]).
  ///
  /// Depending on the directionality of the sound (as specified using the
  /// attributes
  /// [PannerNode.coneInnerAngle],
  /// [PannerNode.coneOuterAngle], and
  /// [PannerNode.coneOuterGain]), the orientation of the
  /// sound may alter the perceived volume of the sound as it's being played. If
  /// the sound
  /// is pointing toward the listener, it will be louder than if the sound is
  /// pointed away
  /// from the listener.
  ///
  /// The [AudioParam] contained by this property is read only; however, you
  /// can still change the value of the parameter by assigning a new value to
  /// its
  /// [AudioParam.value] property.
  AudioParam get positionY;

  /// The **`positionZ`** property of the [PannerNode] specifies the Z
  /// coordinate of the audio source's position in 3D Cartesian
  /// coordinates, corresponding to the _depth_ axis (behind-in front of the
  /// listener). The complete vector is defined by the position of the audio
  /// source, given
  /// as ([PannerNode.positionX],
  /// [PannerNode.positionY],
  /// [PannerNode.positionZ]),
  /// and the orientation of the audio source (that is, the direction in
  /// which it's facing), given as ([PannerNode.orientationX],
  /// [PannerNode.orientationY],
  /// [PannerNode.orientationZ]).
  ///
  /// Depending on the directionality of the sound (as specified using the
  /// attributes
  /// [PannerNode.coneInnerAngle],
  /// [PannerNode.coneOuterAngle], and
  /// [PannerNode.coneOuterGain]), the orientation of the
  /// sound may alter the perceived volume of the sound as it's being played. If
  /// the sound
  /// is pointing toward the listener, it will be louder than if the sound is
  /// pointed away
  /// from the listener.
  ///
  /// The [AudioParam] contained by this property is read only; however, you
  /// can still change the value of the parameter by assigning a new value to
  /// its
  /// [AudioParam.value] property.
  AudioParam get positionZ;

  /// The **`orientationX`** property of the [PannerNode] indicates
  /// the X (horizontal) component of the
  /// direction in which the audio source is facing, in a 3D Cartesian
  /// coordinate space.
  ///
  /// The complete vector is defined by the position of the audio source, given
  /// as
  /// ([PannerNode.positionX], [PannerNode.positionY],
  /// [PannerNode.positionZ]), and the orientation
  /// of the audio source (that is, the direction in which it's facing), given
  /// as
  /// ([PannerNode.orientationX],
  /// [PannerNode.orientationY],
  /// [PannerNode.orientationZ]).
  ///
  /// Depending on the directionality of the sound (as specified using the
  /// attributes
  /// [PannerNode.coneInnerAngle],
  /// [PannerNode.coneOuterAngle], and
  /// [PannerNode.coneOuterGain]), the orientation of the
  /// sound may alter the perceived volume of the sound as it's being played. If
  /// the sound
  /// is pointing toward the listener, it will be louder than if the sound is
  /// pointed away
  /// from the listener.
  ///
  /// The [AudioParam] contained by this property is read only; however, you
  /// can still change the value of the parameter by assigning a new value to
  /// its
  /// [AudioParam.value] property.
  AudioParam get orientationX;

  /// The **`orientationY`** property of the [PannerNode] interface
  /// indicates the Y (vertical) component of the direction the audio source is
  /// facing, in 3D Cartesian coordinate space.
  ///
  /// The complete vector is defined by the position of the audio source, given
  /// as
  /// ([PannerNode.positionX], [PannerNode.positionY],
  /// [PannerNode.positionZ]), and the orientation
  /// of the audio source (that is, the direction in which it's facing), given
  /// as
  /// ([PannerNode.orientationX],
  /// [PannerNode.orientationY],
  /// [PannerNode.orientationZ]).
  ///
  /// Depending on the directionality of the sound (as specified using the
  /// attributes
  /// [PannerNode.coneInnerAngle],
  /// [PannerNode.coneOuterAngle], and
  /// [PannerNode.coneOuterGain]), the orientation of the
  /// sound may alter the perceived volume of the sound as it's being played. If
  /// the sound
  /// is pointing toward the listener, it will be louder than if the sound is
  /// pointed away
  /// from the listener.
  ///
  /// The [AudioParam] contained by this property is read only; however, you
  /// can still change the value of the parameter by assigning a new value to
  /// its
  /// [AudioParam.value] property.
  AudioParam get orientationY;

  /// The **`orientationZ`** property of the [PannerNode] interface
  /// indicates the Z (depth) component of the direction the audio source is
  /// facing, in 3D Cartesian coordinate space.
  ///
  /// The complete vector is defined by the position of the audio source, given
  /// as
  /// ([PannerNode.positionX], [PannerNode.positionY],
  /// [PannerNode.positionZ]), and the orientation
  /// of the audio source (that is, the direction in which it's facing), given
  /// as
  /// ([PannerNode.orientationX],
  /// [PannerNode.orientationY],
  /// [PannerNode.orientationZ]).
  ///
  /// Depending on the directionality of the sound (as specified using the
  /// attributes
  /// [PannerNode.coneInnerAngle],
  /// [PannerNode.coneOuterAngle], and
  /// [PannerNode.coneOuterGain]), the orientation of the
  /// sound may alter the perceived volume of the sound as it's being played. If
  /// the sound
  /// is pointing toward the listener, it will be louder than if the sound is
  /// pointed away
  /// from the listener.
  ///
  /// The [AudioParam] contained by this property is read only; however, you
  /// can still change the value of the parameter by assigning a new value to
  /// its
  /// [AudioParam.value] property.
  AudioParam get orientationZ;

  /// The `distanceModel` property of the [PannerNode] is an
  /// enumerated value determining which algorithm to use to reduce the volume
  /// of the audio source as it moves away from the listener.
  ///
  /// The possible values are:
  ///
  /// - `linear`: A _linear distance model_ calculating the gain induced by the
  ///   distance according to:
  /// `1 - rolloffFactor * (distance - refDistance) / (maxDistance -
  /// refDistance)`
  /// - `inverse`: An _inverse distance model_ calculating the gain induced by
  ///   the distance according to:
  /// `refDistance / (refDistance + rolloffFactor * (Math.max(distance,
  /// refDistance) - refDistance))`
  /// - `exponential`: An _exponential distance model_ calculating the gain
  ///   induced by the distance according to:
  /// `pow((Math.max(distance, refDistance) / refDistance, -rolloffFactor)`.
  ///
  /// `inverse` is the default value of `distanceModel`.
  DistanceModelType get distanceModel;
  set distanceModel(DistanceModelType value);

  /// The `refDistance` property of the [PannerNode] is a double value
  /// representing the reference distance for reducing volume as the audio
  /// source moves further from the listener – i.e. the distance at which the
  /// volume reduction starts taking effect. This value is used by all distance
  /// models.
  ///
  /// The `refDistance` property's default value is `1`.
  double get refDistance;
  set refDistance(num value);

  /// The `maxDistance` property of the [PannerNode] is a double value
  /// representing the maximum distance between the audio source and the
  /// listener, after which the volume is not reduced any further. This value is
  /// used only by the `linear` distance model.
  ///
  /// The `maxDistance` property's default value is `10000`.
  double get maxDistance;
  set maxDistance(num value);

  /// The `rolloffFactor` property of the [PannerNode] is a double
  /// value describing how quickly the volume is reduced as the source moves
  /// away from the listener. This value is used by all distance models. The
  /// `rolloffFactor` property's default value is `1`.
  double get rolloffFactor;
  set rolloffFactor(num value);

  /// The `coneInnerAngle` property of the [PannerNode] is a double
  /// value describing the angle, in degrees, of a cone inside of which there
  /// will be no volume reduction.
  ///
  /// The `coneInnerAngle` property's default value is `360`, suitable for a
  /// non-directional source.
  double get coneInnerAngle;
  set coneInnerAngle(num value);

  /// The `coneOuterAngle` property of the [PannerNode] is a double
  /// value describing the angle, in degrees, of a cone outside of which the
  /// volume will be reduced by a constant value, defined by the
  /// [PannerNode.coneOuterGain] property.
  ///
  /// The `coneOuterAngle` property's default value is `0`.
  double get coneOuterAngle;
  set coneOuterAngle(num value);

  /// The `coneOuterGain` property of the [PannerNode] is a double
  /// value, describing the amount of volume reduction outside the cone, defined
  /// by the [PannerNode.coneOuterAngle] attribute.
  ///
  /// The `coneOuterGain` property's default value is `0`, meaning that no sound
  /// can be heard outside the cone.
  double get coneOuterGain;
  set coneOuterGain(num value);
}

// ------------------------------------------------------------------------------------------------------------------

abstract class PannerOptions implements AudioNodeOptions {
  PanningModelType get panningModel;
  set panningModel(PanningModelType value);
  DistanceModelType get distanceModel;
  set distanceModel(DistanceModelType value);
  double get positionX;
  set positionX(num value);
  double get positionY;
  set positionY(num value);
  double get positionZ;
  set positionZ(num value);
  double get orientationX;
  set orientationX(num value);
  double get orientationY;
  set orientationY(num value);
  double get orientationZ;
  set orientationZ(num value);
  double get refDistance;
  set refDistance(num value);
  double get maxDistance;
  set maxDistance(num value);
  double get rolloffFactor;
  set rolloffFactor(num value);
  double get coneInnerAngle;
  set coneInnerAngle(num value);
  double get coneOuterAngle;
  set coneOuterAngle(num value);
  double get coneOuterGain;
  set coneOuterGain(num value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The **`PeriodicWave`** defines a periodic waveform that can be
/// used to shape the output of an [OscillatorNode].
///
/// `PeriodicWave` has no inputs or outputs; it is used to define custom
/// oscillators when calling [OscillatorNode.setPeriodicWave]. The
/// `PeriodicWave` itself is created/returned by
/// [BaseAudioContext.createPeriodicWave].
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/PeriodicWave).
abstract class PeriodicWave {}

// ------------------------------------------------------------------------------------------------------------------

abstract class PeriodicWaveConstraints {
  bool get disableNormalization;
  set disableNormalization(bool value);
}

// ------------------------------------------------------------------------------------------------------------------

abstract class PeriodicWaveOptions implements PeriodicWaveConstraints {
  TauArray<TauNumber> get real;
  set real(TauArray<TauNumber> value);
  TauArray<TauNumber> get imag;
  set imag(TauArray<TauNumber> value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The `ScriptProcessorNode` allows the generation, processing, or
/// analyzing of audio using JavaScript.
///
/// > **Note:** This feature was replaced by
/// > [AudioWorklets](https://developer.mozilla.org/en-US/docs/Web/API/AudioWorklet)
/// > and the [AudioWorkletNode] interface.
///
/// The `ScriptProcessorNode` is an [AudioNode] audio-processing
/// module that is linked to two buffers, one containing the input audio data,
/// one containing the processed output audio data. An event, implementing the
/// [AudioProcessingEvent] interface, is sent to the object each time the input
/// buffer contains new data, and the event handler terminates when it has
/// filled the output buffer with data.
///
/// ![The ScriptProcessorNode stores the input in a buffer, send the
/// audioprocess event. The EventHandler takes the input buffer and fill the
/// output buffer which is sent to the output by the
/// ScriptProcessorNode.](webaudioscriptprocessingnode.png)
///
/// The size of the input and output buffer are defined at the creation time,
/// when the [BaseAudioContext.createScriptProcessor] method is called (both are
/// defined by [BaseAudioContext.createScriptProcessor]'s `bufferSize`
/// parameter). The buffer size must be a power of 2 between `256` and `16384`,
/// that is `256`, `512`, `1024`, `2048`, `4096`, `8192` or `16384`. Small
/// numbers lower the _latency_, but large number may be necessary to avoid
/// audio breakup and glitches.
///
/// If the buffer size is not defined, which is recommended, the browser will
/// pick one that its heuristic deems appropriate.
///
/// <table class="properties">
///   <tbody>
///     <tr>
///       <th scope="row">Number of inputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Number of outputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count mode</th>
///       <td><code>"max"</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count</th>
///       <td><code>2</code> (not used in the default count mode)</td>
///     </tr>
///     <tr>
///       <th scope="row">Channel interpretation</th>
///       <td><code>"speakers"</code></td>
///     </tr>
///   </tbody>
/// </table>
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/ScriptProcessorNode).
abstract class ScriptProcessorNode implements AudioNode {
  EventHandler get onaudioprocess;
  set onaudioprocess(EventHandler value);

  /// The `bufferSize` property of the [ScriptProcessorNode] returns
  /// an integer representing both the input and output buffer size, in
  /// sample-frames. Its value can be a power of 2 value in the range `256` –
  /// `16384`.
  ///
  /// > **Note:** This feature was replaced by
  /// > [AudioWorklets](https://developer.mozilla.org/en-US/docs/Web/API/AudioWorklet)
  /// > and the [AudioWorkletNode] interface.
  int get bufferSize;
}

// ------------------------------------------------------------------------------------------------------------------

/// The `StereoPannerNode` of the
/// [Web Audio API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API)
/// represents a simple stereo panner node that can be used to pan an audio
/// stream left or right. It is an [AudioNode] audio-processing module that
/// positions an incoming audio stream in a stereo image using a low-cost
/// equal-power
/// [panning algorithm](https://webaudio.github.io/web-audio-api/#panning-algorithm).
///
/// The [StereoPannerNode.pan] property takes a unitless value between `-1`
/// (full left pan) and `1` (full right pan). This was introduced as a
/// much simpler way to apply a simple panning effect than having to use a full
/// [PannerNode].
///
/// ![The Stereo Panner Node moved the sound's position from the center of two
/// speakers to the left.](stereopannernode.png)
///
/// <table class="properties">
///   <tbody>
///     <tr>
///       <th scope="row">Number of inputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Number of outputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count mode</th>
///       <td><code>"clamped-max"</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count</th>
///       <td><code>2</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel interpretation</th>
///       <td><code>"speakers"</code></td>
///     </tr>
///   </tbody>
/// </table>
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/StereoPannerNode).
abstract class StereoPannerNode implements AudioNode {
  /// The `pan` property of the [StereoPannerNode] is an
  /// [a-rate](https://developer.mozilla.org/en-US/docs/Web/API/AudioParam#a-rate)
  /// [AudioParam] representing the amount of panning to apply. The value can
  /// range between `-1` (full left pan) and `1` (full right pan).
  AudioParam get pan;
}

// ------------------------------------------------------------------------------------------------------------------

abstract class StereoPannerOptions implements AudioNodeOptions {
  double get pan;
  set pan(num value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The **`WaveShaperNode`** represents a non-linear distorter.
///
/// It is an [AudioNode] that uses a curve to apply a wave shaping distortion to
/// the signal. Beside obvious distortion effects, it is often used to add a
/// warm feeling to the signal.
///
/// A `WaveShaperNode` always has exactly one input and one output.
///
/// <table class="properties">
///   <tbody>
///     <tr>
///       <th scope="row">Number of inputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Number of outputs</th>
///       <td><code>1</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count mode</th>
///       <td><code>"max"</code></td>
///     </tr>
///     <tr>
///       <th scope="row">Channel count</th>
///       <td><code>2</code> (not used in the default count mode)</td>
///     </tr>
///     <tr>
///       <th scope="row">Channel interpretation</th>
///       <td><code>"speakers"</code></td>
///     </tr>
///   </tbody>
/// </table>
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/WaveShaperNode).
abstract class WaveShaperNode implements AudioNode {
  /// The `curve` property of the [WaveShaperNode] is a `Float32Array`
  /// of numbers describing the distortion to apply.
  ///
  /// The mid-element of the array is applied to any signal value of `0`, the
  /// first one to signal values of `-1`, and the last to signal values of `1`;
  /// values lower than `-1` or greater than `1` are treated like `-1` or `1`
  /// respectively.
  ///
  /// If necessary, intermediate values of the distortion curve are linearly
  /// interpolated.
  ///
  /// > **Note:** The array can be a `null` value: in that case, no distortion
  /// > is applied to the input signal.
  TauFloat32Array get curve;
  set curve(TauFloat32Array value);

  /// The `oversample` property of the [WaveShaperNode] is an
  /// enumerated value indicating if oversampling must be used. Oversampling is
  /// a technique for creating more samples (up-sampling) before applying a
  /// distortion effect to the audio signal.
  ///
  /// Once applied, the number of samples is reduced to its initial numbers.
  /// This leads to better results by avoiding some aliasing, but comes at the
  /// expense of a lower precision shaping curve.
  ///
  /// The possible `oversample` values are:
  ///
  /// | Value    | Effect                                                                 |
  /// | -------- | ---------------------------------------------------------------------- |
  /// | `'none'` | Do not perform any oversampling.                                       |
  /// | `'2x'`   | Double the amount of samples before applying the shaping curve.        |
  /// | `'4x'`   | Multiply by 4 the amount of samples before applying the shaping curve. |
  OverSampleType get oversample;
  set oversample(OverSampleType value);
}

// ------------------------------------------------------------------------------------------------------------------

abstract class WaveShaperOptions implements AudioNodeOptions {
  TauArray<TauNumber> get curve;
  set curve(TauArray<TauNumber> value);
  OverSampleType get oversample;
  set oversample(OverSampleType value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The **`AudioWorklet`** of the
/// [Web Audio API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API)
/// is used to supply custom audio processing scripts that execute in a separate
/// thread to provide very low latency audio processing.
///
/// The worklet's code is run in the [AudioWorkletGlobalScope] global execution
/// context, using a separate Web Audio thread which is shared by the worklet
/// and other audio nodes.
///
/// Access the audio context's instance of `AudioWorklet` through the
/// [BaseAudioContext.audioWorklet] property.
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/AudioWorklet).
abstract class AudioWorklet {
  addModule(String script);
}

// ------------------------------------------------------------------------------------------------------------------

/// The **`AudioWorkletGlobalScope`** of the
/// [Web Audio API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API)
/// represents a global execution context for user-supplied code, which defines
/// custom [AudioWorkletProcessor]-derived classes.
///
/// Each [BaseAudioContext] has a single [AudioWorklet] available under the
/// [BaseAudioContext.audioWorklet] property, which runs its code in a single
/// `AudioWorkletGlobalScope`.
///
/// As the global execution context is shared across the current
/// `BaseAudioContext`, it's possible to define any other variables and perform
/// any actions allowed in worklets — apart from defining
/// `AudioWorkletProcessor` derived classes.
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/AudioWorkletGlobalScope).
abstract class AudioWorkletGlobalScope {
  /// The **`registerProcessor`** method of the
  /// [AudioWorkletGlobalScope] registers a class constructor derived
  /// from [AudioWorkletProcessor] under a specified _name_.
  void registerProcessor(
    String name,
    AudioWorkletProcessorConstructor processorCtor,
  );

  /// The read-only **`currentFrame`** property of the [AudioWorkletGlobalScope]
  /// returns an integer that represents the ever-increasing current
  /// sample-frame of the audio block being processed. It is incremented by 128
  /// (the size of a render quantum) after the processing of each audio block.
  int get currentFrame;

  /// The read-only **`currentTime`** property of the [AudioWorkletGlobalScope]
  /// returns a double that represents the ever-increasing context
  /// time of the audio block being processed. It is equal to the
  /// [BaseAudioContext.currentTime] property of the [BaseAudioContext] the
  /// worklet belongs to.
  TauTime get currentTime;

  /// The read-only **`sampleRate`** property of the [AudioWorkletGlobalScope]
  /// returns a float that represents the sample rate of the
  /// associated [BaseAudioContext] the worklet belongs to.
  TauSampleRate get sampleRate;
}

// ------------------------------------------------------------------------------------------------------------------

/// The **`AudioParamMap`** of the
/// [Web Audio API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API)
/// represents an iterable and read-only set of multiple audio parameters.
///
/// An `AudioParamMap` instance is a read-only
/// [`Map`-like object](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map#map-like_browser_apis),
/// in which each key is the name string for a parameter, and the corresponding
/// value is an [AudioParam] containing the value of that parameter.
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/AudioParamMap).
abstract class AudioParamMap {
  dynamic getProperty(String key);
  void setProperty(String key, dynamic value);
  //int get size;
  //dynamic get(String key);
}

// ------------------------------------------------------------------------------------------------------------------

/// > **Note:** Although the is available outside
/// > [secure contexts](https://developer.mozilla.org/en-US/docs/Web/Security/Secure_Contexts),
/// > the [BaseAudioContext.audioWorklet] property is not, thus custom
/// > [AudioWorkletProcessor]s cannot be defined outside them.
///
/// The **`AudioWorkletNode`** of the
/// [Web Audio API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API)
/// represents a base class for a user-defined [AudioNode], which can be
/// connected to an audio routing graph along with other nodes. It has an
/// associated [AudioWorkletProcessor], which does the actual audio processing
/// in a Web Audio rendering thread.
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/AudioWorkletNode).
abstract class AudioWorkletNode implements AudioNode {
  /// The read-only **`parameters`** property of the
  /// [AudioWorkletNode] returns the associated
  /// [AudioParamMap] — that is, a `Map`-like collection of
  /// [AudioParam] objects. They are instantiated during creation of the
  /// underlying [AudioWorkletProcessor] according to its
  /// [AudioWorkletProcessor.parameterDescriptors] static
  /// getter.
  AudioParamMap get parameters;

  /// The read-only **`port`** property of the
  /// [AudioWorkletNode] returns the associated
  /// [MessagePort]. It can be used to communicate between the node and its
  /// associated [AudioWorkletProcessor].
  ///
  /// > **Note:** The port at the other end of the channel is
  /// > available under the [AudioWorkletProcessor.port] property of the
  /// > processor.
  MessagePort get port;
  EventHandler get onProcessorError;
  set onProcessorError(EventHandler value);
}

abstract class AsyncWorkletNode implements AudioWorkletNode {
  void onBufferUnderflow(OnAudioBufferUnderflowFn f);
  void onReceiveData(OnReceiveDataFn f);
  void send({int outputNo = 0, required List<Float32List> data});
  void stop();
}

// ------------------------------------------------------------------------------------------------------------------

abstract class ProcessorOptions //implements AudioNodeOptions
{
  /* ctor */ ProcessorOptions(Map<String, dynamic> m);
}

abstract class ParameterData {
  /* ctor */ ParameterData(Map<String, dynamic> m);
}

abstract class AudioWorkletNodeOptions implements AudioNodeOptions {
  int get numberOfInputs;
  set numberOfInputs(int value);
  int get numberOfOutputs;
  set numberOfOutputs(int value);
  List<int> get outputChannelCount;
  set outputChannelCount(List<int> value);
  //ParameterData get parameterData;
  //set parameterData(ParameterData value);
  //ProcessorOptions get processorOptions;
  //set processorOptions(ProcessorOptions value);
}

// ------------------------------------------------------------------------------------------------------------------

/// The **`AudioWorkletProcessor`** of the
/// [Web Audio API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API)
/// represents an audio processing code behind a custom [AudioWorkletNode]. It
/// lives in the [AudioWorkletGlobalScope] and runs on the Web Audio rendering
/// thread. In turn, an [AudioWorkletNode] based on it runs on the main thread.
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/AudioWorkletProcessor).
abstract class AudioWorkletProcessor {
  /// The read-only **`port`** property of the
  /// [AudioWorkletProcessor] returns the associated
  /// [MessagePort]. It can be used to communicate between the processor and the
  /// [AudioWorkletNode] to which it belongs.
  ///
  /// > **Note:** The port at the other end of the channel is
  /// > available under the [AudioWorkletNode.port] property of the node.
  MessagePort get port;
}

// =================================================================================================
//                          Added because of Tau_web
// =================================================================================================

// ------------------------------------------------------------------------------------------------------------------

abstract class MediaElement {
  /* ctor */ MediaElement({
    required String src,
  });
  TauTime get currentTime;
  set currentTime(TauTime currentTime);
  bool get loop;
  set loop(bool loop);
  Future<Object?> play();
  pause();
  bool paused();
  TauSampleRate get playbackRate;
  set playbackRate(TauSampleRate sampleRate);
  String get src;
  set src(String src);
  String? get crossorigin;
  set crossorigin(String? crossorigin);
  //EventHandler?  get onplay;
  set onplay(EventHandler? e);
}

abstract class MediaStream {
  String get id;
}

abstract class MediaDevices {
  Future<MediaStream> getUserMedia({bool audio = true, bool video = false});
  Future<MediaStream> getUserMediaWithConstraints({
    required Map<String, Object> audio,
  });
  Future<List<MediaDeviceInfo>> enumerateDevices();
}

abstract class MediaStreamTrack {
  // !!! Missing many methods, here
}

/*
class Worklet
{

}
*/

/*
class WorkletGlobalScope
{

}
*/
//typedef void MessageFn(Message msg);
typedef MessageFn = void Function(Message msg);

typedef Message = dynamic;

abstract class MessagePort {
  set onmessage(MessageFn f);

  MessageFn get onmessage;
  void postMessage(Message e);
}

enum DeviceKind {
  unknown,
  videoinput,
  audioinput,
  audiooutput,
}

class MediaDeviceInfo {
  late String deviceId;
  late String groupId;
  late DeviceKind kind;
  late String label;

  /* ctor */ MediaDeviceInfo(
      {required this.deviceId,
      required this.groupId,
      required this.kind,
      required this.label});
}

/// The **`BlobEvent`** interface of the
/// [MediaStream Recording API](https://developer.mozilla.org/en-US/docs/Web/API/MediaStream_Recording_API)
/// represents events associated with a [Blob]. These blobs are typically, but
/// not necessarily, associated with media content.
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/BlobEvent).
abstract class BlobEvent {
  /* ctor */ BlobEvent(
    String type,
    BlobEventInit eventInitDict,
  );

  /// The **`data`** read-only property of the [BlobEvent] interface represents
  /// a [Blob] associated with the event.
  Blob get data;

  /// The **`timecode`** read-only property of the [BlobEvent] interface
  /// indicates the difference between the timestamp of the first chunk of data,
  /// and the timestamp of the first chunk in the first `BlobEvent` produced by
  /// this recorder.
  ///
  /// Note that the `timecode` in the first produced `BlobEvent` does not need
  /// to be zero.
  int get timecode;
}

abstract class BlobEventInit {
  /* ctor */ BlobEventInit({
    required Blob data,
    DOMHighResTimeStamp? timecode,
  });

  Blob get data;
  set data(Blob value);
  int get timecode;
  set timecode(DOMHighResTimeStamp value);
}

/// The **`Blob`** interface represents a blob, which is a file-like object of
/// immutable, raw data; they can be read as text or binary data, or converted
/// into a [ReadableStream] so its methods can be used for processing the data.
///
/// Blobs can represent data that isn't necessarily in a JavaScript-native
/// format. The [File] interface is based on `Blob`, inheriting blob
/// functionality and expanding it to support files on the user's system.
///
/// ---
///
/// API documentation sourced from
/// [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/API/Blob).
abstract class Blob {
  /* ctor */ Blob([
    List<BlobPart>? blobParts,
    BlobPropertyBag? options,
  ]);

  /// The **`slice()`** method of the [Blob] interface
  /// creates and returns a new `Blob` object which contains data from a subset
  /// of
  /// the blob on which it's called.
  //[LARPOUX]Blob slice([
  //  int start,
  //   int end,
  //  String contentType,
  // ]);

  /// The **`stream()`** method of the [Blob] interface returns a
  /// [ReadableStream] which upon reading returns the data contained within the
  /// `Blob`.
  //[LARPOUX]ReadableStream stream();

  /// The **`text()`** method of the
  /// [Blob] interface returns a `Promise` that resolves with a
  /// string containing the contents of the blob, interpreted as UTF-8.
  //[LARPOUX]Future<String> text();

  /// The **`arrayBuffer()`** method of the [Blob]
  /// interface returns a `Promise` that resolves with the contents of the blob
  /// as
  /// binary data contained in an `ArrayBuffer`.
  //[LARPOUX]Future<JSArrayBuffer> arrayBuffer();

  /// The **`size`** read-only property of the [Blob] interface returns
  /// the size of the [Blob] or [File] in bytes.
  int get size;

  /// The **`type`** read-only property of the [Blob] interface returns the  of
  /// the file.
  ///
  /// > **Note:** Based on the current implementation, browsers won't actually
  /// > read the bytestream of a file to determine its media type.
  /// > It is assumed based on the file extension; a PNG image file renamed to
  /// > .txt would give "_text/plain_" and not "_image/png_". Moreover,
  /// > `blob.type` is generally reliable only for common file types like
  /// > images, HTML documents, audio and video.
  /// > Uncommon file extensions would return an empty string.
  /// > Client configuration (for instance, the Windows Registry) may result in
  /// > unexpected values even for common types. **Developers are advised not to
  /// > rely on this property as a sole validation scheme.**
  String get type;
}

abstract class BlobPropertyBag {
  /* ctor */ BlobPropertyBag({
    String? type,
    EndingType? endings,
  });

  String get type;
  set type(String value);
  EndingType get endings;
  set endings(EndingType value);
}

// --------------------------------------------  Events ------------------------------------------------------------

class EventTarget {}

class Event {}

class EventInit {}
