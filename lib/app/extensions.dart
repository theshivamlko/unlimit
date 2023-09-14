import 'dart:io';

import 'package:dio/dio.dart';
import 'package:unlimit/presentation/homepage/my_home_page_state.dart';

import '../data/api/ErrorHandler.dart';

extension FailureExtension on int? {
  ResultError getFailure() {
    switch (this) {
      case HttpStatus.networkConnectTimeoutError:
        return ResultError(
            ResponseError.errorCodes[HttpStatus.networkConnectTimeoutError]!);
      case 2:
        return ResultError(
            ResponseError.errorCodes[DioExceptionType.receiveTimeout.index]!);

      default:
        return ResultError( ResponseError.errorCodes[0]!);
    }
  }

  String toErrorMessage() {
    switch (this) {
      case HttpStatus.networkConnectTimeoutError:
        return ResponseError.errorCodes[HttpStatus.networkConnectTimeoutError]!;
      case 2:
        return ResponseError.errorCodes[DioExceptionType.receiveTimeout.index]!;

      default:
        return ResponseError.errorCodes[0]!;
    }
  }
}
