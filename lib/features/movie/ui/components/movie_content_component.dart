import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/constants/key_label.dart';
import '../../../../utils/enum/movie_fetch_enum.dart';
import '../../bloc/movie_bloc.dart';
import '../../events/movie_event.dart';
import '../../states/movie_state.dart';
import 'movie_view_ext.dart';

class MovieContentComponent extends StatelessWidget {
  const MovieContentComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previousState, state) {
        return state is MovieStateLoading || state is MovieStateSuccess || state is MovieStateError;
      },
      builder: (context, state) {
        if (state is MovieStateLoading) {
          return const Center(
            child: RefreshProgressIndicator(),
          );
        } else if (state is MovieStateSuccess) {
          return state.listLayout == ListLayout.listview ? listviewLayout(state.result) : gridviewLayout(state.result);
        } else if (state is MovieStateError) {
          return Center(child: Text(errorMessage(state.error)));
        }

        return Container(
          key: movieContentKeyNotFound,
        );
      },
    );
  }

  String errorMessage(MovieFetchError err) {
    if (err == MovieFetchError.noResult) {
      return "No Movie Found";
    } else if (err == MovieFetchError.other) {
      return "Please try again";
    } else {
      return "Please input search";
    }
  }
}
