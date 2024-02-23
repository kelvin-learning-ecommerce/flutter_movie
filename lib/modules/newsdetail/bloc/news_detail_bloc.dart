import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../config/router/navigation_config.dart';
import '../../../domain/repositories/api_repository.dart';
import '../events/news_detail_event.dart';
import '../states/news_detail_state.dart';

var newsDetailBloc = navigationService.navigatorKey.currentContext?.read<NewsDetailBloc>();

@injectable
class NewsDetailBloc extends Bloc<NewsDetailEvent, NewsDetailState> {
  NewsDetailBloc() : super(NewsDetailStateInit()) {
    on<NewsDetailTabEvent>((event, emit) async {
      emit(NewsDetailStateInit());

      emit(NewsDetailStateTabChange(event.pos));
    });
  }
}
