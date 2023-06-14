
import '../models/response/game_detail_response.dart';
import '../models/response/game_list_response.dart';

abstract class ApiRepository {
  Future<GameListResponse> fetchGameList(int page, {String? url});

  Future<GameDetailResponse> fetchGameDetail(int gameId);
}
