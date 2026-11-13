import 'package:dio/dio.dart';
import 'package:flutter_lab5/app/features/content/bloc/content_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';

import 'package:flutter_lab5/app/features/home/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'package:flutter_lab5/data/dio/set_up.dart';
import 'package:flutter_lab5/domain/repositories/games/game_repository.dart';
import 'package:flutter_lab5/domain/repositories/games/game_repository_interface.dart';

final getIt = GetIt.instance;
final talker = TalkerFlutter.init();
final Dio dio = Dio();

Future<void> setupLocator() async {
  setUpDio();

  Bloc.observer = TalkerBlocObserver(talker: talker);

  getIt.registerSingleton(talker);

  getIt.registerSingleton<GameRepositoryInterface>(GameRepository(dio: dio));

  getIt.registerSingleton<HomeBloc>(HomeBloc(getIt<GameRepositoryInterface>()));
  getIt.registerFactory<ContentBloc>(
    () => ContentBloc(getIt<GameRepositoryInterface>()),
  );
}
