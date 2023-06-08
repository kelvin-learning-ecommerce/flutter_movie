// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameListModel _$GameListModelFromJson(Map<String, dynamic> json) =>
    GameListModel(
      name: json['name'] as String,
      released: json['released'] as String,
      backgroundImage: json['background_image'] as String,
      metaCritic: json['metacritic'] as int,
    );

Map<String, dynamic> _$GameListModelToJson(GameListModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'released': instance.released,
      'background_image': instance.backgroundImage,
      'metacritic': instance.metaCritic,
    };
