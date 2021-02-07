import 'package:bluestacks_assignment/core/viewmodels/home_viewmodel.dart';
import 'package:get_it/get_it.dart';

import 'package:bluestacks_assignment/core/api/repo/AppRepository.dart';
import 'package:bluestacks_assignment/core/viewmodels/login_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AppRepository());

  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => HomeViewModel());
}
