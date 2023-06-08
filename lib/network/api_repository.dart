import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../config/navigation_config.dart';
import '../module/list/model/game_list_model.dart';
import 'base_service.dart';

var apiRepository = navigationService.navigatorKey.currentContext?.read<ApiRepository>();

@injectable
class ApiRepository {
  ApiRepository({required this.baseService});

  final BaseService baseService;

  // @override
  Future<GameListResponse> fetchGameList() async {
    var res = await baseService.fetchGameList();
    return GameListResponse.fromJson(jsonDecode(res));
  }
}

String getData(data) {
  var convert = jsonDecode(data.toString());
  return jsonEncode(convert['data']);
}
