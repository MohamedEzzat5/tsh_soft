import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';

import '../widgets/home_categories_list.dart';
import '../widgets/home_header.dart';
import '../widgets/home_products_grid.dart';
import '../widgets/home_search_bar.dart';
import '../widgets/home_section_title.dart';
import '../widgets/offers_gallery.dart';

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
              Gaps.vGap20,
              const HomeSearchBar(),
              Gaps.vGap20,
              const OffersGallery(),
              Gaps.vGap20,
              const HomeSectionTitle(title: 'Categories'),
              const HomeCategoriesList(),
              Gaps.vGap20,
              const HomeSectionTitle(title: 'Newest Products'),
              const HomeProductsGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
