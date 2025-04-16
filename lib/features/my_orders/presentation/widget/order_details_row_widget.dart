import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/gaps.dart';
import '../../../../injection_container.dart';

class OrderDetailsRowWidget extends StatelessWidget {
  final String image;
  final String title;
  final TextStyle? titleStyle;
  const OrderDetailsRowWidget({
    super.key,
    required this.image,
    required this.title,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          image,
          color: colors.main,
        ),
        Gaps.hGap10,
        Text(
          title,
          style: titleStyle ?? TextStyles.semiBold16(color: colors.black),
        ),
      ],
    );
  }
}
