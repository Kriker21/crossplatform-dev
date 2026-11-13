import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab4/di/di.dart' show talker;

import 'package:flutter_lab4/domain/repositories/games/game_repository_interface.dart';
import 'package:flutter_lab4/domain/repositories/games/model/game_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.gameRepository) : super(const HomeInitial()) {
    on<HomeLoad>(_homeLoad);
  }

  final GameRepositoryInterface gameRepository;

  Future<void> _homeLoad(HomeLoad event, Emitter<HomeState> emit) async {
    try {
      emit(const HomeLoadInProgress());

      final games = await gameRepository.getGames();
      emit(HomeLoadSuccess(games: games));
    } catch (exception, stackTrace) {
      emit(const HomeLoadFailure());
      talker.handle(exception, stackTrace);
    }
  }
}
