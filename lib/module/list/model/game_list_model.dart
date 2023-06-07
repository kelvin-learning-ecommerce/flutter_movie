import 'package:json_annotation/json_annotation.dart';

part 'game_list_model.g.dart';

@JsonSerializable()
class GameListModel{
  GameListModel();

  factory GameListModel.fromJson(Map<String, dynamic> json) {
    return _$GameListModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GameListModelToJson(this);
}