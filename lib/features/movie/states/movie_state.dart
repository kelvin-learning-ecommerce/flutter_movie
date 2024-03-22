import 'package:equatable/equatable.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/models/response/movie_response.dart';
import 'package:magnus_flutter_kelvin_prayitno/utils/enum/news_enum.dart';

import '../events/movie_event.dart';


abstract class MovieState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieStateInit extends MovieState {}

class MovieStateLoading extends MovieState {}

class MovieStateError extends MovieState {
  final NewsError error;

  MovieStateError({required this.error});
}

class MovieStateSuccess extends MovieState {
  final List<MovieResultResponse> result;
  final ListLayout? listLayout;

  MovieStateSuccess({required this.result, this.listLayout});
}

class MovieStateLayoutType extends MovieState {
  final ListLayout? layoutType;

  MovieStateLayoutType({this.layoutType});
}
