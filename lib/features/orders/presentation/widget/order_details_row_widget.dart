import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tsh_soft/core/utils/constants.dart';

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
          colorFilter: Constants.colorFilter(
            context.colors.main,
          ),
        ),
        Gaps.hGap10,
        Expanded(
          child: Text(
            title,
            style: titleStyle ?? TextStyles.semiBold16(),
          ),
        ),
      ],
    );
  }
}
