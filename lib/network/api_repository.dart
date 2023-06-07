import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../DI/di_locator.dart';
import '../module/list/model/game_list_model.dart';
import 'base_service.dart';

final apiRepository = locator<ApiRepository>();

abstract class ApiRepository {
  Future<GameListModel> fetchGameList();
}

@injectable
class ApiRepositoryImp implements ApiRepository {
  @override
  Future<GameListModel> fetchGameList() async {
    var res = await baseService.fetchGameList();
    return GameListModel.fromJson(jsonDecode(res));
  }
}

String getData(data) {
  var convert = jsonDecode(data.toString());
  return jsonEncode(convert['data']);
}
