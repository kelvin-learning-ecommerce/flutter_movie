import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/module/detail/model/game_detail_args.dart';

class GameDetailView extends StatefulWidget {
  const GameDetailView({Key? key, this.args}) : super(key: key);

  final dynamic args;

  @override
  State<GameDetailView> createState() => _GameDetailViewState();
}

class _GameDetailViewState extends State<GameDetailView> {
  GameDetailArgs? args;

  @override
  void initState() {
    super.initState();

    args = GameDetailArgs.fromJson(widget.args);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(args?.title ?? ''),
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
