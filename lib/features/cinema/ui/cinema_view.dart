import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/models/mock/cinema_loc_mock.dart';
import 'package:touchable_opacity/touchable_opacity.dart';
import 'package:url_launcher/url_launcher.dart';

class CinemaView extends StatefulWidget {
  const CinemaView({Key? key}) : super(key: key);

  @override
  State<CinemaView> createState() => _CinemaViewState();
}

class _CinemaViewState extends State<CinemaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cinemaViewContent(),
    );
  }
}

Widget cinemaViewContent() {
  return ListView.separated(
      key: const Key("Movie Content Component ListView"),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var item = cinemasLocation[index];
        return Container(
          margin: REdgeInsets.all(10),
          padding: REdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
          child: TouchableOpacity(
            onTap: () async {
              final uri = Uri(
                  scheme: "google.navigation",
                  // host: '"0,0"',  {here we can put host}
                  queryParameters: {
                    'q': '${item.latitude}, ${item.longitude}'
                  });
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              } else {
                debugPrint('An error occurred');
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on_outlined),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
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
      itemCount: cinemasLocation.length);
}
