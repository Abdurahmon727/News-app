import 'package:dio/dio.dart';
import 'package:news_app/core/app_functions.dart';
import '../../../../core/error/exeptions.dart';
import '../../../../core/models/home_datas.dart';
import '../models/news.dart';

// '3reHg3Qu1SdmA5Vrt-UUkwkIclgKrOjCExrctHOHj_k';

abstract class NewsRemoteDataSource {
  Future<(List<NewsModel>, int)> getNews({
    required int topicIndex,
    required List<String> resources,
    required List<String> langauges,
    required Calendar calendar,
  });
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final int page;
  NewsRemoteDataSourceImpl(this.page) {
    _dio.options.headers['x-api-key'] =
        'ibiwLZubYfHnAZs60GpaBUnlQLvpzo8PIOjU_AzTbhY';
  }
  final _dio = Dio();
  @override
  Future<(List<NewsModel>, int)> getNews({
    required List<String> langauges,
    required int topicIndex,
    required List<String> resources,
    required Calendar calendar,
  }) async {
    final sources = AppFunctions.sourcesToApiCall(resources);
    final lang = AppFunctions.languagesToApiCall(langauges);
    final time = AppFunctions.calendarToApiCall(calendar);
    // await StorageRepository.putList('lang', langauges);
    // await StorageRepository.putList('sources', resources);
    final response = await _dio.get(
        'https://api.newscatcherapi.com/v2/latest_headlines?page=$page$lang$sources$time&topic=${homeTopics[topicIndex]}');
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      final data = response.data['articles'] as List?;
      if (data == null) {
        throw ServerException(
            statusMessage: 'No News found for this category', statusCode: 404);
      }
      final models = data.map((map) => NewsModel.fromMap(map)).toList();
      return (models, response.data["page_size"] as int);
    } else {
      throw ServerException(
          statusMessage: 'Server not responding', statusCode: 404);
    }
  }
}
