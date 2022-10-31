import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_base_module_2/flutter_base_module_2_method_channel.dart';

void main() {
  MethodChannelFlutterBaseModule_2 platform = MethodChannelFlutterBaseModule_2();
  const MethodChannel channel = MethodChannel('flutter_base_module_2');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
