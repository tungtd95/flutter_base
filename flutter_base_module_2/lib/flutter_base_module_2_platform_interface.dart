import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_base_module_2_method_channel.dart';

abstract class FlutterBaseModule_2Platform extends PlatformInterface {
  /// Constructs a FlutterBaseModule_2Platform.
  FlutterBaseModule_2Platform() : super(token: _token);

  static final Object _token = Object();

  static FlutterBaseModule_2Platform _instance = MethodChannelFlutterBaseModule_2();

  /// The default instance of [FlutterBaseModule_2Platform] to use.
  ///
  /// Defaults to [MethodChannelFlutterBaseModule_2].
  static FlutterBaseModule_2Platform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterBaseModule_2Platform] when
  /// they register themselves.
  static set instance(FlutterBaseModule_2Platform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
