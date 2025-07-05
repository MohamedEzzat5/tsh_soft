import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/utils/constants.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/features/cart/domain/entities/cart_entity.dart';
import 'package:tsh_soft/features/orders/domain/entities/order_entity.dart';

import '../../../../core/utils/svg_manager.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../injection_container.dart';
import '../widget/order_details_row_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  final OrderEntity order;
  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final DateTime parsedDate = DateTime.parse(order.createdAt!);
    final String? formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
    final String? formattedTime = DateFormat('hh:mm a').format(parsedDate);
    final List<CartItemEntity> items =
        order.cart?.items as List<CartItemEntity>;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'order_details'.tr(context),
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
                            backgroundColor:
                                context.colors.main.withValues(alpha: 0.2),
                            child: SvgPicture.asset(
                              SvgAssets.shoppingBag,
                              colorFilter: Constants.colorFilter(
                                context.colors.main,
                              ),
                            ),
                          ),
                          Gaps.hGap10,
                          Text(
                            'request_received'.tr(context),
                            style: TextStyles.semiBold15(),
                          ),
                        ],
                      ),
                      Gaps.vGap16,
                      LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(10),
                        value: 0.25,
                        backgroundColor: context.colors.borderColor,
                        color: context.colors.main,
                        minHeight: 5,
                      ),
                      // Gaps.vGap16,
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: MyDefaultButton(
                      //         onPressed: () {},
                      //         borderRadius: 20,
                      //         btnText: 'edit',
                      //         textColor: context.colors.main,
                      //         color: context.colors.white,
                      //         svgAsset: SvgAssets.edit,
                      //       ),
                      //     ),
                      //     Gaps.hGap10,
                      //     Expanded(
                      //       child: MyDefaultButton(
                      //         onPressed: () {},
                      //         borderRadius: 20,
                      //         btnText: 'cancel',
                      //         textColor: context.colors.black,
                      //         color: context.colors.white,
                      //         svgAsset: SvgAssets.cancel,
                      //       ),
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                ),
                Gaps.vGap30,
                Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 16.r, horizontal: 16.r),
                  decoration: BoxDecoration(
                    color: context.colors.backGround,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrderDetailsRowWidget(
                        image: SvgAssets.numberIcon,
                        title: '#${order.id}',
                        titleStyle: TextStyles.semiBold18(
                          color: context.colors.main,
                        ),
                      ),
                      Gaps.vGap20,
                      OrderDetailsRowWidget(
                        image: SvgAssets.calender,
                        title: '$formattedDate - $formattedTime',
                      ),
                      Gaps.vGap20,
                      OrderDetailsRowWidget(
                        image: SvgAssets.cityLine,
                        title:
                            '${order.address?.city ?? ''} - ${order.address?.area ?? ''} - ${order.address?.details ?? ''}',
                      ),
                      Gaps.vGap20,
                      OrderDetailsRowWidget(
                        image: SvgAssets.cashIcon,
                        title: "cach_on_delivery".tr(context),
                      ),
                      Gaps.vGap20,
                      OrderDetailsRowWidget(
                        image: SvgAssets.notesIcon,
                        title: order.note ?? '',
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
                    color: context.colors.backGround,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'products'.tr(context),
                        style: TextStyles.semiBold16(
                            color: context.colors.textColor),
                      ),
                      Gaps.vGap10,
                      ListView.separated(
                        separatorBuilder: (context, index) => Gaps.vGap10,
                        itemCount: items.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final CartProductEntity product =
                              items[index].product as CartProductEntity;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                product.name ?? '',
                                style: TextStyles.semiBold16(),
                              ),
                              Spacer(),
                              Text(
                                '${items[index].quantity} x',
                                style: TextStyles.semiBold16(),
                              ),
                              Gaps.hGap10,
                              Text(
                                '${items[index].price} ${'egp'.tr(context)}',
                                style: TextStyles.semiBold16(),
                              ),
                            ],
                          );
                        },
                      ),
                      Divider(
                        color: context.colors.borderColor,
                        height: 30.h,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       'delivery'.tr(context),
                      //       style: TextStyles.semiBold16(),
                      //     ),
                      //     Text(
                      //       '200 ${'egp'.tr(context)}',
                      //       style: TextStyles.semiBold16(),
                      //     ),
                      //   ],
                      // ),
                      Divider(
                        color: context.colors.borderColor,
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'total'.tr(context),
                            style: TextStyles.semiBold16(),
                          ),
                          Text(
                            '${order.total} ${'egp'.tr(context)}',
                            style: TextStyles.semiBold16(),
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
