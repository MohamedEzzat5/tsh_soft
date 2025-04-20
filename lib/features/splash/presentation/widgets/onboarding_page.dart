import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';
import 'package:tsh_soft/injection_container.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String subDescription;
  final String imageAsset;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.imageAsset,
    required this.subDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imageAsset,
          width: 1.sw,
          height: 0.85.sh,
          fit: BoxFit.fill,
        ),
        Positioned(
          top: 60.h,
          left: 20.w,
          right: 20.w,
          child: SizedBox(
            width: 1.sw - 40.w,
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "${title.tr(context)} ",
                    style: TextStyles.bold28(),
                  ),
                  TextSpan(
                    text: description.tr(context),
                    style: TextStyles.bold20(color: context.colors.main),
                  ),
                  if (subDescription.isNotEmpty)
                    TextSpan(
                      text: subDescription.tr(context),
                      style: TextStyles.regular22(),
                    ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
