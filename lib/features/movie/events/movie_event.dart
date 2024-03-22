import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object?> get props => [];
}

class MovieFetchEvent extends MovieEvent {
  final String? query;

  const MovieFetchEvent({this.query});
}

enum ListLayout { listview, gridview }

class MovieChangeLayoutEvent extends MovieEvent {
  const MovieChangeLayoutEvent();
}
