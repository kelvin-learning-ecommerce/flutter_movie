import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/news/events/news_event.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/news/states/news_state.dart';
import 'package:magnus_flutter_kelvin_prayitno/utils/enum/news_enum.dart';

import '../../../config/router/navigation_config.dart';
import '../../../domain/models/response/news_response.dart';
import '../../../domain/repositories/api_repository.dart';

var newsBloc = navigationService.navigatorKey.currentContext?.read<NewsBloc>();

@injectable
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final ApiRepository apiRepository;

  ListLayout listLayout = ListLayout.listview;
  List<NewsArticles> result = [];
  int page = 1;
  bool isLoading = false;

  NewsBloc(this.apiRepository) : super(NewsStateInit()) {
    on<NewsFetchEvent>((event, emit) async {
      var q = event.query ?? "";
      if (q.isEmpty) {
        emit(NewsStateError(error: NewsError.emptyQuery));
      }
        if (!isLoading) {
        isLoading = true;

        if (event.isFirstPage) {
          emit(NewsStateLoading());
          result.clear();
        } else {
          emit(NewsStateLoadMore());
        }

        try {
          var response = await apiRepository.fetchNews(q: q, page: page);

          if((response.articles ?? []).isEmpty){
            emit(NewsStateError(error: NewsError.noResult));
          }

          result.addAll(response.articles ?? []);

          emit(NewsStateSuccess(result: result, listLayout: listLayout));

          page += 1;
        } catch (e) {
          emit(NewsStateError(error: NewsError.emptyQuery));
        }

        isLoading = false;
      }
    });

    on<NewsChangeLayoutEvent>((event, emit) async {
      emit(NewsStateLoading());

      if (listLayout == ListLayout.listview) {
        listLayout = ListLayout.gridview;
      } else {
        listLayout = ListLayout.listview;
      }

      emit(NewsStateSuccess(result: result, listLayout: listLayout));

      emit(NewsStateLayoutType(layoutType: listLayout));
    });
  }
}
