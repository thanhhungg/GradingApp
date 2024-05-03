import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grading_client/model/response.dart';

class AppException implements Exception {
  final dynamic error;
  final String message;

  AppException([this.message = 'Some thing went wrong', this.error]);

  factory AppException.network() => AppException(
        'Not connected to the network',
        'NetworkConnectionException',
      );

  factory AppException.system() => AppException('system error');

  factory AppException.unsupportedFile() => AppException(
        'File was not supported.',
      );

  factory AppException.largeFileSize() => AppException(
        'File is a large size',
      );
}

Future<dynamic> handleException(
  Object e, {
  Function()? popupCallback,
  @Deprecated('use errCallback') Function(DioError err)? errorCallback,
  Function(int? statusCode, ResponseApi err)? errCallback,
}) async {
  var message = '';
  switch (e.runtimeType) {
    case SocketException:
      message = 'no internet.';
      break;
    case DioError:
      var err = await _parseDioError(e as DioError, errorCallback, errCallback);
      if (err is String) {
        message = err;
      } else {
        return err;
      }
      break;
    case AppException:
      message = (e as AppException).message;
      break;
    default:
      message = 'system error.';
  }

  if (message.isNotEmpty) {
    await Get.dialog(Dialog(
      child: Container(
        height: 100,
        width: 100,
        child: Column(
          children: [
            Text(message),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () {
                Get.back();
              },
              child: Text("OK"),
            ),
          ],
        ),
      ),
    ));
  }

  return null;
}

dynamic _parseDioError(
  DioError err,
  @Deprecated('use errCallback') Function(DioError err)? errorCallback,
  Function(int? statusCode, ResponseApi err)? errCallback,
) {
  try {
    if (err.error is SocketException) {
      return 'no internet.';
    }

    if (err.type == DioErrorType.connectTimeout) {
      return 'connect timeout.';
    }

    if (err.type == DioErrorType.cancel) {
      return err.message;
    }

    var error = ResponseApi.fromJson(err.response?.data);
    switch (err.response?.statusCode) {
      case 404:
        return error.status;
      default:
        errCallback?.call(err.response?.statusCode, error);
        errorCallback?.call(err);
    }

    if (errCallback != null) return;
    return error.status;
  } catch (e) {
    return e.toString();
  }
}
