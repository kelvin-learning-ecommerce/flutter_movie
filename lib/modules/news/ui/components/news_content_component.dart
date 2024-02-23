import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/enum/news_enum.dart';
import '../../../login/states/login_state.dart';
import '../../bloc/news_bloc.dart';
import '../../events/news_event.dart';
import '../../states/news_state.dart';
import 'news_view_ext.dart';

class NewsContentComponent extends StatelessWidget {
  final ScrollController scrollController;

  const NewsContentComponent({Key? key, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      buildWhen: (previousState, state) {
        return state is NewsStateLoading || state is NewsStateSuccess || state is NewsStateError;
      },
      builder: (context, state) {
        if (state is NewsStateLoading) {
          return const Center(
            child: RefreshProgressIndicator(),
          );
        } else if (state is NewsStateSuccess) {
          return state.listLayout == ListLayout.listview
              ? listviewLayout(scrollController, state.result)
              : gridviewLayout(scrollController, state.result);
        } else if (state is NewsStateError) {
          return Center(child: Text(errorMessage(state.error)));
        }

        return Container(
          key: const Key("Game List Content Component State Not Found"),
        );
      },
    );
  }

  String errorMessage(NewsError err) {
    if (err == NewsError.noResult) {
      return "No News Found";
    }else if (err == NewsError.other) {
      return "Please try again";
    } else {
      return "Please input search";
    }
  }
}
