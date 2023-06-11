// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameDetailResponse _$GameDetailResponseFromJson(Map<String, dynamic> json) =>
    GameDetailResponse(
      json['name'] as String?,
      json['description_raw'] as String?,
      (json['genres'] as List<dynamic>?)
          ?.map((e) => GenreResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['platforms'] as List<dynamic>?)
          ?.map((e) => PlatformsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['developers'] as List<dynamic>?)
          ?.map((e) => DevelopersResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['publishers'] as List<dynamic>?)
          ?.map((e) => PublisherResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['tags'] as List<dynamic>?)
          ?.map((e) => TagsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['background_image'] as String?,
    );

Map<String, dynamic> _$GameDetailResponseToJson(GameDetailResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description_raw': instance.descriptionRaw,
      'genres': instance.genres,
      'platforms': instance.platforms,
      'developers': instance.developers,
      'publishers': instance.publishers,
      'tags': instance.tags,
      'background_image': instance.backgroundImage,
    };

GenreResponse _$GenreResponseFromJson(Map<String, dynamic> json) =>
    GenreResponse(
      json['name'] as String?,
      json['background_image'] as String?,
    );

Map<String, dynamic> _$GenreResponseToJson(GenreResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'background_image': instance.imageBackground,
    };

PlatformsResponse _$PlatformsResponseFromJson(Map<String, dynamic> json) =>
    PlatformsResponse(
      json['platform'] == null
          ? null
          : PlatformsData.fromJson(json['platform'] as Map<String, dynamic>),
      json['released_at'] as String?,
    );

Map<String, dynamic> _$PlatformsResponseToJson(PlatformsResponse instance) =>
    <String, dynamic>{
      'released_at': instance.releasedAt,
      'platform': instance.platform,
    };

PlatformsData _$PlatformsDataFromJson(Map<String, dynamic> json) =>
    PlatformsData(
      json['name'] as String?,
    );

Map<String, dynamic> _$PlatformsDataToJson(PlatformsData instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

DevelopersResponse _$DevelopersResponseFromJson(Map<String, dynamic> json) =>
    DevelopersResponse(
      json['name'] as String?,
    );

Map<String, dynamic> _$DevelopersResponseToJson(DevelopersResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

PublisherResponse _$PublisherResponseFromJson(Map<String, dynamic> json) =>
    PublisherResponse(
      json['name'] as String?,
    );

Map<String, dynamic> _$PublisherResponseToJson(PublisherResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

TagsResponse _$TagsResponseFromJson(Map<String, dynamic> json) => TagsResponse(
      json['image_background'] as String?,
    );

Map<String, dynamic> _$TagsResponseToJson(TagsResponse instance) =>
    <String, dynamic>{
      'image_background': instance.imageBackground,
    };
