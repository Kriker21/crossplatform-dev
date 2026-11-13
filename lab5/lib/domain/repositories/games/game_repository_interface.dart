import 'model/game_model.dart';

abstract interface class GameRepositoryInterface {
  Future<List<GameModel>> getGames();
  Future<GameModel> getGame(String id);
}
