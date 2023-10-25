import 'dart:async';

import 'package:flutter/services.dart';

class AndroidPlayInstallReferrer {
  static const MethodChannel _channel =
      const MethodChannel('com.sekiro.flutter_base.method_channel');

  static Future<String> get installReferrer async {
    final String details = await _channel.invokeMethod('getInstallReferrer');

    return details;
  }
}
