import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/utils/constants.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/svg_manager.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/gaps.dart';
import '../../../../injection_container.dart';

class RecentOrdersListView extends StatelessWidget {
  const RecentOrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => Gaps.vGap16,
      itemCount: 2,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.orderDetailsScreenRoute,
            );
          },
          child: Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: context.colors.backGround,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '#26585',
                      style: TextStyles.regular14(color: context.colors.main),
                    ),
                    Text(
                      'details'.tr(context),
                      style: TextStyles.regular14(color: context.colors.main),
                    ),
                  ],
                ),
                Gaps.vGap16,
                Row(
                  children: [
                    SvgPicture.asset(
                      SvgAssets.calender,
                      colorFilter: Constants.colorFilter(
                        context.colors.main,
                      ),
                    ),
                    Gaps.hGap10,
                    Text(
                      '12/12/2023',
                      style: TextStyles.semiBold16(),
                    ),
                    Gaps.hGap50,
                    SvgPicture.asset(
                      SvgAssets.clock,
                     colorFilter: Constants.colorFilter(
                        context.colors.main,
                      ),
                    ),
                    Gaps.hGap10,
                    Text(
                      '03:23 م',
                      style: TextStyles.semiBold16(),
                    ),
                  ],
                ),
                Gaps.vGap16,
                Row(
                  children: [
                    SvgPicture.asset(
                      SvgAssets.cityLine,
                      colorFilter: Constants.colorFilter(context.colors.main),
                    ),
                    Gaps.hGap10,
                    Text(
                      'شارع جمال عبدالناصر - القاهره ',
                      style: TextStyles.regular14(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
