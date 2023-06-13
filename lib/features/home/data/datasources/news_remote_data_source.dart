import 'package:dio/dio.dart';

import '../../../../core/error/exeptions.dart';
import '../../../../core/models/home_tabbars.dart';
import '../models/news.dart';

// '3reHg3Qu1SdmA5Vrt-UUkwkIclgKrOjCExrctHOHj_k';

abstract class NewsRemoteDataSource {
  Future<(List<NewsModel>, int)> getNews(int topicIndex);
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final int page;
  NewsRemoteDataSourceImpl(this.page) {
    _dio.options.headers['x-api-key'] =
        'ap9R1g0L4_bHYtvBbJ67nhC4nIX3LsI6PaMeSDHj-Q4';
  }
  final _dio = Dio();
  @override
  Future<(List<NewsModel>, int)> getNews(int topicIndex) async {
    final response = await _dio.get(
        'https://api.newscatcherapi.com/v2/latest_headlines?lang=en&topic=${homeTopics[topicIndex]}&page=$page');
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      final data = response.data['articles'] as List;
      final models = data.map((map) => NewsModel.fromMap(map)).toList();
      return (models, response.data["page_size"] as int);
    } else {
      throw ServerException(
          statusMessage: 'Server not responding', statusCode: 404);
    }
  }
}
