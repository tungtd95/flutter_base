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
