import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/module/detail/model/game_detail_args.dart';
import 'package:flutter_coding_challenge/module/list/model/game_list_model.dart';
import 'package:flutter_coding_challenge/utils/routes_ext.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/cached_network_image_utils.dart';

Widget listviewLayout(ScrollController scrollController, List<GameListData> result) {
  return ListView.separated(
      controller: scrollController,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var item = result[index];
        return InkWell(
          onTap: () => context.goToDetail(GameDetailArgs(item.name ?? '', item.id ?? 0).toJson()),
          child: Container(
            margin: REdgeInsets.all(10),
            padding: REdgeInsets.only(top: 10),
            decoration: BoxDecoration(shape: BoxShape.rectangle, border: Border.all(color: Colors.blueAccent)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppCachedNetworkImage(
                  height: 75.h,
                  width: 150.w,
                  fit: BoxFit.contain,
                  url: item.backgroundImage ?? '',
                ),
                const SizedBox(
                  height: 10,
                ),
                Text("Name: ${item.name}"),
                const SizedBox(
                  height: 10,
                ),
                Text('Released date: ${item.released}'),
                const SizedBox(
                  height: 10,
                ),
                Text("Metacritic Score : ${item.metaCritic}"),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(
            height: 2,
            color: Colors.transparent,
          ),
      itemCount: result.length);
}

Widget gridviewLayout(ScrollController scrollController, List<GameListData> result) {
  return GridView.builder(
    controller: scrollController,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemBuilder: (_, index) {
      var item = result[index];
      return Column(
        children: [Text(item.name ?? 'game name')],
      );
    },
    shrinkWrap: true,
    itemCount: result.length,
  );
}
