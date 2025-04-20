import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';

import '../../../../core/utils/image_manager.dart';
import '../../../../core/utils/svg_manager.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../injection_container.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'terms_conditions'.tr(context),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.vGap25,
                Center(
                  child: Image.asset(
                    ImgAssets.logo,
                    height: 135.h,
                  ),
                ),
                Gaps.vGap40,
                Row(
                  children: [
                    SvgPicture.asset(
                      SvgAssets.about_us,
                      height: 33.h,
                      color: colors.main,
                    ),
                    Gaps.hGap8,
                    Text(
                      'terms_conditions'.tr(context),
                      style: TextStyles.bold20(color: colors.main),
                    )
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'about_message'.tr(context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
