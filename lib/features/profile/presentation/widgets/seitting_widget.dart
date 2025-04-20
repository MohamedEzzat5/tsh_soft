import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/config/themes/provider/app_theme_provider.dart';
import 'package:tsh_soft/core/utils/constants.dart';
import 'package:tsh_soft/core/utils/enums.dart';
import 'package:tsh_soft/features/profile/presentation/widgets/language_setting_widget.dart';
import 'package:tsh_soft/features/profile/presentation/widgets/profile_item.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/svg_manager.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../injection_container.dart';

class SettingWidget extends ConsumerStatefulWidget {
  const SettingWidget({super.key});

  @override
  ConsumerState<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends ConsumerState<SettingWidget> {
  @override
  Widget build(BuildContext context) {
    final isLight = ref.watch(appThemeProvider);

    return Container(
      width: ScreenUtil().screenWidth,
      padding: EdgeInsets.symmetric(vertical: 16.r, horizontal: 16.r),
      decoration: BoxDecoration(
        color: context.colors.backGround,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(30),
            blurRadius: 4.r,
            offset: Offset(0, 2.r),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'settings'.tr(context),
            style: TextStyles.regular18(
              color: const Color(0xff777777),
            ),
          ),
          ProfileItem(
            onPress: () {
              Navigator.pushNamed(context, Routes.editProfileScreenRoute);
            },
            title: 'edit_account'.tr(context),
            svgIcon: SvgAssets.editProfile,
          ),
          ProfileItem(
            onPress: () {
              Constants.buildCustomShowModel(
                context: context,
                child: const LanguageSettingWidget(),
              );
            },
            title: 'language'.tr(context),
            svgIcon: SvgAssets.language,
          ),
          ProfileItem(
            onPress: () {},
            title: 'dark_mode'.tr(context),
            svgIcon: SvgAssets.language,
            trailing: Switch(
              value: isLight,
              onChanged: (value) {
                ref.read(appThemeProvider.notifier).state = value;
                sharedPreferences.saveAppTheme(
                  value ? Themes.light : Themes.dark,
                );
              },
            ),
          ),
          ProfileItem(
            onPress: () {
              Navigator.pushNamed(context, Routes.contactUsScreenRoute);
            },
            title: 'contactUs'.tr(context),
            svgIcon: SvgAssets.contactus,
          ),
          ProfileItem(
            onPress: () {
              Navigator.pushNamed(context, Routes.aboutUsScreenRoute);
            },
            title: 'about_app'.tr(context),
            svgIcon: SvgAssets.aboutUs,
          ),
          ProfileItem(
            onPress: () {
              Constants.openUrl('https://www.tsh-dev.com/');
            },
            title: 'about_developer'.tr(context),
            svgIcon: SvgAssets.aboutUs,
          ),
          ProfileItem(
            onPress: () {
              Navigator.pushNamed(context, Routes.faqScreenRoute);
            },
            title: 'terms_conditions'.tr(context),
            svgIcon: SvgAssets.terms,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.r),
            child: ProfileItem(
              style: TextStyles.semiBold18(
                color: context.colors.errorColor,
              ),
              iconColor: context.colors.errorColor,
              isBackIcon: true,
              onPress: () {},
              title: 'delete_account'.tr(context),
              svgIcon: SvgAssets.deleteAccount,
            ),
          ),
        ],
      ),
    );
  }
}
