// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameModel _$GameModelFromJson(Map<String, dynamic> json) => GameModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['short_description'] as String,
  imageUrl: json['thumbnail'] as String,
);

Map<String, dynamic> _$GameModelToJson(GameModel instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'short_description': instance.description,
  'thumbnail': instance.imageUrl,
};
