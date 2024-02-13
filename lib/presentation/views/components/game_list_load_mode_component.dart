import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/game_list_bloc.dart';
import '../../states/game_list_state.dart';

class GameListLoadMoreComponent extends StatelessWidget {
  const GameListLoadMoreComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameListBloc, GameListState>(
      builder: (context, state) {
        if (state is GameListStateLoadMore) {
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
