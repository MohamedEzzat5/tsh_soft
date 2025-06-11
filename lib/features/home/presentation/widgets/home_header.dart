import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/utils/constants.dart';
import 'package:tsh_soft/core/utils/svg_manager.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/features/profile/domain/entities/profile_entity.dart';
import 'package:tsh_soft/features/profile/presentation/cubit/profile_cubit/profile_cubit.dart';
import 'package:tsh_soft/injection_container.dart';

import '../../../../config/routes/app_routes.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  @override
  void initState() {
    BlocProvider.of<ProfileCubit>(context).getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoadingState) {
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      Gaps.hGap8,
                      Column(
                        children: [
                          Container(
                            width: 60.w,
                            height: 10.h,
                            color: Colors.white,
                          ),
                          Gaps.vGap2,
                          Container(
                            width: 60.w,
                            height: 10.h,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is ProfileSuccessState) {
              final ProfileEntity profileData =
                  state.response.data as ProfileEntity;
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.profileScreenRoute,
                    arguments: profileData,
                  );
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      SvgAssets.homeAppBarIcon,
                      colorFilter: Constants.colorFilter(context.colors.main),
                    ),
                    Gaps.hGap8,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('welcome'.tr(context),
                            style: TextStyles.regular14()),
                        Text(profileData.name ?? '',
                            style: TextStyles.bold14()),
                      ],
                    ),
                  ],
                ),
              );
            } else if (state is ProfileFailureState) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.loginScreenRoute,             
                  );
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      SvgAssets.homeAppBarIcon,
                      colorFilter: Constants.colorFilter(context.colors.main),
                    ),
                    Gaps.hGap8,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('welcome'.tr(context),
                            style: TextStyles.regular14()),
                        Text('login', style: TextStyles.bold14()),
                      ],
                    ),
                  ],
                ),
              );
            }
            return SizedBox();
          },
        ),
        Row(
          children: [
            InkWell(
                onTap: () => Navigator.pushNamed(
                      context,
                      Routes.notificationScreenRoute,
                    ),
                child: _buildIcon(SvgAssets.notificationIcon, context)),
            Gaps.hGap8,
            InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, Routes.cartScreenRoute),
                child: _buildIcon(SvgAssets.cartIcon, context)),
          ],
        ),
      ],
    );
  }

  Widget _buildIcon(String asset, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: context.colors.secondaryColor.withAlpha(80),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: SvgPicture.asset(
        asset,
        colorFilter: Constants.colorFilter(context.colors.main),
      ),
    );
  }
}
