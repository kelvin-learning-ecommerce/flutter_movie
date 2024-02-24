import 'package:equatable/equatable.dart';

abstract class NewsDetailEvent extends Equatable {
  const NewsDetailEvent();

  @override
  List<Object?> get props => [];
}

class NewsDetailTabEvent extends NewsDetailEvent {
  final int pos;
  const NewsDetailTabEvent(this.pos);
}
