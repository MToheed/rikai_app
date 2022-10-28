import 'package:get_it/get_it.dart';
import 'package:rikai_app/core/viewmodels/detail_model.dart';
import 'package:rikai_app/core/viewmodels/user_model.dart';
import '../services/api.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => Api());

  // view models
  locator.registerFactory(() => UserModel());
  locator.registerFactory(() => DetailModel());
}
