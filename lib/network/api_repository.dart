import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coding_challenge/module/detail/model/game_detail_model.dart';
import 'package:injectable/injectable.dart';

import '../config/navigation_config.dart';
import '../module/list/model/game_list_model.dart';
import 'base_service.dart';

var apiRepository = navigationService.navigatorKey.currentContext?.read<ApiRepository>();

@injectable
class ApiRepository {
  ApiRepository({required this.baseService});

  final BaseService baseService;

  Future<GameListResponse> fetchGameList() async {
    var res = await baseService.fetchGameList();
    return GameListResponse.fromJson(jsonDecode(res.toString()));
  }

  Future<GameDetailResponse> fetchGameDetail(int gameId) async {
    var res = await baseService.fetchGameDetail(gameId);
    return GameDetailResponse.fromJson(jsonDecode(res.toString()));
  }
}
