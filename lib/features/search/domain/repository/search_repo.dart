import '../../../../core/data/either.dart';
import '../../../../core/error/failure.dart';
import '../../../home/data/models/news.dart';

abstract class SearchRepository {
  Future<Either<Failure, (List<NewsModel>, int)>> getSearchResults(
      String query, int page);
}
