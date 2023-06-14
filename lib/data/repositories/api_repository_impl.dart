import 'package:injectable/injectable.dart';

import '../../domain/models/response/game_detail_response.dart';
import '../../domain/models/response/game_list_response.dart';
import '../../domain/repositories/api_repository.dart';
import 'base/api_service.dart';

@Injectable(as: ApiRepository)
class ApiRepositoryImpl implements ApiRepository {
  ApiRepositoryImpl({required this.baseService});

  final ApiService baseService;

  @override
  Future<GameListResponse> fetchGameList(int page, {String? url}) async {
    var res = await baseService.fetchGameList(page: page, url: url);
    return GameListResponse.fromJson(res);
  }

  @override
  Future<GameDetailResponse> fetchGameDetail(int gameId) async {
    var res = await baseService.fetchGameDetail(gameId);
    return GameDetailResponse.fromJson(res);
  }
}
