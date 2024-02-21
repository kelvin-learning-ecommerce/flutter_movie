import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

PreferredSizeWidget? appBar({required String title, bool showBackButton = false}) => AppBar(
      title: Text(title),
      automaticallyImplyLeading: showBackButton,
      titleSpacing: 00.0,
      centerTitle: true,
      toolbarHeight: 60.2,
      toolbarOpacity: 0.8,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
      ),
      elevation: 0.00,
      backgroundColor: Colors.blueAccent[100],
    );
