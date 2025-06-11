import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tsh_soft/core/widgets/app_image.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/features/home/presentation/cubit/cubit/category_cubit.dart';

class HomeCategoriesList extends StatefulWidget {
  const HomeCategoriesList({super.key});

  @override
  State<HomeCategoriesList> createState() => _HomeCategoriesListState();
}

class _HomeCategoriesListState extends State<HomeCategoriesList> {
  @override
  void initState() {
    BlocProvider.of<CategoryCubit>(context).getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoadingState) {
          return const ShimmerList();
        }

        if (state is CategoryFailureState) {
          return Center(child: Text(state.errorMessage));
        }

        if (state is CategorySuccessState) {
          final categories = state.response.data;

          return SizedBox(
            height: 140.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: categories?.length ?? 0,
              separatorBuilder: (context, _) => Gaps.hGap12,
              itemBuilder: (context, index) {
                final item = categories![index];
                return Column(
                  children: [
                    AppImage(
                      imageUrl: item.image ?? '',
                      width: 100.w,
                      height: 80.h,
                      fit: BoxFit.cover,
                      isCached: true,
                    ),
                    Gaps.vGap8,
                    Text(item.name ?? ''),
                  ],
                );
              },
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        separatorBuilder: (_, __) => Gaps.hGap12,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Column(
              children: [
                Container(
                  width: 100.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                Gaps.vGap8,
                Container(
                  width: 60.w,
                  height: 10.h,
                  color: Colors.white,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
