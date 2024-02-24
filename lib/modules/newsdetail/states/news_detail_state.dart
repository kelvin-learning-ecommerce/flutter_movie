import 'package:equatable/equatable.dart';

abstract class NewsDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewsDetailStateInit extends NewsDetailState {}

class NewsDetailStateTabChange extends NewsDetailState {
  final int pos;

  NewsDetailStateTabChange(this.pos);
}
