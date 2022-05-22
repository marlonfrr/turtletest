import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';
import 'package:get_it/get_it.dart';
import 'package:turtletest/core/services/navigation_servide.dart';

class MockNavigationService extends Mock implements NavigationService {}

GetIt injector = GetIt.instance;

Future<void> setupInjector({bool testing = false}) async {
  if (testing) {
    injector.registerLazySingleton<NavigationService>(() => MockNavigationService());
  } else {
    injector.registerLazySingleton<Dio>(() => Dio());
    injector.registerLazySingleton<NavigationService>(() => NavigationService());
  }
}
