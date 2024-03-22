import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

import '../../bloc/movie_bloc.dart';
import '../../events/movie_event.dart';
import '../../states/movie_state.dart';

class LayoutSelectionComponent extends StatelessWidget {
  const LayoutSelectionComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(10),
      child: TouchableOpacity(
        key: const Key("GameListChangeLayoutEvent"),
        onTap: () {
          movieBloc?.add(const MovieChangeLayoutEvent());
        },
        child: BlocBuilder<MovieBloc, MovieState>(
          buildWhen: (prev, state) => state is MovieStateLayoutType,
          builder: (context, state) {
            if (state is MovieStateLayoutType) {
              return Text("${state.layoutType?.name.toLowerCase()}", key: const Key("Layout Selection Info"));
            }

            return Container(
              key: const Key("Layout Selection default widget"),
            );
          },
        ),
      ),
    );
  }
}
