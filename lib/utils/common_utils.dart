import 'dart:ui';

import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

class HexColor extends Color {
  static int _getColorFromHex(String? hexColor) {
    if ((hexColor ?? '').isEmpty) {
      hexColor = '#ffffff';
    }
    hexColor = hexColor!.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    try {
      return int.parse(hexColor, radix: 16);
    } catch (_) {
      return int.parse('FF', radix: 16);
    }
  }

  HexColor(final String? hexColor) : super(_getColorFromHex(hexColor));
}

class DeepLinkParser {
  String path;
  Map<String, String>? args;

  DeepLinkParser({
    required this.path,
    this.args,
  });

  factory DeepLinkParser.parse(String deepLink) {
    final Uri? uri = Uri.tryParse(deepLink);

    if (uri == null) {
      // return back input because of invalid uri format
      return DeepLinkParser(path: deepLink);
    }
    Map<String, String>? args;
    if (uri.queryParameters.isNotEmpty) {
      args = uri.queryParameters;
    }
    return DeepLinkParser(path: uri.path, args: args);
  }
}
