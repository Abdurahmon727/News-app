import '../../../../core/data/either.dart';
import '../../../../core/data/network_info.dart';
import '../../../../core/error/exeptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/home_datas.dart';
import '../../domain/repo/news_repo.dart';
import '../datasources/local_data_source.dart';
import '../datasources/remote_data_source.dart';
import '../models/news.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl({required this.page});
  final int page;
  final _networkInfo = const NetworkInfoImpl();
  final _localDataSource = NewsLocalDataSourceImpl();

  @override
  Future<Either<Failure, (List<NewsModel>, int)>> getNews({
    required int topicIndex,
    required List<String> resources,
    required List<String> languages,
    required Calendar calendar,
    required List<String> topics,
  }) async {
    await _localDataSource.saveBlocProperties(
        calendar: calendar, languages: languages, sources: resources);
    if (await _networkInfo.connected) {
      try {
        final result = await NewsRemoteDataSourceImpl(page).getNews(
            langauges: languages,
            calendar: calendar,
            resources: resources,
            topicIndex: topicIndex,
            topics: topics);

        return Right((result.$1, result.$2));
      } on ServerException catch (e) {
        return Left(ServerFailure(
            errorMessage: e.statusMessage, statusCode: e.statusCode.round()));
      } catch (e) {
        return Left(const ServerFailure(
            errorMessage: 'Something went wrong 😩', statusCode: 500));
      }
    } else {
      return Left(const ServerFailure(errorMessage: 'No Internet'));
    }
  }
}
