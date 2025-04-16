// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';
import 'package:tsh_soft/core/widgets/app_image.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/features/products/presentation/cubit/select_product_filter/select_filter_cubit.dart';
import 'package:tsh_soft/injection_container.dart';

class FilterItem extends StatelessWidget {
  final int index;
  final String name;
  final String image;
  final String id;
  final bool onAllSelected;
  final VoidCallback onFilterSelected;

  const FilterItem({
    super.key,
    required this.index,
    required this.name,
    required this.image,
    required this.id,
    required this.onAllSelected,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectProductFilterCubit, int>(
      builder: (context, selectedIndex) {
        bool isSelected = index == selectedIndex;

        return InkWell(
          onTap: onFilterSelected,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? colors.main : Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(8.r),
              color: isSelected ? colors.main.withOpacity(0.1) : null,
            ),
            child: Row(
              children: [
                ClipOval(
                  child: SizedBox(
                    width: 40.w,
                    height: 40.h,
                    child: AppImage(
                      imageUrl: image,
                      isCircle: true,
                      fit: BoxFit.cover,
                      isCached: true,
                    ),
                  ),
                ),
                Gaps.hGap8,
                Text(
                  name,
                  style: TextStyles.medium14(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
