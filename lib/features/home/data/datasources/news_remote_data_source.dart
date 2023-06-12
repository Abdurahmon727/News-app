import 'package:dio/dio.dart';

import '../../../../core/error/exeptions.dart';
import '../models/news.dart';

// '3reHg3Qu1SdmA5Vrt-UUkwkIclgKrOjCExrctHOHj_k';

abstract class NewsRemoteDataSource {
  Future<(List<NewsModel>, int)> getNews();
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final int page;
  NewsRemoteDataSourceImpl(this.page) {
    _dio.options.headers['x-api-key'] =
        'qmj66DZ-bwkCmfk6FvFKS89C4bDnDB9o7l8zu-9Et5Q';
  }
  final _dio = Dio();
  @override
  Future<(List<NewsModel>, int)> getNews() async {
    final response = await _dio.get(
        'https://api.newscatcherapi.com/v2/latest_headlines?lang=en&page=$page');
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
