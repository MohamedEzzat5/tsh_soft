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
    this.trailing, // ✅ العنصر الجديد هنا
  });

  final String title;
  final String svgIcon;
  final bool? isBackIcon;
  final Color? iconColor;
  final TextStyle? style;
  final VoidCallback onPress;
  final Widget? trailing; // ✅ عنصر إضافي اختياري في اليمين

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.r),
      child: InkWell(
        onTap: onPress,
        child: Row(
          children: [
            SvgPicture.asset(
              svgIcon,
              color: iconColor ?? colors.main,
            ),
            Gaps.hGap16,
            Expanded(
              child: Text(
                title,
                style: style ?? TextStyles.regular16(),
              ),
            ),
            trailing ?? // ✅ لو فيه trailing استخدمه
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
