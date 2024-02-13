import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coding_challenge/domain/models/args/game_detail_args.dart';
import 'package:flutter_coding_challenge/presentation/blocs/game_detail_bloc.dart';
import 'package:flutter_coding_challenge/presentation/events/game_detail_event.dart';
import 'package:flutter_coding_challenge/presentation/states/game_detail_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/models/response/game_detail_response.dart';
import '../../generated/l10n.dart';
import '../widgets/cached_network_image_utils.dart';
import 'game_detail_view_ext.dart';

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

    Map<String, dynamic> someMap = {
      "title": "0",
      "id": 2,
    };

    args = GameDetailArgs.fromJson(widget.args ?? someMap);

    Future.delayed(Duration.zero, () => gameDetailBloc?.add(GameDetailEventFetch(args?.id ?? 0)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GameDetailBody(title: args?.title ?? ''),
    );
  }
}

class GameDetailBody extends StatelessWidget {
  final String title;

  const GameDetailBody({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameDetailBloc, GameDetailState>(
        buildWhen: (prevState, state) =>
            state is GameDetailSuccessState || state is GameDetailLoadingState || state is GameDetailSuccessState,
        builder: (context, state) {
          if (state is GameDetailLoadingState) {
            return const Center(
              child: RefreshProgressIndicator(),
            );
          } else if (state is GameDetailSuccessState) {
            var detail = state.result;

            return GameDetailContentWidget(
              title: title,
              data: detail,
            );
          } else if (state is GameDetailErrorState) {
            return Text(S.of(context).game_detail_unavailable);
          }

          return Container();
        });
  }
}

class GameDetailContentWidget extends StatefulWidget {
  final String title;
  final GameDetailResponse data;

  const GameDetailContentWidget({Key? key, required this.title, required this.data}) : super(key: key);

  @override
  State<GameDetailContentWidget> createState() => _GameDetailContentWidgetState();
}

class _GameDetailContentWidgetState extends State<GameDetailContentWidget> with TickerProviderStateMixin {
  TabController? tabCtrl;

  @override
  void initState() {
    super.initState();
    tabCtrl = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  widget.title,
                ),
                background: AppCachedNetworkImage(
                  url: widget.data.backgroundImage ?? '',
                )),
          ),
          SliverPersistentHeader(
            delegate: _SliverAppBarDelegate(
              TabBar(
                controller: tabCtrl,
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
        buildWhen: (prevState, state) => state is GameDetailTabState || state is GameDetailLoadTabState,
        builder: (context, state) {
          int pos = 0;
          if (state is GameDetailTabState) {
            pos = state.position;
            if (pos == 0) {
              return InfoTab(
                detail: widget.data,
              );
            } else {
              return ScreenshotTab(detail: widget.data);
            }
          }
          // return pos == 0 ? infoTab(widget.data) : screenshotTab(widget.data);
          return Container();
        },
      ),
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
