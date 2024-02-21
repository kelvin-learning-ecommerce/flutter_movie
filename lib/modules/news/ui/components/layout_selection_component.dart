import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magnus_flutter_kelvin_prayitno/modules/news/bloc/news_bloc.dart';

import '../../events/news_event.dart';
import '../../states/news_state.dart';

class LayoutSelectionComponent extends StatelessWidget {
  const LayoutSelectionComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(10),
      child: InkWell(
        key: const Key("GameListChangeLayoutEvent"),
        onTap: () {
          newsBloc?.add(const NewsChangeLayoutEvent());
        },
        child: BlocBuilder<NewsBloc, NewsState>(
          buildWhen: (prev, state) => state is NewsStateLayoutType,
          builder: (context, state) {
            if (state is NewsStateLayoutType) {
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
