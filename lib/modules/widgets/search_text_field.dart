import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String labelText;
  final String? errorMessage;

  const SearchTextField(
      {Key? key,
      required this.controller,
      this.isPassword = false,
      required this.labelText,
      this.errorMessage})
      : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200.w,
        margin: REdgeInsets.only(bottom: 12.h),
        child: TextFormField(
          controller: widget.controller,
          cursorColor: Colors.black,
          maxLength: 20,
          obscureText: !isPasswordVisible && widget.isPassword,
          decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: const TextStyle(
              color: Colors.grey,
            ),
            errorText: widget.errorMessage,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  )
                : null,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF6200EE)),
            ),
          ),
        ),
      ),
    );
  }
}
