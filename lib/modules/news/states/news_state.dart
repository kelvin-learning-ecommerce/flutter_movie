import 'package:equatable/equatable.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/models/response/news_response.dart';
import 'package:magnus_flutter_kelvin_prayitno/utils/enum/news_enum.dart';

import '../events/news_event.dart';


abstract class NewsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewsStateInit extends NewsState {}

class NewsStateLoading extends NewsState {}

class NewsStateError extends NewsState {
  final NewsError error;

  NewsStateError({required this.error});
}

class NewsStateSuccess extends NewsState {
  final List<NewsArticles> result;
  final ListLayout? listLayout;

  NewsStateSuccess({required this.result, this.listLayout});
}

class NewsStateLoadMore extends NewsState {}

class NewsStateLayoutType extends NewsState {
  final ListLayout? layoutType;

  NewsStateLayoutType({this.layoutType});
}
