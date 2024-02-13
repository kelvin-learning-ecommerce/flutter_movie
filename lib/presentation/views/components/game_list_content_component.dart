import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/game_list_bloc.dart';
import '../../events/game_list_event.dart';
import '../../states/game_list_state.dart';
import '../game_list_view_ext.dart';

class GameListContentComponent extends StatelessWidget {
  final ScrollController scrollController;

  const GameListContentComponent({Key? key, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameListBloc, GameListState>(
      buildWhen: (previousState, state) {
        return state is GameListStateLoading || state is GameListStateSuccess || state is GameListStateError;
      },
      builder: (context, state) {
        if (state is GameListStateLoading) {
          return const Center(
            child: RefreshProgressIndicator(),
          );
        } else if (state is GameListStateSuccess) {
          return state.listLayout == ListLayout.listview
              ? listviewLayout(scrollController, state.result)
              : gridviewLayout(scrollController, state.result);
        } else if (state is GameListStateError) {
          return Center(child: Text(state.error));
        }

        return Container(
          key: const Key("Game List Content Component State Not Found"),
        );
      },
    );
  }
}
