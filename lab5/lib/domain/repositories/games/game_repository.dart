import 'package:dio/dio.dart';

import 'package:flutter_lab5/data/endpoints.dart';

import 'game_repository_interface.dart';
import 'model/game_model.dart';

class GameRepository implements GameRepositoryInterface {
  final Dio dio;

  GameRepository({required this.dio});

  @override
  Future<List<GameModel>> getGames() async {
    final response = await dio.get(Endpoints.games);
    return (response.data as List)
        .map((item) => GameModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<GameModel> getGame(String id) async {
    final response = await dio.get(Endpoints.game, queryParameters: {'id': id});
    return GameModel.fromJson(response.data as Map<String, dynamic>);
  }
}
