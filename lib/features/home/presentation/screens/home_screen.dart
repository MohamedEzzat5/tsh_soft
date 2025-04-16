import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/config/routes/app_routes.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/features/products/presentation/widgets/products_grid_view.dart';

import '../widgets/home_categories_list.dart';
import '../widgets/home_gallery.dart';
import '../widgets/home_header.dart';
import '../widgets/home_section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.vGap20,
              const HomeHeader(),
              // Gaps.vGap20,
              // const HomeSearchBar(),
              Gaps.vGap20,
              const HomeGallery(),
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
                  Routes.allOrdersScreenRoute,
                ),
              ),
              const ProductsGridView(),
            ],
          ),
        ),
      ),
    );
  }
}
