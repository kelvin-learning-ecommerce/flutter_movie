import 'package:flutter/material.dart';

import '../../locale/bloc/locale_bloc.dart';
import '../../locale/events/locale_event.dart';
import '../../widgets/debouncer.dart';
import '../../widgets/search_text_field.dart';
import '../bloc/movie_bloc.dart';
import 'components/layout_selection_component.dart';
import 'components/locale_component.dart';
import 'components/movie_content_component.dart';
import '../events/movie_event.dart';

class MovieView extends StatefulWidget {
  const MovieView({Key? key}) : super(key: key);

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> with AutomaticKeepAliveClientMixin<MovieView> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Scaffold(
      backgroundColor: Colors.white,
      body: MovieListScreen(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  TextEditingController searchController = TextEditingController();

  final _debouncer = Debouncer(milliseconds: 1000);

  @override
  void initState() {
    super.initState();

    movieBloc?.add(const MovieFetchEvent());
    movieBloc?.add(const MovieChangeLayoutEvent());
    localeBloc?.add(const LocaleChangeLangEvent());
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
              movieBloc?.add(MovieFetchEvent(query: text));
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
        const Expanded(
          child: MovieContentComponent(),
        ),
      ],
    );
  }
}
