import 'dart:ui';

import 'package:flutter_base/routes.dart';
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

  factory DeepLinkParser.parse(String? input) {
    String deepLink = (input ?? Routes.HOME).trim();
    if (!deepLink.startsWith(Routes.DOMAIN)) {
      deepLink = "${Routes.DOMAIN}$deepLink";
    }
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

class LingoUtils {
  static const NAME_REGEX =
      "^['a-zA-ZàáảãạâầấẩẫậăằắẳẵặèéẻẽẹêềếểễệđìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵÀÁẢÃẠÂẦẤẨẪẬĂẰẮẲẴẶÈÉẺẼẸÊỀẾỂỄỆĐÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴÂĂĐÔƠƯàáảãạâầấẩẫậăằắẳẵặèéẻẽẹêềếểễệđìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵÀÁẢÃẠÂẦẤẨẪẬĂẰẮẲẴẶÈÉẺẼẸÊỀẾỂỄỆĐÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴÂĂĐÔƠƯ0123456789 ]+";

  static const _vietnamese = 'aAeEoOuUiIdDyY';
  static final _vietnameseRegex = <RegExp>[
    RegExp(r'à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ'),
    RegExp(r'À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ'),
    RegExp(r'è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ'),
    RegExp(r'È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ'),
    RegExp(r'ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ'),
    RegExp(r'Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ'),
    RegExp(r'ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ'),
    RegExp(r'Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ'),
    RegExp(r'ì|í|ị|ỉ|ĩ'),
    RegExp(r'Ì|Í|Ị|Ỉ|Ĩ'),
    RegExp(r'đ'),
    RegExp(r'Đ'),
    RegExp(r'ỳ|ý|ỵ|ỷ|ỹ'),
    RegExp(r'Ỳ|Ý|Ỵ|Ỷ|Ỹ')
  ];

  static String unSign(String? text, {bool spaceToUnderline = false}) {
    var result = text ?? '';
    for (var i = 0; i < _vietnamese.length; ++i) {
      result = result.replaceAll(_vietnameseRegex[i], _vietnamese[i]);
    }
    if (spaceToUnderline) {
      result = result.replaceAll(' ', '_');
    }
    return result;
  }
}
