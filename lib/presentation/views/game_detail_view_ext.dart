import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html/parser.dart';

import '../../domain/models/response/game_detail_response.dart';
import '../widgets/cached_network_image_utils.dart';

Widget infoTab(GameDetailResponse detail) {
  var genre = '';
  var platform = '';
  var publisher = '';
  var developer = '';

  detail.genres?.forEach((element) {
    genre += "${element.name}, ";
  });

  detail.platforms?.forEach((element) {
    platform += "${element.platform?.name}, ";
  });

  detail.publishers?.forEach((element) {
    publisher += "${element.name}, ";
  });

  detail.developers?.forEach((element) {
    developer += "${element.name}, ";
  });

  return Center(
    child: ListView(
      shrinkWrap: true,
      children: [
        Text("Description: ${parse(detail.descriptionRaw).documentElement?.text}"),
        SizedBox(
          height: 5.h,
        ),
        Text("Genre: $genre"),
        SizedBox(
          height: 5.h,
        ),
        Text("Platforms: $platform"),
        SizedBox(
          height: 5.h,
        ),
        Text("Publishers: $publisher"),
        SizedBox(
          height: 5.h,
        ),
        Text("Developers: $developer"),
      ],
    ),
  );
}

Widget screenshotTab(GameDetailResponse detail) {
  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      children: [
        SizedBox(
          height: 200.h,
          child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, pos) {
                var tag = detail.tags ?? [];
                return AppCachedNetworkImage(
                  height: 100.h,
                  width: 200.w,
                  url: tag[pos].imageBackground ?? '',
                );
              },
              separatorBuilder: (context, index) => Container(
                    width: 10.w,
                  ),
              itemCount: detail.tags?.length ?? 0),
        )
      ],
    ),
  );
}
