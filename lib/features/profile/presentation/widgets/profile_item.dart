import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tsh_soft/core/utils/constants.dart';

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
    this.trailing,
  });

  final String title;
  final String svgIcon;
  final bool? isBackIcon;
  final Color? iconColor;
  final TextStyle? style;
  final VoidCallback onPress;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.r),
      child: InkWell(
        onTap: onPress,
        child: Row(
          children: [
            SvgPicture.asset(svgIcon,
                colorFilter: iconColor != null
                    ? Constants.colorFilter(iconColor!)
                    : Constants.colorFilter(context.colors.main)),
            Gaps.hGap16,
            Expanded(
              child: Text(
                title,
                style: style ?? TextStyles.regular16(),
              ),
            ),
            trailing ?? 
                (isBackIcon == false
                    ? Icon(
                        Icons.chevron_right,
                        size: 30.sp,
                      )
                    : Gaps.empty),
          ],
        ),
      ),
    );
  }
}
