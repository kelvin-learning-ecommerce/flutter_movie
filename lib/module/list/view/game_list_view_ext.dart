import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/module/list/model/game_list_model.dart';

Widget listviewLayout(List<GameListData> result) {
  return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var item = result[index];
        return Column(
          children: [Text(item.name)],
        );
      },
      separatorBuilder: (context, index) => const Divider(
            height: 2,
            color: Colors.transparent,
          ),
      itemCount: result.length);
}

Widget gridviewLayout(List<GameListData> result) {
  return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var item = result[index];
        return Column(
          children: [Text(item.name)],
        );
      },
      separatorBuilder: (context, index) => const Divider(
            height: 2,
            color: Colors.transparent,
          ),
      itemCount: result.length);
}
