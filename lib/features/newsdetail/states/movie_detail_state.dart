import 'package:equatable/equatable.dart';

abstract class MovieDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieDetailStateInit extends MovieDetailState {}

class MovieDetailStateTabChange extends MovieDetailState {
  final int pos;

  MovieDetailStateTabChange(this.pos);
}
