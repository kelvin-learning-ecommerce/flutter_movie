import 'package:json_annotation/json_annotation.dart';

part 'game_detail_args.g.dart';

@JsonSerializable()
class GameDetailArgs {
  String title;
  int id;

  GameDetailArgs(this.title, this.id);

  factory GameDetailArgs.fromJson(Map<String, dynamic> json) {
    return _$GameDetailArgsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GameDetailArgsToJson(this);
}
