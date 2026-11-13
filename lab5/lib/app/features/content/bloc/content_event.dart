part of 'content_bloc.dart';

sealed class ContentEvent extends Equatable {
  const ContentEvent();

  @override
  List<Object?> get props => [];
}

final class ContentLoad extends ContentEvent {
  const ContentLoad(this.id);

  final String id;

  @override
  List<Object?> get props => [id];
}
