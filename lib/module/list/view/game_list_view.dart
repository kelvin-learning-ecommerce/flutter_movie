import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coding_challenge/module/list/bloc/game_list_bloc.dart';
import 'package:flutter_coding_challenge/module/list/event/game_list_event.dart';
import 'package:flutter_coding_challenge/module/list/state/game_list_state.dart';
import 'package:flutter_coding_challenge/module/list/view/game_list_view_ext.dart';
import 'package:flutter_coding_challenge/module/locale/state/locale_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/l10n.dart';
import '../../../utils/image_path.dart';
import '../../locale/bloc/locale_bloc.dart';
import '../../locale/event/locale_event.dart';

class GameListView extends StatefulWidget {
  const GameListView({Key? key}) : super(key: key);

  @override
  State<GameListView> createState() => _GameListViewState();
}

class _GameListViewState extends State<GameListView> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      gameListBloc?.add(const GameListFetchEvent(true));
    });

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        gameListBloc?.add(const GameListFetchEvent(false));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(S.of(context).main_title),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                padding: REdgeInsets.all(10),
                child: InkWell(
                  onTap: () {
                    localeBloc?.add(const LocaleChangeLangEvent());
                  },
                  child: BlocBuilder<LocaleBloc, LocaleState>(
                    buildWhen: (prev, state) => state is LocaleStateLoading || state is LocaleStateChangeLocale,
                    builder: (context, state) {
                      if (state is LocaleStateChangeLocale) {
                        if (langModel?.currLang.countryCode == "en") {
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
              ),
              const Spacer(),
              Container(
                padding: REdgeInsets.all(10),
                child: InkWell(
                  key: const Key("GameListChangeLayoutEvent"),
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
              ),
            ],
          ),
          Expanded(
            child: BlocBuilder<GameListBloc, GameListState>(
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

                return Container();
              },
            ),
          ),
          BlocBuilder<GameListBloc, GameListState>(
            builder: (context, state) {
              if (state is GameListStateLoadMore) {
                return const Center(
                  child: RefreshProgressIndicator(),
                );
              }

              return Container();
            },
          )
        ],
      ),
    );
  }
}
