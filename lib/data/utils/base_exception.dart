class BaseException implements Exception {
  final String message;
  final int code;

  BaseException({
    this.message = MESSAGE_UNKNOWN_ERR,
    this.code = ERR_CODE_UNKNOWN,
  });
}

// error message
const String MESSAGE_UNKNOWN_ERR = 'Unknown error';
const String MESSAGE_NETWORK_ERR = 'Network error';

// error code
const int ERR_CODE_UNAUTHORIZED = 401;
const int ERR_CODE_NOT_FOUND = 404;
const int ERR_CODE_EXPIRED = 4010001;
const int ERR_CODE_UNKNOWN = -1;
const int ERR_CODE_CONNECTION = -2;
