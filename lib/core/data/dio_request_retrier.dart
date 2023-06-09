import 'dart:async';

import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'dio_settings.dart';
import 'service_locator.dart';

class DioConnectivityRequestRetrier {
  final InternetConnectionChecker connectivity;

  DioConnectivityRequestRetrier({required this.connectivity});

  Future<Response> scheduleRequestRetry(RequestOptions requestOptions) async {
    late StreamSubscription streamSubscription;
    final responseCompleter = Completer<Response>();
    streamSubscription = connectivity.onStatusChange.listen(
      (connectivityResult) async {
        if (connectivityResult == InternetConnectionStatus.connected) {
          streamSubscription.cancel();
          responseCompleter.complete(
            getIt<DioSettings>().dio.request(
                  requestOptions.path,
                  cancelToken: requestOptions.cancelToken,
                  data: requestOptions.data,
                  onReceiveProgress: requestOptions.onReceiveProgress,
                  onSendProgress: requestOptions.onSendProgress,
                  queryParameters: requestOptions.queryParameters,
                  options: Options(headers: requestOptions.headers),
                ),
          );
        }
      },
    );

    return responseCompleter.future;
  }
}
