import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preo/utils/constants/colors.dart';
import 'package:preo/utils/constants/sizes.dart';

class FormInputField extends StatefulWidget {
  final String labelText;
  final TextEditingController? controller;

  const FormInputField({
    super.key,
    required this.labelText,
    this.controller,
  });

  @override
  _FormInputFieldState createState() => _FormInputFieldState();
}

class _FormInputFieldState extends State<FormInputField> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Focus(
        onFocusChange: (focus) {
          setState(() {
            isFocused = focus || (widget.controller?.text.isNotEmpty ?? false);
          });
        },
        child: Stack(
          children: [
            TextFormField(
              controller: widget.controller,
              style: TextStyle(fontSize: Sizes.subTitle, color: Colors.black),
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 20 .h),
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide:
                        BorderSide(color: AppColors.neutral400, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide:
                        BorderSide(color: AppColors.neutral400, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide:
                        BorderSide(color: AppColors.neutral400, width: 1.0),
                  )),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              left: 12.w,
              top: isFocused ? 5.h : 22.h, // Moves up slightly when focused
              child: AnimatedDefaultTextStyle(
                duration: Duration(milliseconds: 200),
                style: TextStyle(
                  fontSize: isFocused ? Sizes.subTitle * 0.85 : Sizes.subTitle,
                  color: AppColors.formTextColor,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  color: Colors.transparent,
                  child: Text(widget.labelText),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
