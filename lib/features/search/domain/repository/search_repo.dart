import '../../../../core/data/either.dart';
import '../../../../core/error/failure.dart';
import '../../../home/data/models/news.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<NewsModel>>> getSearchResults(String query);
}
