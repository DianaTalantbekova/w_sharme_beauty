import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../resources/app_colors.dart';
import '../../../../../resources/app_styles.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    this.hasEye = false,
    required this.hintText,
    this.textInputType,
    this.isObscuredText = false,
    required this.controller,
  });

  final bool hasEye;
  final String hintText;
  final TextInputType? textInputType;
  final bool isObscuredText;
  final TextEditingController controller;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late bool isObscuredText = widget.isObscuredText;
  Color suffixColor = AppColors.gray;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      child: Focus(
        onFocusChange: (hasFocus) {},
        child: TextField(
          controller: widget.controller,
          obscureText: isObscuredText,
          keyboardType: widget.textInputType,
          style: AppStyles.helper3,
          decoration: InputDecoration(
            suffixIcon: widget.hasEye
                ? GestureDetector(
              onTap: () {
                setState(() {
                  isObscuredText = !isObscuredText;
                  if (isObscuredText) {
                    suffixColor = Colors.white.withOpacity(0.2);
                    return;
                  }
                  suffixColor = Colors.white;
                });
              },
              child: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                alignment: Alignment.center,
                child: SizedBox(
                  width: 16.w,
                  height: 16.h,
                  child: SvgPicture.asset(
                    'assets/png/icons/closed_eye.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )
                : const SizedBox(),
            fillColor: AppColors.lightGray,
            filled: true,
            hintText: widget.hintText,
            hintStyle: AppStyles.helper1.copyWith(fontSize: 16.r),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none
            ),
          ),
        ),
      ),
    );
  }
}
