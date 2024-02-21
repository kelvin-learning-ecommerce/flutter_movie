import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> with AutomaticKeepAliveClientMixin<DashboardView> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container();
  }

  @override
  bool get wantKeepAlive => true;
}
