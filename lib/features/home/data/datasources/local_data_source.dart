import '../../../../core/app_functions.dart';
import '../../../../core/data/storage_repository.dart';
import '../../../../core/models/home_datas.dart';

abstract class NewsLocalDataSource {
  Future<void> saveBlocProperties({
    required Calendar calendar,
    required List<String> sources,
    required List<String> languages,
  });
  Future<void> saveTopics(List<String> topics);
  List<String> getTopics();

  (Calendar, List<String>, List<String>) getBlocProperties();
}

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  @override
  Future<void> saveBlocProperties({
    required Calendar calendar,
    required List<String> sources,
    required List<String> languages,
  }) async {
    await StorageRepository.putInt(
      key: 'calendar',
      value: AppFunctions.calendarToInt(calendar),
    );
    await StorageRepository.putList('sources', sources);
    await StorageRepository.putList('languages', languages);
  }

  @override
  (Calendar, List<String>, List<String>) getBlocProperties() {
    final calendar =
        AppFunctions.intToCalendar(StorageRepository.getInt('calendar'));
    final languages = StorageRepository.getList('languages');
    final sources = StorageRepository.getList('sources');
    return (calendar, languages, sources);
  }

  @override
  List<String> getTopics() {
    return StorageRepository.getList('topics');
  }

  @override
  Future<void> saveTopics(List<String> topics) async {
    await StorageRepository.putList('topics', topics);
  }
}
