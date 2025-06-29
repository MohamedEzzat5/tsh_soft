import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/injection_container.dart';

import '../../../../core/utils/values/text_styles.dart';
import '../cubit/orders_tap_cubit/tab_cubit.dart';

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
          onTap: onTap,
          dividerColor: Colors.transparent,
          physics: const BouncingScrollPhysics(),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: context.colors.main,
          ),
          labelColor: context.colors.white,
          labelStyle: TextStyles.bold18(),
          // unselectedLabelColor: ,
          tabs: [
            SizedBox(
                width: ScreenUtil().screenWidth * 0.42,
                child: Tab(
                  text: "current".tr(context),
                )),
            SizedBox(
                width: ScreenUtil().screenWidth * 0.42,
                child: Tab(text: "previous".tr(context))),
          ],
        );
      },
    );
  }
}
