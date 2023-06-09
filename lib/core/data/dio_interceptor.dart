import 'dart:io';

import 'package:dio/dio.dart';

import '../error/exeptions.dart';
import 'dio_request_retrier.dart';

class DioInterceptor extends Interceptor {
  final DioConnectivityRequestRetrier requestRetrier;

  DioInterceptor({required this.requestRetrier});

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err)) {
      try {
        final response = await requestRetrier.scheduleRequestRetry(
          err.requestOptions,
        );
        handler.resolve(response);
      } catch (error) {
        handler.next(err);
      }
    } else {
      handler.next(err);
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers = <String, dynamic>{
      'x-api-key': '05SAC5bdNzsr1Hjbiq2OaVxbmRjCDTLspRiLWAleH9Q'
    };

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    try {
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        handler.next(response);
      } else {
        print(response.data);
        print(response.statusCode);
        print(response.realUri);
        late String message;
        if (response.data is String) {
          message = response.data;
        } else {
          message = '${(response.data as Map<String, dynamic>).values.first}'
              .replaceAll(RegExp(r'[\[\]]'), '');
        }
        throw ServerException(
          statusMessage: message,
          statusCode: response.statusCode!,
        );
      }
    } on ServerException {
      rethrow;
    } catch (error) {
      throw ServerException(statusMessage: '$error', statusCode: 144);
    }
  }

  bool _shouldRetry(DioError err) {
    return err.error != null && err.error is SocketException;
  }
}
