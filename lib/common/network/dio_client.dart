import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:flutter_bloc_app/common/network/endpoints.dart';

class DioClient {
  final dio = createDio();

  DioClient._internal();

  static final _singleton = DioClient._internal();

  factory DioClient() => _singleton;

  static Dio createDio() {
    var dio = Dio();
    dio.options
      ..baseUrl = Endpoints.baseUrl
      ..receiveTimeout = Endpoints.receiveTimeout
      ..connectTimeout = Endpoints.connectionTimeout;

    dio.interceptors.add(dioLoggerInterceptor);

    return dio;
  }
}
