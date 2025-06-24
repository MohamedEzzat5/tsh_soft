// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/params/product_params.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/features/home/domain/entities/category_entity.dart';
import 'package:tsh_soft/features/home/presentation/cubit/category_cubit/category_cubit.dart';
import 'package:tsh_soft/features/products/presentation/cubit/get_products_cubit/get_products_cubit.dart';
import 'package:tsh_soft/features/products/presentation/cubit/select_product_filter/select_filter_cubit.dart';
import 'package:tsh_soft/features/products/presentation/widgets/filter_item.dart';
import 'package:tsh_soft/injection_container.dart';

class FilterListWidget extends StatelessWidget {
  const FilterListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      color: context.colors.secondaryColor.withAlpha(120 * 255),
      child: Row(
        children: [
          BlocBuilder<SelectProductFilterCubit, int>(
            builder: (context, selectedIndex) {
              bool isAllSelected = selectedIndex == -1;
              return InkWell(
                onTap: () {
                  context.read<SelectProductFilterCubit>().selectItem(-1);
                  BlocProvider.of<GetProductsCubit>(context)
                      .getProducts(params: ProductsParams());
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: isAllSelected
                        ? context.colors.main.withOpacity(0.1)
                        : null,
                    border: Border.all(
                      color: isAllSelected
                          ? context.colors.main
                          : Colors.transparent,
                    ),
                  ),
                  child: Text(
                    'all'.tr(context),
                    style: TextStyles.bold12(),
                  ),
                ),
              );
            },
          ),
          Gaps.hGap12,
          Expanded(
            child: BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoadingState) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 100.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  );
                } else if (state is CategoryFailureState) {
                  return Text(state.errorMessage);
                } else if (state is CategorySuccessState) {
                  final List<CategoryEntity> categories =
                      state.response.data as List<CategoryEntity>;

                  return ListView.separated(
                    itemCount: categories.length,
                    separatorBuilder: (context, index) => Gaps.hGap12,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => FilterItem(
                      index: index,
                      name: categories[index].name ?? '',
                      image: categories[index].image ?? '',
                      id: categories[index].id.toString(),
                      onAllSelected: false,
                      onFilterSelected: () {
                        context
                            .read<SelectProductFilterCubit>()
                            .selectItem(index);
                        BlocProvider.of<GetProductsCubit>(context).getProducts(
                            params: ProductsParams(id: categories[index].id));
                      },
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
