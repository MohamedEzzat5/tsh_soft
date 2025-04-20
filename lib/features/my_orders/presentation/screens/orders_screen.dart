import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/features/my_orders/presentation/widget/recent_orders_list.dart';

import '../cubit/tab_cubit.dart';
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
                BlocBuilder<TabCubit, int>(
                  builder: (context, selectedIndex) {
                    return TabOrders(
                      tabController: _tabController,
                      onTap: (index) {
                        BlocProvider.of<TabCubit>(context).selectTab(index);
                      },
                    );
                  },
                ),
                SizedBox(height: 16.h),
                Expanded(
                  child: BlocBuilder<TabCubit, int>(
                    builder: (context, selectedIndex) {
                      return TabBarView(
                        controller: _tabController,
                        children: [
                          RecentOrdersListView(),
                          CompletedOrdersListView(),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
