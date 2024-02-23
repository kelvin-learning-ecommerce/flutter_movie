import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse extends Equatable {
  const NewsResponse({
    this.status,
    this.totalResults,
    this.articles,
    this.code,
    this.message,
  });

  final String? status;
  final String? code;
  final String? message;
  final int? totalResults;
  final List<NewsArticles>? articles;

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return _$NewsResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NewsResponseToJson(this);

  @override
  List<Object?> get props => [status, totalResults, articles];
}

@JsonSerializable()
class NewsArticles extends Equatable {
  const NewsArticles(
      {this.source,
      this.author,
      this.title,
      this.content,
      this.description,
      this.publishedAt,
      this.url,
      this.urlToImage});

  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  factory NewsArticles.fromJson(Map<String, dynamic> json) {
    return _$NewsArticlesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NewsArticlesToJson(this);

  @override
  List<Object?> get props => [source, author, title, description, url, urlToImage, publishedAt, content];
}

@JsonSerializable()
class Source extends Equatable {
  final String? id;
  final String? name;

  const Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return _$SourceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SourceToJson(this);

  @override
  List<Object?> get props => [id, name];
}
