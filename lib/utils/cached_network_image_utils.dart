import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class AppCachedNetworkImage extends StatefulWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double borderRadius;
  final BoxShape boxShape;
  final bool isProfPic;

  const AppCachedNetworkImage(
      {Key? key,
      required this.url,
      this.width,
      this.height,
      this.fit = BoxFit.cover,
      this.borderRadius = 2,
      this.boxShape = BoxShape.rectangle,
      this.isProfPic = false})
      : super(key: key);

  @override
  State<AppCachedNetworkImage> createState() => _AppCachedNetworkImageState();
}

class _AppCachedNetworkImageState extends State<AppCachedNetworkImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.url,
      width: widget.width,
      height: widget.height,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
            shape: widget.boxShape,
            color: Colors.transparent,
            borderRadius: widget.boxShape == BoxShape.circle
                ? null
                : BorderRadius.circular(widget.borderRadius),
            image: DecorationImage(
              image: imageProvider,
              fit: widget.fit,
            )),
      ),
      errorWidget: (context, url, error) {
        return Text(S.of(context).image_unavailable);
      },
      placeholder: (context, url) => const Center(
        child:
            SizedBox(height: 30, width: 30, child: CircularProgressIndicator()),
      ),
    );
  }
}
