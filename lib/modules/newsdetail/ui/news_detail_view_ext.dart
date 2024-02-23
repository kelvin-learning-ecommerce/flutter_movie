import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magnus_flutter_kelvin_prayitno/domain/models/response/news_response.dart';

class InfoTab extends StatefulWidget {
  final NewsArticles? detail;

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
          "Author: ${widget.detail?.author}",
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          "Source: ${widget.detail?.source?.name}",
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          "Published At: ${widget.detail?.publishedAt}",
        ),
        SizedBox(
          height: 25.h,
        ),
        Text(
          widget.detail?.description ?? "",
          textAlign: TextAlign.justify,
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          widget.detail?.content ?? "",
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}

class LinkTab extends StatelessWidget {
  final NewsArticles? detail;

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
