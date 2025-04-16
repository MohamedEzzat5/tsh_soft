import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/core/widgets/my_default_button.dart';

import '../../../../core/utils/svg_manager.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../injection_container.dart';
import '../widget/order_details_row_widget.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'order_details'.tr,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gaps.vGap16,
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: colors.main.withValues(alpha: 0.2),
                            child: SvgPicture.asset(
                              SvgAssets.shoppingBag,
                              color: colors.main,
                            ),
                          ),
                          Gaps.hGap10,
                          Text(
                            'request_received'.tr,
                            style: TextStyles.semiBold15(),
                          ),
                        ],
                      ),
                      Gaps.vGap16,
                      LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(10),
                        value: 0.25,
                        backgroundColor: colors.borderColor,
                        color: colors.main,
                        minHeight: 5,
                      ),
                      Gaps.vGap16,
                      Row(
                        children: [
                          Expanded(
                            child: MyDefaultButton(
                              onPressed: () {},
                              borderRadius: 20,
                              btnText: 'edit',
                              textColor: colors.main,
                              color: colors.white,
                              svgAsset: SvgAssets.edit,
                            ),
                          ),
                          Gaps.hGap10,
                          Expanded(
                            child: MyDefaultButton(
                              onPressed: () {},
                              borderRadius: 20,
                              btnText: 'cancel',
                              textColor: colors.black,
                              color: colors.white,
                              svgAsset: SvgAssets.cancel,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Gaps.vGap30,
                Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 16.r, horizontal: 16.r),
                  decoration: BoxDecoration(
                    color: colors.backGround,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrderDetailsRowWidget(
                        image: SvgAssets.numberIcon,
                        title: '#26585',
                        titleStyle: TextStyles.semiBold18(
                          color: colors.main,
                        ),
                      ),
                      Gaps.vGap20,
                      OrderDetailsRowWidget(
                        image: SvgAssets.calender,
                        title: '28/06/2024 - 03:23 م',
                      ),
                      Gaps.vGap20,
                      OrderDetailsRowWidget(
                        image: SvgAssets.cityLine,
                        title: 'شارع جمال عبدالناصر - القاهره ',
                      ),
                      Gaps.vGap20,
                      OrderDetailsRowWidget(
                        image: SvgAssets.cashIcon,
                        title: 'كاش',
                      ),
                      Gaps.vGap20,
                      OrderDetailsRowWidget(
                        image: SvgAssets.notesIcon,
                        title: 'التوصيل فى أسرع وقت',
                      ),
                    ],
                  ),
                ),
                Gaps.vGap30,
                Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 16.r, horizontal: 16.r),
                  decoration: BoxDecoration(
                    color: colors.backGround,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'products'.tr,
                        style: TextStyles.semiBold16(color: colors.textColor),
                      ),
                      Gaps.vGap10,
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'اكسسوارات بناتي',
                                style:
                                    TextStyles.semiBold16(color: colors.black),
                              ),
                              Spacer(),
                              Text(
                                '2 x',
                                style:
                                    TextStyles.semiBold16(color: colors.black),
                              ),
                              Gaps.hGap10,
                              Text(
                                '1000 ${'egp'.tr}',
                                style:
                                    TextStyles.semiBold16(color: colors.black),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) => Gaps.vGap10,
                        itemCount: 2,
                      ),
                      Divider(
                        color: colors.borderColor,
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'delivery'.tr,
                            style: TextStyles.semiBold16(color: colors.black),
                          ),
                          Text(
                            '200 ${'egp'.tr}',
                            style: TextStyles.semiBold16(color: colors.black),
                          ),
                        ],
                      ),
                      Divider(
                        color: colors.borderColor,
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'total'.tr,
                            style: TextStyles.semiBold16(color: colors.black),
                          ),
                          Text(
                            '2200 ${'egp'.tr}',
                            style: TextStyles.semiBold16(color: colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Gaps.vGap30,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
