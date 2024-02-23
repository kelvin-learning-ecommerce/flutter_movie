import 'package:flutter/material.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/news/bloc/news_bloc.dart';

import '../../locale/bloc/locale_bloc.dart';
import '../../locale/events/locale_event.dart';
import '../../widgets/debouncer.dart';
import '../../widgets/search_text_field.dart';
import 'components/layout_selection_component.dart';
import 'components/locale_component.dart';
import 'components/news_content_component.dart';
import 'components/news_load_mode_component.dart';
import '../events/news_event.dart';

class NewsView extends StatefulWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> with AutomaticKeepAliveClientMixin<NewsView> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Scaffold(
      backgroundColor: Colors.white,
      body: NewsListScreen(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({Key? key}) : super(key: key);

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  ScrollController scrollController = ScrollController();

  TextEditingController searchController = TextEditingController();

  final _debouncer = Debouncer(milliseconds: 1000);

  @override
  void initState() {
    super.initState();

    newsBloc?.add(const NewsFetchEvent(true));
    newsBloc?.add(const NewsChangeLayoutEvent());
    localeBloc?.add(const LocaleChangeLangEvent());

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent == scrollController.position.pixels) {
        newsBloc?.add(NewsFetchEvent(false, query: searchController.text));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key("News-Parent Column"),
      children: [
        SearchTextField(
          controller: searchController,
          labelText: 'Search',
          onTextChanged: (String text) {
            _debouncer.run(() {
              newsBloc?.add(NewsFetchEvent(true, query: text));
            });
          },
        ),
        const Row(
          children: [
            LocaleComponent(),
            Spacer(),
            LayoutSelectionComponent(),
          ],
        ),
        Expanded(
          child: NewsContentComponent(
            scrollController: scrollController,
          ),
        ),
        const GameListLoadMoreComponent()
      ],
    );
  }
}
