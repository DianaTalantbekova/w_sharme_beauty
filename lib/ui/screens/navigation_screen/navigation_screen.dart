import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:w_sharme_beauty/resources/app_colors.dart';

import '../../../models/image_item.dart';
import '../../../resources/app_styles.dart';
import '../../../utils/image_items.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    final viewInsetsPadding = MediaQuery.of(context).viewPadding.bottom;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(child: widget.child),
            Container(
              height: 56.h,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  imageItems.length,
                  (index) {
                    final item = imageItems[index];
                    return _buildNavigationBarItem(
                      imageItem: item,
                      selected: index == _selected,
                      onTap: () {
                        _selected = index;
                        context.go(item.path);
                      },
                    );
                  },
                ),
              ),
            ),
            // Container(
            //   height: viewInsetsPadding,
            //   color: ThemeHelper.grey,
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationBarItem({
    required ImageItem imageItem,
    bool selected = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 93.w,
        height: 56.h,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 24.r,
              height: 24.r,
              child: Image.asset(
                imageItem.asset,
                fit: BoxFit.cover,
                color: selected ? AppColors.purple : AppColors.gray,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              imageItem.name,
              style: AppStyles.helper1.copyWith(
                color: selected ? AppColors.purple : AppColors.gray,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
