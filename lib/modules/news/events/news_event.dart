import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object?> get props => [];
}

class NewsFetchEvent extends NewsEvent {
  final bool isFirstPage;
  final String? query;
  const NewsFetchEvent(this.isFirstPage, {this.query});
}

enum ListLayout { listview, gridview }

class NewsChangeLayoutEvent extends NewsEvent {
  const NewsChangeLayoutEvent();
}
