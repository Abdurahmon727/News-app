import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'dio_interceptor.dart';
import 'dio_request_retrier.dart';

class DioSettings {
  Dio _dioBaseOptions = Dio(BaseOptions(
    baseUrl: '',
    connectTimeout: const Duration(milliseconds: 35000),
    receiveTimeout: const Duration(milliseconds: 33000),
    followRedirects: false,
    headers: <String, dynamic>{
      'x-api-key': '05SAC5bdNzsr1Hjbiq2OaVxbmRjCDTLspRiLWAleH9Q'
    },
    validateStatus: (status) => status != null && status <= 500,
  ))
    ..interceptors.addAll([]);

  void setBaseOptions({String? lang}) {
    _dioBaseOptions = Dio(BaseOptions(
      baseUrl: '',
      connectTimeout: const Duration(milliseconds: 35000),
      receiveTimeout: const Duration(milliseconds: 33000),
      headers: <String, dynamic>{'Accept-Language': lang},
      followRedirects: false,
      validateStatus: (status) => status != null && status <= 500,
    ))
      ..interceptors.addAll([
        DioInterceptor(
          requestRetrier: DioConnectivityRequestRetrier(
            connectivity: InternetConnectionChecker(),
          ),
        )
      ]);
  }

  Dio get dio => _dioBaseOptions;
}
