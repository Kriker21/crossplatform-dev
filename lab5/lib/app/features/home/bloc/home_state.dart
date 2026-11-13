part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {
  const HomeInitial();
}

final class HomeLoadInProgress extends HomeState {
  const HomeLoadInProgress();
}

final class HomeLoadSuccess extends HomeState {
  const HomeLoadSuccess({required this.games});

  final List<GameModel> games;

  @override
  List<Object?> get props => [games];
}

final class HomeLoadFailure extends HomeState {
  const HomeLoadFailure();
}
