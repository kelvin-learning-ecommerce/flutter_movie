import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/game_list_bloc.dart';
import '../../events/game_list_event.dart';
import '../../states/game_list_state.dart';

class LayoutSelectionComponent extends StatelessWidget {
  const LayoutSelectionComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              return Text("${state.layoutType?.name.toLowerCase()}", key: const Key("Layout Selection Info"));
            }

            return Container();
          },
        ),
      ),
    );
  }
}
