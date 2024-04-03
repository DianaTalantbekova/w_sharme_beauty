import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:w_sharme_beauty/resources/app_styles.dart';

import '../../../../resources/app_colors.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.text,
    this.enabled = true,
    this.onTap,
  });

  final String text;
  final bool enabled;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        alignment: Alignment.center,
        width: 394.w,
        height: 47.h,
        decoration: BoxDecoration(
          color: enabled ? AppColors.purple: AppColors.gray,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: AppStyles.helper4.copyWith(
            fontSize: 16.r,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
