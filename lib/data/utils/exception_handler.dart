import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_base/data/models/meta_response.dart';
import 'package:injectable/injectable.dart';

import 'base_exception.dart';

@injectable
class ErrorHandler {
  ErrorHandler();

  BaseException parse(dynamic e) {
    if (e is DioError && e.error is BaseException) {
      return e.error;
    } else {
      return BaseException();
    }
  }

  void dioErrorParser(DioError err) {
    switch (err.error.runtimeType) {
      case SocketException:
        throw BaseException(
          message: MESSAGE_NETWORK_ERR,
          code: ERR_CODE_CONNECTION,
        );
    }

    final errorResData = err.response?.data;
    if (errorResData != null) {
      try {
        _metaErrorParser(MetaRes.fromJson(errorResData));
      } on BaseException catch (e) {
        throw e;
      } catch (e) {
        throw BaseException();
      }
    } else {
      throw BaseException();
    }
  }

  void _metaErrorParser(MetaRes? metaRes) {
    if (metaRes == null) throw BaseException();
    final errorCode = int.parse(metaRes.code ?? '$ERR_CODE_UNKNOWN');
    if (errorCode >= 200 && errorCode <= 299) return;
    switch (metaRes.code) {
      default:
        throw BaseException(
          message: metaRes.message ?? MESSAGE_UNKNOWN_ERR,
          code: errorCode,
        );
    }
  }
}
