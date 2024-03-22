import 'package:json_annotation/json_annotation.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse {
  const MovieResponse({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  final int? count;
  final String? next;
  final String? previous;
  final List<MovieResultResponse>? results;

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return _$MovieResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}

@JsonSerializable()
class MovieResultResponse {
  const MovieResultResponse(
      {this.title,
      this.episodeId,
      this.openingCrawl,
      this.director,
      this.producer,
      this.releaseDate,
      this.characters,
      this.planets,
      this.starships,
      this.vehicles,
      this.species,
      this.created,
      this.edited,
      this.url});

  final String? title;
  @JsonKey(name: "episode_id")
  final int? episodeId;
  @JsonKey(name: "opening_crawl")
  final String? openingCrawl;
  final String? director;
  final String? producer;
  @JsonKey(name: "release_date")
  final String? releaseDate;
  final List<String>? characters;
  final List<String>? planets;
  final List<String>? starships;
  final List<String>? vehicles;
  final List<String>? species;
  final String? created;
  final String? edited;
  final String? url;

  factory MovieResultResponse.fromJson(Map<String, dynamic> json) {
    return _$MovieResultResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieResultResponseToJson(this);
}
