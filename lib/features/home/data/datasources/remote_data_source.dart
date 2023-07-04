import 'package:dio/dio.dart';
import '../../../../assets/constants.dart';
import '../../../../core/app_functions.dart';
import '../../../../core/error/exeptions.dart';
import '../../../../core/models/home_datas.dart';
import '../models/news.dart';

abstract class NewsRemoteDataSource {
  Future<(List<NewsModel>, int)> getNews(
      {required int topicIndex,
      required List<String> resources,
      required List<String> langauges,
      required Calendar calendar,
      required List<String> topics});
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final int page;
  NewsRemoteDataSourceImpl(this.page) {
    _dio.options.headers['x-api-key'] = apiKey;
  }
  final _dio = Dio();
  @override
  Future<(List<NewsModel>, int)> getNews(
      {required List<String> langauges,
      required int topicIndex,
      required List<String> resources,
      required Calendar calendar,
      required List<String> topics}) async {
    final sources = AppFunctions.sourcesToApiCall(resources);
    final lang = AppFunctions.languagesToApiCall(langauges);
    final time = AppFunctions.calendarToApiCall(calendar);

    final response = await _dio.get(
        'https://api.newscatcherapi.com/v2/latest_headlines?page=$page$lang$sources$time&topic=${topics[topicIndex]}');
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
