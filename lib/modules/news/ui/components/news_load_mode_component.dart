import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../login/bloc/login_bloc.dart';
import '../../../login/states/login_state.dart';
import '../../bloc/news_bloc.dart';
import '../../states/news_state.dart';

class GameListLoadMoreComponent extends StatelessWidget {
  const GameListLoadMoreComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsStateLoadMore) {
          return const Center(
            child: RefreshProgressIndicator(),
          );
        }

        return Container(
          key: const Key("Game List Load More Component State Default Widget"),
        );
      },
    );
  }
}
