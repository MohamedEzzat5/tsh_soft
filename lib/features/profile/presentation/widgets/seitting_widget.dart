import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/utils/constants.dart';
import 'package:tsh_soft/features/profile/presentation/widgets/language_setting_widget.dart';
import 'package:tsh_soft/features/profile/presentation/widgets/profile_item.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/svg_manager.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/gaps.dart';
import '../../../../injection_container.dart';

class SettingWidget extends StatelessWidget {
  const SettingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      padding: EdgeInsets.symmetric(vertical: 16.r, horizontal: 16.r),
      decoration: BoxDecoration(
        color: colors.backGround,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4.r,
            offset: Offset(0, 2.r),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'settings'.tr,
            style: TextStyles.regular16(
              color: Color(0xff777777),
            ),
          ),
          Gaps.vGap16,
          ProfileItem(
            onPress: () {
              Navigator.pushNamed(context, Routes.editProfileScreenRoute);
            },
            title: 'edit_account'.tr,
            svgIcon: SvgAssets.editProfile,
          ),
          ProfileItem(
            onPress: () {
              Constants.buildCustomShowModel(
                  context: context, child: LanguageSettingWidget());
            },
            title: 'language'.tr,
            svgIcon: SvgAssets.language,
          ),
          ProfileItem(
            onPress: () {
              Navigator.pushNamed(context, Routes.contactUsScreenRoute);
            },
            title: 'contactUs'.tr,
            svgIcon: SvgAssets.contactus,
          ),
          ProfileItem(
            onPress: () {
              Navigator.pushNamed(context, Routes.aboutUsScreenRoute);
            },
            title: 'about_app'.tr,
            svgIcon: SvgAssets.aboutUs,
          ),
          ProfileItem(
            onPress: () {
              Navigator.pushNamed(context, Routes.faqScreenRoute);
            },
            title: 'terms_conditions'.tr,
            svgIcon: SvgAssets.terms,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.r),
            child: ProfileItem(
              style: TextStyles.semiBold18(
                color: colors.errorColor,
              ),
              iconColor: colors.errorColor,
              isBackIcon: true,
              onPress: () {},
              title: 'delete_account'.tr,
              svgIcon: SvgAssets.deleteAccount,
            ),
          ),
        ],
      ),
    );
  }
}
