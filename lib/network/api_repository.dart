import 'package:flutter_coding_challenge/module/detail/model/game_detail_model.dart';
import 'package:injectable/injectable.dart';

import '../module/list/model/game_list_model.dart';
import 'base_service.dart';

@injectable
class ApiRepository {
  ApiRepository({required this.baseService});

  final BaseService baseService;

  Future<GameListResponse> fetchGameList(int page, {String? url}) async {
    var res = await baseService.fetchGameList(page: page, url: url);
    return GameListResponse.fromJson(res);
  }

  Future<GameDetailResponse> fetchGameDetail(int gameId) async {
    var res = await baseService.fetchGameDetail(gameId);
    return GameDetailResponse.fromJson(res);
  }
}
