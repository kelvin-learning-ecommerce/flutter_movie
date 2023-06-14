// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameListResponse _$GameListResponseFromJson(Map<String, dynamic> json) =>
    GameListResponse(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => GameListData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GameListResponseToJson(GameListResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

GameListData _$GameListDataFromJson(Map<String, dynamic> json) => GameListData(
      id: json['id'] as int?,
      name: json['name'] as String?,
      released: json['released'] as String?,
      backgroundImage: json['background_image'] as String?,
      metaCritic: json['metacritic'] as int?,
    );

Map<String, dynamic> _$GameListDataToJson(GameListData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'released': instance.released,
      'background_image': instance.backgroundImage,
      'metacritic': instance.metaCritic,
    };
