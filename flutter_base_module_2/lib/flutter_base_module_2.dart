
import 'flutter_base_module_2_platform_interface.dart';

class FlutterBaseModule_2 {
  Future<String?> getPlatformVersion() {
    return FlutterBaseModule_2Platform.instance.getPlatformVersion();
  }
}
