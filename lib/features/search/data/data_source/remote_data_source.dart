import 'package:dio/dio.dart';
import 'package:news_app/assets/constants.dart';
import 'package:news_app/core/error/exeptions.dart';

import '../../../home/data/models/news.dart';

abstract class SearchRemoteDataSource {
  Future<(List<NewsModel>, int)> getSearchResult(String query, int page);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  SearchRemoteDataSourceImpl() {
    _dio.options.headers['x-api-key'] = apiKey;
  }

  final _dio = Dio();
  @override
  Future<(List<NewsModel>, int)> getSearchResult(String query, int page) async {
    final response = await _dio
        .get('https://api.newscatcherapi.com/v2/search?q=$query&page=$page');

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      final data = response.data['articles'] as List?;

      if (data == null) {
        throw ServerException(
            statusMessage: 'No News found for this category', statusCode: 404);
      }
      final models = data.map((map) => NewsModel.fromMap(map)).toList();

      return (models, response.data["total_pages"] as int);
    } else {
      throw ServerException(
          statusMessage: 'Server not responding',
          statusCode: response.statusCode!);
    }
  }
}
