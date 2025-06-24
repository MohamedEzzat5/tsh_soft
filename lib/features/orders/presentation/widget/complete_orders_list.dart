import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/utils/constants.dart';
import 'package:tsh_soft/features/orders/domain/entities/order_entity.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/svg_manager.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/gaps.dart';
import '../../../../injection_container.dart';

class CompletedOrdersListView extends StatelessWidget {
  final List<OrderEntity> orders;

  const CompletedOrdersListView({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return orders.isEmpty
        ? Center(
            child: Text(
            'no_orders'.tr(context),
            style: TextStyles.regular16(),
          ))
        : ListView.separated(
            separatorBuilder: (context, index) => Gaps.vGap16,
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];

              final DateTime parsedDate = DateTime.parse(order.createdAt!);

              final String? formattedDate =
                  DateFormat('yyyy-MM-dd').format(parsedDate);

              final String? formattedTime =
                  DateFormat('hh:mm a').format(parsedDate);
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.orderDetailsScreenRoute,
                    arguments: order,
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
                            '#${order.id}',
                            style: TextStyles.regular14(),
                          ),
                          Text(
                            'details'.tr(context),
                            style: TextStyles.regular14(),
                          ),
                        ],
                      ),
                      Gaps.vGap16,
                      Row(
                        children: [
                          SvgPicture.asset(
                            SvgAssets.calender,
                            colorFilter:
                                Constants.colorFilter(context.colors.main),
                          ),
                          Gaps.hGap10,
                          Text(
                            formattedDate ?? '',
                            style: TextStyles.semiBold16(),
                          ),
                          Gaps.hGap50,
                          SvgPicture.asset(
                            SvgAssets.clock,
                            colorFilter:
                                Constants.colorFilter(context.colors.main),
                          ),
                          Gaps.hGap10,
                          Text(
                            formattedTime ?? '',
                            style: TextStyles.semiBold16(),
                          ),
                        ],
                      ),
                      Gaps.vGap16,
                      Row(
                        children: [
                          SvgPicture.asset(
                            SvgAssets.cityLine,
                            colorFilter:
                                Constants.colorFilter(context.colors.main),
                          ),
                          Gaps.hGap10,
                          Text(
                            "${order.address?.city ?? ''} - ${order.address?.area ?? ''}",
                            style: TextStyles.regular14(),
                          ),
                        ],
                      ),
                      Gaps.vGap16,
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.r, horizontal: 16.r),
                            decoration: BoxDecoration(
                              // color: context.colors.white,
                              borderRadius: BorderRadius.circular(15.r),
                              border: Border.all(
                                color: context.colors.borderColor,
                              ),
                            ),
                            child: Text(
                              'request_completed'.tr(context),
                              style: TextStyles.semiBold16(
                                  color: context.colors.main),
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
