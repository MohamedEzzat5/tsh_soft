import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/injection_container.dart';

class HomeSectionTitle extends StatelessWidget {
  final String title;
  final Function() onViewAllTap;

  const HomeSectionTitle(
      {super.key, required this.title, required this.onViewAllTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title.tr(context), style: TextStyles.regular18()),
        TextButton(
          onPressed: onViewAllTap,
          child: Row(
            children: [
              Text('view_all'.tr(context),
                  style: TextStyles.regular14(color: context.colors.main)),
              Gaps.hGap4,
              Icon(Icons.arrow_forward_ios_rounded,
                  size: 12.r, color: context.colors.main),
            ],
          ),
        ),
      ],
    );
  }
}
