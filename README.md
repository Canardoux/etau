e-tau is actually in a developement state. It is an Alpha version. Even not a Beta version. 

There are many things to do before you can use it. Specially:

- A documentation (TODO)
- A support of the three main platforms:
   - Web
   - iOS (TODO)
   - Android (TODO)

The Web Audio API is terrific:

- It is a [W3C recommandation](https://www.w3.org/TR/webaudio-1.1)
- It has a great [documentation from Moziilla](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API)
- It is really powerful
- It is simple to use

## The W3C Web Audio API recommandation

Because the Web Audio API is a W3C recommandation, you can find very good documentations on the Web. Of course, the [Mozilla documentation](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API) but also from other sources.

In a few words, the Web Audio API let you assembly `nodes` as a string, from a Source Node (perhaps the mic), to a Destination Node (perhaps the speaker), threw several nodes able to process the sound (echo, analyzer, panner, distorder, ...). But you really should look to the Mozilla documentation which is very good.

You will have to ask yourself if you must use [Taudio](https://pub.dev/packages/taudio) (which is a wrapper around e-tau), or directly Etau.
The W3C recommandation is powerful but simple to use. There are probably not many reason to use Taudio any longer.

## e-tau Structure

e-tau is a Flutter API allowing the App to use the W3C Web Audio API.
This is an interface: this is what the App see and access.
Because this is an interface, the App must import an implementation.
Several implementations are possible. Actually we are developping two implementations:

- Tau Web, which is an implementation for Flutter Web
- Tau War, which is an implementation for mobiles

The app must import one (or several) implementations. But except for this import, the App does not access them.
It alway access e-tau which is the inteface. This allow the App to have a unic code for various platform.

## Examples \(Demo Apps\)

Flutter Sound comes with several [Demo/Examples](https://github.com/Canardoux/flutter_sound/tree/master/example/lib).

You can run a live view of these examples [here](http://tau.canardoux.xyz/live/etau/index.html).

## Flutter Sound and Streams

Streams support are a main Flutter Sound feature that is very exciting.

- Flutter Sound can record to a dart stream of audio data (PCM Float32 or PCM Int16). This let you process live audio data in dart, or send these data to a remote host.
- Flutter Sound can playback from a dart stream of audio data (PCM Float32 or PCM Int16). This let play live audio data generated from dart
(sequencer, sound generator, ...) or from a remote host.

You can look to the [FS Streams guide](fs_guides_streams.html).

## License

Etau is (will be) released under the Gnu Public Licence v3 (GPL v3).

- Flutter Sound is published under the MPL-2.0 License.
- Flutter Sound is copyrighted by Dooboolab and Canardoux.
- Flutter Sound is now released under the permissive Mozilla license which has a **weak** *copyleft* clause: if you modify some of Flutter Sound code you must publish your modifications under the MPL license too. But you may publish your App with any license you want. Even a Proprietary/Closed-Sources License (shame on you!).

## The τ family

The τ (Tau) project is composed with the following flutter plugins:

- Flutter Sound 9.x
- [Flutter_sound_web](https://pub.dev/packages/flutter_sound_web)
- [Flutter_sound_platform_interface](https://pub.dev/packages/flutter_sound_platform_interface) (a glue between the Flutter Sound API and the 3 platforms: Web, iOS and Android)
- [Taudio](https://pub.dev/packages/taudio) (Flutter Sound 10.0)
- [Etau](https://pub.dev/packages/etau) (an implementation of the Web Audio API)
- [Tau-Web](https://pub.dev/packages/tau_web) (an implementation of Etau for Flutter Web)
- [Tau-War](https://pub.dev/packages/tau_war) (an implementation of Etau for the mobiles)

And two public libraries for mobiles support:

- Flutter Sound Core for iOS
- Flutter Sound Core for Android

### Taudio

The current Flutter Sound version is 9.x. [Taudio](https://pub.dev/packages/taudio) is a new name for Flutter Sound 10.0. Taudio is actually in a developement state. It is an Alpha version. Even not a Beta version. There are many things to do before you can use it. Specially:
- A documentation (TODO)
- A support of the three main platforms:
   - Web
   - iOS (TODO)
   - Android (TODO)

Taudio is (will be) released under the Gnu Public Licence v3 (GPL v3). This mean that if you don't want, cannot or maynot release your App under a GPL License, you must stuck with Flutter Sound 9.x. This is not a big deal: Flutter Sound v 9.x will be maintain for a forseable future.

Taudio is a complete rewritten of Flutter Sound 9.x. It keeps compatibility with the Flutter Sound 9.x API but adds a new wrapper above [Etau](https://pub.dev/packages/etau).

## We need help

We greatly appreciate any contributions to the project which can be as simple as providing feedback on the API or documentation.

Actually, I am almost alone to maintain and develop three important projects :
- Flutter Sound 9.x
- Taudio (flutter Sound 10.0)
- Etau

This is too much work on my shoulders. We desesperatly need at least one other developer.

## Thanks

If you like my work, you can click on the `Thumb up` button of the top of the [pub.dev page](https://pub.dev/packages/flutter_sound).
This is free and this will reassure me that **I do not spend most of my life for nobody**.
