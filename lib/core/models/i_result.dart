import '../error/exeptions.dart';

class IResult {
  static IResult fromJson({
    required Map<String, dynamic> data,
    required Object type,
  }) {
    throw ServerException(
      statusMessage: 'Unresolved data type',
      statusCode: 140,
    );
  }
}
