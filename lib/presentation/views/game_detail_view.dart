import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coding_challenge/domain/models/args/game_detail_args.dart';
import 'package:flutter_coding_challenge/presentation/blocs/game_detail_bloc.dart';
import 'package:flutter_coding_challenge/presentation/events/game_detail_event.dart';
import 'package:flutter_coding_challenge/presentation/states/game_detail_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/l10n.dart';
import '../widgets/cached_network_image_utils.dart';
import 'game_detail_view_ext.dart';

class GameDetailView extends StatefulWidget {
  const GameDetailView({Key? key, this.args}) : super(key: key);

  final dynamic args;

  @override
  State<GameDetailView> createState() => _GameDetailViewState();
}

class _GameDetailViewState extends State<GameDetailView> with TickerProviderStateMixin {
  GameDetailArgs? args;

  TabController? tabController;

  @override
  void initState() {
    super.initState();

    args = GameDetailArgs.fromJson(widget.args);

    Future.delayed(Duration.zero, () => gameDetailBloc?.add(GameDetailEventFetch(args?.id ?? 0)));

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<GameDetailBloc, GameDetailState>(
          buildWhen: (prevState, state) =>
              state is GameDetailSuccessState ||
              state is GameDetailLoadingState ||
              state is GameDetailSuccessState,
          builder: (context, state) {
            if (state is GameDetailLoadingState) {
              return const Center(
                child: RefreshProgressIndicator(),
              );
            } else if (state is GameDetailSuccessState) {
              var detail = state.result;

              return NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      expandedHeight: 200.0,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          title: Text(
                            args?.title ?? '',
                          ),
                          background: AppCachedNetworkImage(
                            url: detail.backgroundImage ?? '',
                          )),
                    ),
                    SliverPersistentHeader(
                      delegate: _SliverAppBarDelegate(
                        TabBar(
                          controller: tabController,
                          labelColor: Colors.black87,
                          unselectedLabelColor: Colors.grey,
                          tabs: const [
                            Tab(icon: Icon(Icons.info), text: "Info"),
                            Tab(icon: Icon(Icons.screen_lock_portrait), text: "Screenshot"),
                          ],
                          onTap: (pos) {
                            gameDetailBloc?.add(GameDetailTabEvent(pos));
                          },
                        ),
                      ),
                      pinned: true,
                    ),
                  ];
                },
                body: BlocBuilder<GameDetailBloc, GameDetailState>(
                  buildWhen: (prevState, state) =>
                      state is GameDetailTabState || state is GameDetailLoadTabState,
                  builder: (context, state) {
                    int pos = 0;
                    if (state is GameDetailTabState) {
                      pos = state.position;
                    }
                    return pos == 0 ? infoTab(detail) : screenshotTab(detail);
                  },
                ),
              );
            } else if (state is GameDetailErrorState) {
              return Text(S.of(context).game_detail_unavailable);
            }

            return Container();
          }),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      height: 100.h,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
