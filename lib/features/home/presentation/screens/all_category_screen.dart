import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/widgets/app_image.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/features/home/presentation/cubit/cubit/category_cubit.dart';

class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({super.key});

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoryCubit>(context).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('all_categories'.tr(context)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0.h),
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoadingState) {
              return const ShimmerGridLoader();
            }

            if (state is CategoryFailureState) {
              return Center(child: Text(state.errorMessage));
            }

            if (state is CategorySuccessState) {
              final categories = state.response.data ?? [];

              return GridView.builder(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.w,
                  mainAxisSpacing: 8.h,
                ),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Column(
                    children: [
                      AppImage(
                        imageUrl: category.image ?? '',
                        width: 100.w,
                        height: 80.h,
                        fit: BoxFit.cover,
                        isCached: true,
                      ),
                      Gaps.vGap8,
                      Text(category.name ?? ''),
                    ],
                  );
                },
              );
            }

            return const SizedBox(); // fallback
          },
        ),
      ),
    );
  }
}

class ShimmerGridLoader extends StatelessWidget {
  const ShimmerGridLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
      ),
      itemBuilder: (_, __) => Column(
        children: [
          Container(
            width: 100.w,
            height: 80.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          Gaps.vGap8,
          Container(
            width: 60.w,
            height: 10.h,
            color: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}
