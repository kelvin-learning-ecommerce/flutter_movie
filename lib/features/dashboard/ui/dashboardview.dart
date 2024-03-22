import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> with AutomaticKeepAliveClientMixin<DashboardView> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Center(
      child: AnimatedContainer(
        height: 150.h,
        padding: REdgeInsets.all(12),
        decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.all(Radius.circular(12.r))),
        duration: const Duration(seconds: 2),
        child: Column(
          children: [
            const Text(
              "Welcome to Magnus Test Project by Kelvin Prayitno",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 12.h,
            ),
            const Text(
                "You can check these page:\n"
                "Home -> your are here\n"
                "News -> You can search latest News and News Detail\n"
                "Profile -> Your can check your User Login Data & Logout",
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
