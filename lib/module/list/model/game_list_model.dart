import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_list_model.g.dart';

@JsonSerializable()
class GameListResponse extends Equatable {
  const GameListResponse({this.count, this.next, this.previous, this.results});

  final int? count;
  final String? next;
  final String? previous;
  final List<GameListData>? results;

  factory GameListResponse.fromJson(Map<String, dynamic> json) {
    return _$GameListResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GameListResponseToJson(this);

  @override
  List<Object?> get props => [count, next, previous, results];
}

@JsonSerializable()
class GameListData extends Equatable {
  const GameListData(
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

  @override
  List<Object?> get props => [id, name, released, backgroundImage, metaCritic];
}
