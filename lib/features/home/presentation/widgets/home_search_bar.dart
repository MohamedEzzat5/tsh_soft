// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/injection_container.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: colors.white.withOpacity(.3),
        border: Border.all(color: colors.buttonColor),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: colors.buttonColor, size: 28.r),
          Gaps.hGap8,
          Text('search'.tr, style: TextStyles.regular12()),
        ],
      ),
    );
  }
}
