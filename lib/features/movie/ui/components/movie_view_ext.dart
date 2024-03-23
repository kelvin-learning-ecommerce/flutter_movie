import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magnus_flutter_kelvin_prayitno/utils/extensions/routes_ext.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

import '../../../../domain/models/response/movie_response.dart';
import '../../../../utils/constants/key_label.dart';
import '../../../../utils/local_notification/notification_service.dart';
import '../../../../utils/snakebar/snakebar_util.dart';
import '../../../widgets/cached_network_image_utils.dart';

Widget listviewLayout(List<MovieResultResponse> result) {
  return ListView.separated(
      key: movieContentListViewParentKey,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var item = result[index];
        return movieItem(
          context,
          item,
          index + 1,
          key: Key("$movieContentListViewInkwellParentKey - $index"),
        );
      },
      separatorBuilder: (context, index) => const Divider(
            height: 2,
            color: Colors.transparent,
          ),
      itemCount: result.length);
}

Widget gridviewLayout(List<MovieResultResponse> result) {
  return GridView.builder(
    key: movieContentGridViewParent,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.65),
    itemBuilder: (context, index) {
      var item = result[index];
      return movieItem(
        context,
        item,
        index + 1,
        key: Key("$movieContentGridViewInkWellParentKeyLabel - $index"),
      );
    },
    shrinkWrap: true,
    itemCount: result.length,
  );
}

Widget movieItem(BuildContext context, MovieResultResponse item, int index, {Key? key}) => TouchableOpacity(
      key: key,
      onTap: () {
        item.index = index;
        context.goToDetail(item);
      },
      child: Container(
        margin: REdgeInsets.all(10),
        padding: REdgeInsets.only(top: 10),
        decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        child: Stack(
          children: [
            Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: item.title ?? "",
                    child: AppCachedNetworkImage(
                      height: 125.h,
                      width: 100.w,
                      fit: BoxFit.fill,
                      url: 'https://starwars-visualguide.com/assets/img/films/$index.jpg',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Name: ${item.title}",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Released date: ${item.releaseDate}', textAlign: TextAlign.center),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: REdgeInsets.symmetric(horizontal: 10.w),
                child: TouchableOpacity(
                  child: const Icon(Icons.notification_add, color: Colors.redAccent),
                  onTap: () async {
                    showSnackBar(context, "We'll notify you in the next 5 minutes");

                    await notificationService.showScheduledLocalNotification(
                      id: index,
                      title: "${item.title}",
                      body: "Directed by ${item.director}",
                      payload: "${item.episodeId}",
                      seconds: 300,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
