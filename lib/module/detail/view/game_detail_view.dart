import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/config/env.dart';

class GameDetailView extends StatefulWidget {
  const GameDetailView({Key? key}) : super(key: key);

  @override
  State<GameDetailView> createState() => _GameDetailViewState();
}

class _GameDetailViewState extends State<GameDetailView> {
  @override
  void initState() {
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
          // Container(),
          // Expanded(
          //   child: BlocBuilder<GameListBloc, GameListState>(
          //     builder: (context, state) {
          //       if (state is GameListStateSuccess) {
          //         return state.listLayout == ListLayout.listview
          //             ? listviewLayout(state.result)
          //             : gridviewLayout(state.result);
          //       }
          //
          //       return Container();
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
