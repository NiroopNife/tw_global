import 'package:get_it/get_it.dart';

import 'domain/services/api_service.dart';

final GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => ApiService());
}