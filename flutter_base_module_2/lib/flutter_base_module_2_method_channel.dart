import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_base_module_2_platform_interface.dart';

/// An implementation of [FlutterBaseModule_2Platform] that uses method channels.
class MethodChannelFlutterBaseModule_2 extends FlutterBaseModule_2Platform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_base_module_2');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
