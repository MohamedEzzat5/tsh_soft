import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tsh_soft/core/utils/constants.dart';
import 'package:tsh_soft/core/utils/svg_manager.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';
import 'package:tsh_soft/injection_container.dart';

class QuantitySelector extends StatelessWidget {
  final int counter;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantitySelector({
    super.key,
    required this.counter,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: onDecrement,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colors.secondaryColor,
              ),
              child: SvgPicture.asset(
                SvgAssets.minus,
                fit: BoxFit.none,
                height: 50.h,
                width: 50.h,
                colorFilter: Constants.colorFilter(context.colors.black),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.center,
            height: 50.h,
            decoration: BoxDecoration(
              color: context.colors.backGround,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Text('$counter', style: TextStyles.bold14()),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: onIncrement,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.colors.secondaryColor,
              ),
              child: SvgPicture.asset(
                SvgAssets.plus,
                fit: BoxFit.none,
                height: 50.h,
                width: 50.h,
                colorFilter: Constants.colorFilter(context.colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
