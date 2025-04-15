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
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight * 0.8,
          fit: BoxFit.fill,
        ),
        Positioned(
          top: 60,
          left: 20,
          right: 20,
          child: SizedBox(
            width: 200,
            child: RichText(
              textAlign: TextAlign.start,
              maxLines: 2,
              text: TextSpan(
                text: title.tr,
                style: TextStyles.bold28(),
                children: [
                  TextSpan(
                    text: description.tr,
                    style: TextStyle(
                      color: colors.main,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: subDescription.tr,
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
