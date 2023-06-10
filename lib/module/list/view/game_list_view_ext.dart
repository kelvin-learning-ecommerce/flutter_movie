import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/module/detail/model/game_detail_args.dart';
import 'package:flutter_coding_challenge/module/list/model/game_list_model.dart';
import 'package:flutter_coding_challenge/utils/routes_ext.dart';

Widget listviewLayout(List<GameListData> result) {
  return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var item = result[index];
        return InkWell(
          onTap: () => context.goToDetail(GameDetailArgs(item.name ?? '').toJson()),
          child: Column(
            children: [Text(item.name ?? 'game name')],
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(
            height: 2,
            color: Colors.transparent,
          ),
      itemCount: result.length);
}

Widget gridviewLayout(List<GameListData> result) {
  return GridView.builder(
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
