import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../cubit/tab_cubit.dart';

class TabOrders extends StatelessWidget {
  const TabOrders({
    super.key,
    required this.tabController,
    required this.onTap,
  });

  final TabController tabController;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabCubit, int>(
      builder: (context, selectedIndex) {
        return TabBar(
          indicatorAnimation: TabIndicatorAnimation.elastic,
          controller: tabController,
          physics: const NeverScrollableScrollPhysics(),
          onTap: onTap,
          dividerColor: Colors.transparent,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MyColors.main,
          ),
          labelColor: MyColors.white,
          labelStyle: TextStyles.bold18(color: MyColors.black),
          unselectedLabelColor: MyColors.black.withOpacity(0.5),
          tabs: [
            SizedBox(
                width: ScreenUtil().screenWidth * 0.42,
                child: Tab(
                  text: "current".tr,
                )),
            SizedBox(
                width: ScreenUtil().screenWidth * 0.42,
                child: Tab(text: "previous".tr)),
          ],
        );
      },
    );
  }
}
