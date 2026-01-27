import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../data/dio/set_up.dart';
import '../domain/domain.dart';
import '../app/features/home/home.dart';
import '../app/features/detail/detail.dart';
import '../app/features/auth/logout/logout.dart';
import '../app/features/favorite/favorite.dart';

import '../services/auth/auth.dart';
import '../services/favorite_data_service/favorite_data.dart';

final getIt = GetIt.instance;
final talker = TalkerFlutter.init();

final dio = Dio();

Future<void> setupLocator() async {
  getIt.registerSingleton(talker);

  setUpDio();

  getIt.registerSingleton<Dio>(dio);

  getIt.registerSingleton<ContentRepositoryInterface>(
    ContentRepository(dio: dio),
  );

  getIt.registerLazySingleton<AuthServiceInterface>(() => AuthService());

  getIt.registerSingleton(HomeBloc(getIt.get<ContentRepositoryInterface>()));

  getIt.registerFactory(
    () => DetailBloc(getIt.get<ContentRepositoryInterface>()),
  );

  getIt.registerFactory(() => LogoutBloc(getIt.get<AuthServiceInterface>()));

  getIt.registerLazySingleton<FavoriteDataServiceInterface>(
    () => FavoriteDataService(),
  );

  getIt.registerFactory(
    () => FavoriteBloc(getIt.get<FavoriteDataServiceInterface>()),
  );
}
