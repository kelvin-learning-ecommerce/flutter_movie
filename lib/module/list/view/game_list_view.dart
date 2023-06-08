import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coding_challenge/config/env.dart';
import 'package:flutter_coding_challenge/module/list/bloc/game_list_bloc.dart';
import 'package:flutter_coding_challenge/module/list/event/game_list_event.dart';
import 'package:flutter_coding_challenge/module/list/state/game_list_state.dart';
import 'package:flutter_coding_challenge/module/list/view/game_list_view_ext.dart';

class GameListView extends StatefulWidget {
  const GameListView({Key? key}) : super(key: key);

  @override
  State<GameListView> createState() => _GameListViewState();
}

class _GameListViewState extends State<GameListView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(Env.data.title),
      ),
      body: Column(
        children: [
          Container(),
          Expanded(
            child: BlocBuilder<GameListBloc, GameListState>(
              builder: (context, state) {
                if (state is GameListStateSuccess) {
                  return state.listLayout == ListLayout.listview
                      ? listviewLayout(state.result)
                      : gridviewLayout(state.result);
                }

                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
