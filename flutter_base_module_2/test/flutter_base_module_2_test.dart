import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_base_module_2/flutter_base_module_2.dart';
import 'package:flutter_base_module_2/flutter_base_module_2_platform_interface.dart';
import 'package:flutter_base_module_2/flutter_base_module_2_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterBaseModule_2Platform 
    with MockPlatformInterfaceMixin
    implements FlutterBaseModule_2Platform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterBaseModule_2Platform initialPlatform = FlutterBaseModule_2Platform.instance;

  test('$MethodChannelFlutterBaseModule_2 is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterBaseModule_2>());
  });

  test('getPlatformVersion', () async {
    FlutterBaseModule_2 flutterBaseModule_2Plugin = FlutterBaseModule_2();
    MockFlutterBaseModule_2Platform fakePlatform = MockFlutterBaseModule_2Platform();
    FlutterBaseModule_2Platform.instance = fakePlatform;
  
    expect(await flutterBaseModule_2Plugin.getPlatformVersion(), '42');
  });
}
