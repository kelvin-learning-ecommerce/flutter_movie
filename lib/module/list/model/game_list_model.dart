import 'package:json_annotation/json_annotation.dart';

part 'game_list_model.g.dart';

@JsonSerializable()
class GameListResponse {
  GameListResponse({required this.count, required this.next, required this.previous, required this.results});

  final int? count;
  final String? next;
  final String? previous;
  final List<GameListData>? results;

  factory GameListResponse.fromJson(Map<String, dynamic> json) {
    return _$GameListResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GameListResponseToJson(this);
}

@JsonSerializable()
class GameListData {
  GameListData(
      {required this.id,
      required this.name,
      required this.released,
      required this.backgroundImage,
      required this.metaCritic});

  final int? id;
  final String? name;
  final String? released;
  @JsonKey(name: 'background_image')
  final String? backgroundImage;
  @JsonKey(name: 'metacritic')
  final int? metaCritic;

  factory GameListData.fromJson(Map<String, dynamic> json) {
    return _$GameListDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GameListDataToJson(this);
}
