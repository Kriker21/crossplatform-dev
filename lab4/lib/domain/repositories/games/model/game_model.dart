import 'package:json_annotation/json_annotation.dart';

part 'game_model.g.dart';

@JsonSerializable()
class GameModel {
  final int id;
  final String title;

  @JsonKey(name: 'short_description')
  final String description;

  @JsonKey(name: 'thumbnail')
  final String imageUrl;

  const GameModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) =>
      _$GameModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameModelToJson(this);
}
