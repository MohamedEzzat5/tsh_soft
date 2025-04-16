import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/gaps.dart';

class IconLabelWidget extends StatelessWidget {
  final String text;
  final String icon;
  const IconLabelWidget({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          icon,
          width: 48.w,
        ),
        Gaps.vGap16,
        Text(
          text,
          style: TextStyles.regular14(),
        ),
      ],
    );
  }
}
