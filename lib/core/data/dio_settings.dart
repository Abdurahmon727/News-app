import 'package:dio/dio.dart';
import 'package:news_app/core/data/storage_repository.dart';

class DioSettings {
  Dio _dioBaseOptions = Dio(BaseOptions(
    baseUrl: '',
    connectTimeout: const Duration(milliseconds: 35000),
    receiveTimeout: const Duration(milliseconds: 33000),
    followRedirects: false,
    headers: <String, dynamic>{
      'Accept-Language': StorageRepository.getString('language', defValue: 'en')
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
      ..interceptors.addAll([]);
  }

  Dio get dio => _dioBaseOptions;
}
