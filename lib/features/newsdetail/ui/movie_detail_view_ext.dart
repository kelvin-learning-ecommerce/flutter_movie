import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/models/response/movie_response.dart';

class InfoTab extends StatefulWidget {
  final MovieResultResponse? detail;

  const InfoTab({Key? key, required this.detail}) : super(key: key);

  @override
  State<InfoTab> createState() => _InfoTabState();
}

class _InfoTabState extends State<InfoTab> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Text(
          "Author: ${widget.detail?.openingCrawl}",
        ),
        SizedBox(
          height: 8.h,
        ),
      ],
    );
  }
}

class LinkTab extends StatelessWidget {
  final MovieResultResponse? detail;

  const LinkTab({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(16),
      child: Center(
        child: Text(
          "${detail?.url}",
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
        ),
      ),
    );
  }
}
