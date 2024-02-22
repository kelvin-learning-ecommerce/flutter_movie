import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/models/response/news_response.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/newsdetail/bloc/news_detail_bloc.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/newsdetail/states/news_detail_state.dart';

import '../../../generated/l10n.dart';
import '../../widgets/cached_network_image_utils.dart';
import '../events/news_detail_event.dart';
import 'news_detail_view_ext.dart';

class NewsDetailView extends StatefulWidget {
  const NewsDetailView({Key? key, required this.args}) : super(key: key);

  final NewsArticles args;

  @override
  State<NewsDetailView> createState() => _NewsDetailViewState();
}

class _NewsDetailViewState extends State<NewsDetailView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GameDetailBody(
          data: widget.args,
        ),
      ),
    );
  }
}

class GameDetailBody extends StatefulWidget {
  final NewsArticles? data;

  const GameDetailBody({Key? key, required this.data}) : super(key: key);

  @override
  State<GameDetailBody> createState() => _GameDetailBodyState();
}

class _GameDetailBodyState extends State<GameDetailBody> with TickerProviderStateMixin {
  TabController? tabCtrl;

  @override
  void initState() {
    super.initState();
    tabCtrl = TabController(length: 2, vsync: this);
    newsDetailBloc?.add(const NewsDetailTabEvent(0));
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
                  widget.data?.title ?? "",
                ),
                background: AppCachedNetworkImage(
                  url: widget.data?.urlToImage ?? '',
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
                  newsDetailBloc?.add(NewsDetailTabEvent(pos));
                },
              ),
            ),
            pinned: true,
          ),
        ];
      },
      body: BlocBuilder<NewsDetailBloc, NewsDetailState>(
        buildWhen: (prevState, state) => state is NewsDetailStateTabChange,
        builder: (context, state) {
          int pos = 0;
          if (state is NewsDetailStateTabChange) {
            pos = state.pos;
            if (pos == 0) {
              return InfoTab(
                detail: widget.data,
              );
            } else {
              return ScreenshotTab(detail: widget.data);
            }
          }
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
