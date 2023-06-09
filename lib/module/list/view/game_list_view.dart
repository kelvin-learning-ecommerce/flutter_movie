import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coding_challenge/module/list/bloc/game_list_bloc.dart';
import 'package:flutter_coding_challenge/module/list/event/game_list_event.dart';
import 'package:flutter_coding_challenge/module/list/state/game_list_state.dart';
import 'package:flutter_coding_challenge/module/list/view/game_list_view_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/l10n.dart';
import '../../../utils/image_path.dart';

class GameListView extends StatefulWidget {
  const GameListView({Key? key}) : super(key: key);

  @override
  State<GameListView> createState() => _GameListViewState();
}

class _GameListViewState extends State<GameListView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      gameListBloc?.add(const GameListFetchEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // Env.data.title
        title: Text(S.of(context).view),
      ),
      body: Column(
        children: [
          Container(
            margin: REdgeInsets.all(10),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    gameListBloc?.add(const GameListChangeLangEvent());
                  },
                  child: BlocBuilder<GameListBloc, GameListState>(
                    buildWhen: (prev, state) => state is GameListStateChangeLang,
                    builder: (context, state) {
                      if (state is GameListStateChangeLang) {
                        if (state.lang.countryCode == "en") {
                          return Image.asset(
                            enIc,
                            width: 20.w,
                            height: 20.h,
                          );
                        }
                      }

                      return Image.asset(
                        idIc,
                        width: 20.w,
                        height: 20.h,
                      );
                    },
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    gameListBloc?.add(const GameListChangeLayoutEvent());
                  },
                  child: BlocBuilder<GameListBloc, GameListState>(
                    buildWhen: (prev, state) => state is GameListStateLayoutType,
                    builder: (context, state) {
                      if (state is GameListStateLayoutType) {
                        return Text(state.layoutType.name.toLowerCase());
                      }

                      return const Text("Listview");
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<GameListBloc, GameListState>(
              buildWhen: (previousState, state) {
                return state is GameListStateLoading ||
                    state is GameListStateSuccess ||
                    state is GameListStateError;
              },
              builder: (context, state) {
                if (state is GameListStateLoading) {
                  return const Center(
                    child: RefreshProgressIndicator(),
                  );
                } else if (state is GameListStateSuccess) {
                  return state.listLayout == ListLayout.listview
                      ? listviewLayout(state.result)
                      : gridviewLayout(state.result);
                } else if (state is GameListStateError) {
                  return Center(child: Text(state.error));
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
