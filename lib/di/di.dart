import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../data/dio/set_up.dart';
import '../domain/domain.dart';
import '../app/features/home/home.dart';

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

  getIt.registerSingleton(HomeBloc(getIt.get<ContentRepositoryInterface>()));
}
