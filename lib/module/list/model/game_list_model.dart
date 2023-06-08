import 'package:json_annotation/json_annotation.dart';

part 'game_list_model.g.dart';

@JsonSerializable()
class GameListModel {
  GameListModel(
      {required this.name,
      required this.released,
      required this.backgroundImage,
      required this.metaCritic});

  final String name;
  final String released;
  @JsonKey(name: 'background_image')
  final String backgroundImage;
  @JsonKey(name: 'metacritic')
  final int metaCritic;

  factory GameListModel.fromJson(Map<String, dynamic> json) {
    return _$GameListModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GameListModelToJson(this);
}
