import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/params/order_params.dart';
import 'package:tsh_soft/features/orders/domain/entities/order_entity.dart';
import 'package:tsh_soft/features/orders/presentation/cubit/get_orders_cubit/get_orders_cubit.dart';
import 'package:tsh_soft/features/orders/presentation/widget/recent_orders_list.dart';

import '../cubit/orders_tap_cubit/tab_cubit.dart';
import '../widget/complete_orders_list.dart';
import '../widget/tab_services.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Load pending orders by default
    BlocProvider.of<GetOrdersCubit>(context).getOrders(
      OrderParams(status: 'pending'),
    );
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('my_orders'.tr(context)),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15.w),
            child: Column(
              children: [
                // Tab bar
                BlocBuilder<TabCubit, int>(
                  builder: (context, selectedIndex) {
                    return TabOrders(
                      tabController: _tabController,
                      onTap: (index) {
                        // Update selected tab
                        context.read<TabCubit>().selectTab(index);
                        _tabController.animateTo(index);
                        // Fetch orders for selected status
                        context.read<GetOrdersCubit>().getOrders(
                              OrderParams(
                                status: index == 0 ? 'pending' : 'confirmed',
                              ),
                            );
                      },
                    );
                  },
                ),
                SizedBox(height: 16.h),
                Expanded(
                  child: BlocBuilder<GetOrdersCubit, GetOrdersState>(
                    builder: (context, state) {
                      if (state is GetOrdersLoadingState) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: ListView.builder(
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 12.h),
                                height: 150.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                              );
                            },
                          ),
                        );
                      } else if (state is GetOrdersFailureState) {
                        return Center(
                          child: Text(
                            state.errorMessage,
                            textAlign: TextAlign.center,
                          ),
                        );
                      } else if (state is GetOrdersSuccessState) {
                        final List<OrderEntity> orders =
                            state.resp.data as List<OrderEntity>;
                        return BlocBuilder<TabCubit, int>(
                          builder: (context, selectedIndex) {
                            return TabBarView(
                              controller: _tabController,
                              children: [
                                RecentOrdersListView(orders: orders),
                                CompletedOrdersListView(orders: orders),
                              ],
                            );
                          },
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
