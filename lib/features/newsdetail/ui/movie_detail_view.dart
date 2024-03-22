import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/models/response/movie_response.dart';

import '../../widgets/cached_network_image_utils.dart';
import '../bloc/movie_detail_bloc.dart';
import '../events/movie_detail_event.dart';
import '../states/movie_detail_state.dart';
import 'movie_detail_view_ext.dart';

class NewsDetailView extends StatefulWidget {
  const NewsDetailView({Key? key, required this.args}) : super(key: key);

  final MovieResultResponse args;

  @override
  State<NewsDetailView> createState() => _NewsDetailViewState();
}
//register, floor, paging, DI, navigation ny bottom tab bar, tipe listview, localize, language selection, test ny api & widget, bloc

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
  final MovieResultResponse? data;

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
    movieDetailBloc?.add(const MovieDetailTabEvent(0));
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
                background: Hero(
                  tag: widget.data?.title ?? "",
                  child: AppCachedNetworkImage(
                    url: 'https://starwars-visualguide.com/assets/img/films/${widget.data?.episodeId}.jpg',
                  ),
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
                  Tab(icon: Icon(Icons.link), text: "Link"),
                ],
                onTap: (pos) {
                  movieDetailBloc?.add(MovieDetailTabEvent(pos));
                },
              ),
            ),
            pinned: true,
          ),
        ];
      },
      body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        buildWhen: (prevState, state) => state is MovieDetailStateTabChange,
        builder: (context, state) {
          int pos = 0;
          if (state is MovieDetailStateTabChange) {
            pos = state.pos;
            if (pos == 0) {
              return InfoTab(
                detail: widget.data,
              );
            } else {
              return LinkTab(detail: widget.data);
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
