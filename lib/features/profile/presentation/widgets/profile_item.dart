import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/gaps.dart';
import '../../../../injection_container.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.onPress,
    required this.title,
    required this.svgIcon,
    this.isBackIcon = false,
    this.iconColor,
    this.style,
  });

  final String title;
  final String svgIcon;
  final bool? isBackIcon;
  final Color? iconColor;

  final TextStyle? style;

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.r),
        child: Row(
          children: [
            SvgPicture.asset(
              svgIcon,
              color: iconColor ?? colors.main,
            ),
            Gaps.hGap16,
            Text(
              title,
              style: style ?? TextStyles.regular16(),
            ),
            Spacer(),
            isBackIcon == false
                ? Icon(
                    Icons.chevron_right,
                    size: 30.sp,
                  )
                : Gaps.empty,
          ],
        ),
      ),
    );
  }
}
