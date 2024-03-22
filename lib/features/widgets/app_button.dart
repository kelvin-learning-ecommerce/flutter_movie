import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Function function;

  const AppButton({Key? key, required this.label, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: () {
        function.call();
      },
      child: Container(
          padding: REdgeInsets.symmetric(vertical: 16.h),
          width: 150.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
              color: Colors.white,
              border: Border.all(color: Colors.blue)),
          child: Center(child: Text(label))),
    );
  }
}
