part of 'content_bloc.dart';

sealed class ContentState extends Equatable {
  const ContentState();

  @override
  List<Object?> get props => [];
}

final class ContentInitial extends ContentState {
  const ContentInitial();
}

final class ContentLoadInProgress extends ContentState {
  const ContentLoadInProgress();
}

final class ContentLoadSuccess extends ContentState {
  const ContentLoadSuccess({required this.game});

  final GameModel game;

  @override
  List<Object?> get props => [game];
}

final class ContentLoadFailure extends ContentState {
  const ContentLoadFailure();
}
