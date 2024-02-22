import 'package:flutter/material.dart';
import 'package:magnus_flutter_kelvin_prayitno/config/router/navigation_config.dart';

void showSnackBar(context, String value) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(value),
    ),
  );
}
