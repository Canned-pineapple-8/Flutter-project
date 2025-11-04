import 'package:talker_dio_logger/talker_dio_logger.dart';
import '../../di/di.dart';

void setUpDio() {
  dio.options.baseUrl = 'https://dummyjson.com';
  dio.options.connectTimeout = const Duration(seconds: 5);
  dio.options.receiveTimeout = const Duration(seconds: 5);

  dio.interceptors.addAll([
    TalkerDioLogger(
      talker: talker,
      settings: TalkerDioLoggerSettings(
        printRequestData: true,
        printRequestHeaders: true,
      ),
    ),
  ]);
}
