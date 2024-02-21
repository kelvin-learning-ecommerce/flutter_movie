import 'package:equatable/equatable.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/models/response/news_response.dart';

abstract class NewsDetailEvent extends Equatable {
  const NewsDetailEvent();

  @override
  List<Object?> get props => [];
}

class NewsDetailLoadEvent extends NewsDetailEvent {
  final NewsArticles data;
  const NewsDetailLoadEvent(this.data);
}

class NewsDetailTabEvent extends NewsDetailEvent {
  final int pos;
  const NewsDetailTabEvent(this.pos);
}
