// ignore_for_file: depend_on_referenced_packages

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'news.dart';
import '../../../../objectbox.g.dart';

class ObjectBoxSingleton {
  final Store store;
  final Box<NewsModel> newsBox;

  ObjectBoxSingleton._create(this.store, this.newsBox);

  ///Use this static method at the begining of app
  /// to initialize ObjectBox store and boxes
  static Future<ObjectBoxSingleton> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, "obx-db"));
    final newsBox = store.box<NewsModel>();
    return ObjectBoxSingleton._create(store, newsBox);
  }

  void putNews(List<NewsModel> models) {
    newsBox.putMany(models);
  }

  List<NewsModel> getAllNews() => newsBox.getAll();

  void clearNews() => newsBox.removeAll();
}
