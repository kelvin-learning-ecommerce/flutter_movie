import 'package:json_annotation/json_annotation.dart';

part 'game_detail_model.g.dart';

@JsonSerializable()
class GameDetailResponse {
  GameDetailResponse();


  factory GameDetailResponse.fromJson(Map<String, dynamic> json) {
    return _$GameDetailResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GameDetailResponseToJson(this);
}
