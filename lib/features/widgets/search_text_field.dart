import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final Function(String)? onTextChanged;

  const SearchTextField({Key? key, required this.controller, required this.labelText, this.onTextChanged})
      : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: REdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: REdgeInsets.only(top: 10.h),
                child: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: TextFormField(
                textAlign: TextAlign.center,
                onChanged: (String text) {
                  widget.onTextChanged?.call(text);
                },
                controller: widget.controller,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: widget.labelText,
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
