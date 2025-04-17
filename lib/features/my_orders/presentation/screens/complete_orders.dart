import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/svg_manager.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/gaps.dart';
import '../../../../injection_container.dart';

class CompletedOrders extends StatelessWidget {
  const CompletedOrders({super.key});

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
              Routes.orderDetailsRoute,
            );
          },
          child: Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: colors.backGround,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '#26585',
                      style: TextStyles.regular14(color: colors.main),
                    ),
                    Text(
                      'details'.tr,
                      style: TextStyles.regular14(color: colors.main),
                    ),
                  ],
                ),
                Gaps.vGap16,
                Row(
                  children: [
                    SvgPicture.asset(
                      SvgAssets.calender,
                      color: colors.black,
                    ),
                    Gaps.hGap10,
                    Text(
                      '12/12/2023',
                      style: TextStyles.semiBold16(color: colors.black),
                    ),
                    Gaps.hGap50,
                    SvgPicture.asset(
                      SvgAssets.clock,
                      color: colors.black,
                    ),
                    Gaps.hGap10,
                    Text(
                      '03:23 م',
                      style: TextStyles.semiBold16(color: colors.black),
                    ),
                  ],
                ),
                Gaps.vGap16,
                Row(
                  children: [
                    SvgPicture.asset(
                      SvgAssets.cityLine,
                      color: colors.black,
                    ),
                    Gaps.hGap10,
                    Text(
                      'شارع جمال عبدالناصر - القاهره ',
                      style: TextStyles.regular14(color: colors.black),
                    ),
                  ],
                ),
                Gaps.vGap16,
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.r, horizontal: 16.r),
                      decoration: BoxDecoration(
                        color: colors.white,
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(
                          color: colors.borderColor,
                        ),
                      ),
                      child: Text(
                        'request_completed'.tr,
                        style: TextStyles.semiBold16(color: colors.main),
                      ),
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
