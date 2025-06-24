import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/utils/svg_manager.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/core/widgets/my_default_button.dart';
import 'package:tsh_soft/features/profile/domain/entities/profile_entity.dart';
import 'package:tsh_soft/features/profile/presentation/widgets/logout_model_sheet.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/image_manager.dart';
import '../../../../injection_container.dart';
import '../widgets/IconLabelWidget.dart';
import '../widgets/profile_image.dart';
import '../widgets/seitting_widget.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileEntity profileData;
  const ProfileScreen({super.key, required this.profileData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'profile'.tr(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Center(
                child: ProfileImageWidget(profileData: profileData),
              ),
              Gaps.vGap10,
              Container(
                width: ScreenUtil().screenWidth,
                padding: EdgeInsets.symmetric(vertical: 24.r),
                decoration: BoxDecoration(
                  color: context.colors.backGround,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 4.r,
                      offset: Offset(0, 2.r),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.ordersScreenRoute);
                      },
                      child: IconLabelWidget(
                        text: 'my_orders'.tr(context),
                        icon: ImgAssets.myOrdersIcon,
                      ),
                    ),
                    Gaps.hGap12,
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.favoritesScreenRoute);
                      },
                      child: IconLabelWidget(
                        text: 'favorites'.tr(context),
                        icon: ImgAssets.favoriteIcon,
                      ),
                    )
                  ],
                ),
              ),
              Gaps.vGap16,
              SettingWidget(
                profileData: profileData,
              ),
              Gaps.vGap16,
              Center(
                child: MyDefaultButton(
                  width: 0.6.sw,
                  onPressed: () {
                    LogoutModalSheet.show(context);
                  },
                  btnText: 'logout',
                  textColor: context.colors.main,
                  color: context.colors.white,
                  svgAsset: SvgAssets.logout,
                ),
              ),
              Gaps.vGap30,
            ],
          ),
        ),
      ),
    );
  }
}
