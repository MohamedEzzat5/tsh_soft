// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/config/routes/app_routes.dart';
import 'package:tsh_soft/core/params/product_params.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/features/home/presentation/widgets/home_footer.dart';
import 'package:tsh_soft/features/products/presentation/cubit/get_products_cubit/get_products_cubit.dart';
import 'package:tsh_soft/features/products/presentation/widgets/products_grid_view.dart';

import '../widgets/home_categories_list.dart';
import '../widgets/home_header.dart';
import '../widgets/home_section_title.dart';
import '../widgets/home_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<GetProductsCubit>(context)
        .getProducts(params: ProductsParams());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.fromLTRB(
                  16.r,
                  16.r,
                  16.r,
                  80.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeHeader(),
                    Gaps.vGap20,
                    const HomeSlider(),
                    Gaps.vGap20,
                    HomeSectionTitle(
                      title: 'categories',
                      onViewAllTap: () => Navigator.pushNamed(
                        context,
                        Routes.allCatregoryScreenRoute,
                      ),
                    ),
                    const HomeCategoriesList(),
                    Gaps.vGap5,
                    HomeSectionTitle(
                      title: 'newest_orders',
                      onViewAllTap: () => Navigator.pushNamed(
                        context,
                        Routes.productsScreenRoute,
                      ),
                    ),
                    const ProductsGridView(),
                  ],
                ),
              ),
            ),
            GlassFooter(),
          ],
        ),
      ),
    );
  }
}
