import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:grading_client/service/app_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService extends DioMixin {
  static final ApiService _service = ApiService._internal();

  ApiService._internal() {
    options = BaseOptions(
      baseUrl: "http://192.168.100.5:8080/",
      // connectTimeout: Environment.apiTimeout,
    );
    interceptors.addAll([AppInterceptor(), PrettyDioLogger()]);
    httpClientAdapter = DefaultHttpClientAdapter();
  }

  factory ApiService() => _service;
}
