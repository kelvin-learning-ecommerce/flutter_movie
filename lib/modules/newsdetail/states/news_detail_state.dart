import 'package:equatable/equatable.dart';

import '../../../domain/models/response/news_response.dart';

abstract class NewsDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewsDetailStateInit extends NewsDetailState {}
class NewsDetailStateLoad extends NewsDetailState {
  final NewsArticles data;
  NewsDetailStateLoad(this.data);

}

class NewsDetailStateTabChange extends NewsDetailState {
  final int pos;
  NewsDetailStateTabChange(this.pos);

}