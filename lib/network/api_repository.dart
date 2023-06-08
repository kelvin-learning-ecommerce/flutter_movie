import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../module/list/model/game_list_model.dart';
import 'base_service.dart';

@injectable
class ApiRepository {
  ApiRepository({required this.baseService});

  final BaseService baseService;

  // @override
  Future<GameListModel> fetchGameList() async {
    var res = await baseService.fetchGameList();
    return GameListModel.fromJson(jsonDecode(res));
  }
}

String getData(data) {
  var convert = jsonDecode(data.toString());
  return jsonEncode(convert['data']);
}
