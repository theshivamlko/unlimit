import 'dart:io';

import 'package:dio/dio.dart';
import 'package:unlimit/app/extensions.dart';
import 'package:unlimit/data/model/ErrorModel.dart';

class ResponseError {
  static Map<int, String> errorCodes = {
    0: "Something Gone Wrong",
    HttpStatus.networkConnectTimeoutError: "No Internet Connection",
    2: "Request Timeout",
  };
}

class ErrorHandler implements Exception {
  late ErrorModel errorModel;

  ErrorHandler.handle(dynamic error) {
    print("ErrorHandler $error");

    if (error is DioException) {
      print("ErrorHandler2 ${error.response?.statusCode}");
      print("ErrorHandler3 ${error.error}");
      print("ErrorHandler4 ${error.type.index}");

      errorModel =
          ErrorModel(error.type.index, error.type.index.toErrorMessage());
    } else {
      errorModel = ErrorModel(0, 0.toErrorMessage());
    }
  }
}
