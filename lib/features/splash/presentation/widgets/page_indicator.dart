import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/injection_container.dart';

class PageIndicator extends StatelessWidget {
  final bool isActive;

  const PageIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: isActive ? 10.0.h : 12.0.h,
      width: isActive ? 24.0.w : 12.0.w,
      decoration: BoxDecoration(
        color:
            isActive ? context.colors.main : context.colors.profileDividerColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
    );
  }
}
