import 'package:dio/dio.dart';
import 'package:flutter_bloc_app/common/network/endpoints.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';

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

    dio.interceptors.add(PrettyDioLogger(requestBody: true));

    return dio;
  }
}
