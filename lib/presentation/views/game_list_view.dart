import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/presentation/events/game_list_event.dart';
import 'package:flutter_coding_challenge/presentation/views/components/game_list_content_component.dart';
import 'package:flutter_coding_challenge/presentation/views/components/game_list_load_mode_component.dart';
import 'package:flutter_coding_challenge/presentation/views/components/layout_selection_component.dart';
import 'package:flutter_coding_challenge/presentation/views/components/locale_component.dart';

import '../../generated/l10n.dart';
import '../blocs/game_list_bloc.dart';

class GameListView extends StatelessWidget {
  const GameListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(S.of(context).main_title),
      ),
      body: const GameListScreen(),
    );
  }
}

class GameListScreen extends StatefulWidget {
  const GameListScreen({Key? key}) : super(key: key);

  @override
  State<GameListScreen> createState() => _GameListScreenState();
}

class _GameListScreenState extends State<GameListScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

      gameListBloc?.add(const GameListFetchEvent(true));

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent == scrollController.position.pixels) {
        gameListBloc?.add(const GameListFetchEvent(false));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key("Game List Screen Parent Column"),
      children: [
        const Row(
          children: [
            LocaleComponent(),
            Spacer(),
            LayoutSelectionComponent(),
          ],
        ),
        Expanded(
          child: GameListContentComponent(
            scrollController: scrollController,
          ),
        ),
        const GameListLoadMoreComponent()
      ],
    );
  }
}
