import 'package:dio/dio.dart';
import 'package:news_app/core/data/service_locator.dart';
import 'package:news_app/core/error/exeptions.dart';
import 'package:news_app/features/home/data/models/news.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsModel>> getNews();
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final _dio = getIt<Dio>();
  @override
  Future<List<NewsModel>> getNews() async {
    final response = await _dio
        .get('https://api.newscatcherapi.com/v2/latest_headlines?lang=en');
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      final data = response.data['articles'] as List;
      final models = data.map((map) => NewsModel.fromMap(map)).toList();
      return models;
    } else {
      throw ServerException(
          statusMessage: 'Server not responding', statusCode: 404);
    }
  }
}
