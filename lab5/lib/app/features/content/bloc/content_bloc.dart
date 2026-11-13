import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab5/di/di.dart' show talker;
import 'package:flutter_lab5/domain/repositories/games/game_repository_interface.dart';
import 'package:flutter_lab5/domain/repositories/games/model/game_model.dart';

part 'content_event.dart';
part 'content_state.dart';

class ContentBloc extends Bloc<ContentEvent, ContentState> {
  ContentBloc(this.gameRepository) : super(const ContentInitial()) {
    on<ContentLoad>(_contentLoad);
  }

  final GameRepositoryInterface gameRepository;

  Future<void> _contentLoad(
    ContentLoad event,
    Emitter<ContentState> emit,
  ) async {
    try {
      emit(const ContentLoadInProgress());
      final game = await gameRepository.getGame(event.id);
      emit(ContentLoadSuccess(game: game));
    } catch (exception, stackTrace) {
      emit(const ContentLoadFailure());
      talker.handle(exception, stackTrace);
    }
  }
}
