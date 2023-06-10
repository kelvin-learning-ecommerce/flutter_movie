import 'package:json_annotation/json_annotation.dart';

part 'game_detail_model.g.dart';

@JsonSerializable()
class GameDetailResponse {
  GameDetailResponse(this.name, this.descriptionRaw, this.genres, this.platforms, this.developers, this.publishers,
      this.tags, this.backgroundImage);

  final String? name;
  @JsonKey(name: 'description_raw')
  final String? descriptionRaw;
  final List<GenreResponse>? genres;
  final List<PlatformsResponse>? platforms;
  final List<DevelopersResponse>? developers;
  final List<PublisherResponse>? publishers;
  final List<TagsResponse>? tags;
  @JsonKey(name: "background_image")
  final String? backgroundImage;

  factory GameDetailResponse.fromJson(Map<String, dynamic> json) {
    return _$GameDetailResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GameDetailResponseToJson(this);
}

@JsonSerializable()
class GenreResponse {
  GenreResponse(this.name, this.imageBackground);

  final String? name;
  @JsonKey(name: "background_image")
  final String? imageBackground;

  factory GenreResponse.fromJson(Map<String, dynamic> json) {
    return _$GenreResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GenreResponseToJson(this);
}

@JsonSerializable()
class PlatformsResponse {
  PlatformsResponse(this.platform, this.releasedAt);

  @JsonKey(name: "released_at")
  final String? releasedAt;
  final PlatformsData? platform;

  factory PlatformsResponse.fromJson(Map<String, dynamic> json) {
    return _$PlatformsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PlatformsResponseToJson(this);
}

@JsonSerializable()
class PlatformsData {
  PlatformsData(this.name);

  final String? name;

  factory PlatformsData.fromJson(Map<String, dynamic> json) {
    return _$PlatformsDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PlatformsDataToJson(this);
}

@JsonSerializable()
class DevelopersResponse {
  DevelopersResponse(this.name);

  final String? name;

  factory DevelopersResponse.fromJson(Map<String, dynamic> json) {
    return _$DevelopersResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DevelopersResponseToJson(this);
}

@JsonSerializable()
class PublisherResponse {
  PublisherResponse(this.name);

  final String? name;

  factory PublisherResponse.fromJson(Map<String, dynamic> json) {
    return _$PublisherResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PublisherResponseToJson(this);
}

@JsonSerializable()
class TagsResponse {
  TagsResponse(this.imageBackground);

  @JsonKey(name: 'image_background')
  final String? imageBackground;

  factory TagsResponse.fromJson(Map<String, dynamic> json) {
    return _$TagsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TagsResponseToJson(this);
}
