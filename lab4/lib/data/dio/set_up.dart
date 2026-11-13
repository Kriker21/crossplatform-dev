import 'package:talker_dio_logger/talker_dio_logger.dart';

import 'package:flutter_lab4/di/di.dart';

void setUpDio() {
  dio.options.baseUrl = 'https://www.freetogame.com/api';

  dio.options.connectTimeout = const Duration(seconds: 5);
  dio.options.receiveTimeout = const Duration(seconds: 5);

  dio.interceptors.add(
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(
        printRequestData: true,
        printRequestHeaders: true,
      ),
    ),
  );
}