import 'package:get_it/get_it.dart';

import 'dio_settings.dart';

final serviceLocator = GetIt.instance;

void setupLocator() {
  serviceLocator.registerLazySingleton(DioSettings.new);
}
