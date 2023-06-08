import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/config/env.dart';
import 'package:flutter_coding_challenge/module/list/bloc/game_list_bloc.dart';

class GameListView extends StatefulWidget {
  const GameListView({Key? key}) : super(key: key);

  @override
  State<GameListView> createState() => _GameListViewState();
}

class _GameListViewState extends State<GameListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Env.data.title),
      ),
      body: Container(),
    );
  }
}
