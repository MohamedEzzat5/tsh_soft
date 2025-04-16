// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/features/products/presentation/cubit/select_product_filter/select_filter_cubit.dart';
import 'package:tsh_soft/features/products/presentation/widgets/filter_item.dart';
import 'package:tsh_soft/injection_container.dart';

class FilterListWidget extends StatelessWidget {
  const FilterListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      {
        'name': 'الكترونيات',
        'img': 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8'
      },
      {
        'name': 'مواد التجميل',
        'img':
            'https://images.unsplash.com/photo-1596462502278-27bfdc403348?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bWFrZXVwfGVufDB8fDB8fHww'
      },
      {
        'name': 'الملابس',
        'img':
            'https://images.unsplash.com/photo-1523381294911-8d3cead13475?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGNsb3RoaW5nfGVufDB8fDB8fHww'
      },
      {
        'name': 'اثاث',
        'img':
            'https://media.istockphoto.com/id/1421422160/photo/interior-of-living-room.webp?a=1&b=1&s=612x612&w=0&k=20&c=z0nRq3IMBRow4NotaBjxVVc8cLReRe69Yty0QPOPjqI='
      },
      {
        'name': 'موبايلات',
        'img':
            'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8c2Ftc3VuZ3xlbnwwfHwwfHx8MA%3D%3D'
      },
    ];
    return Container(
      height: 56.h,
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      color: colors.secondaryColor.withAlpha(120 * 255),
      child: Row(
        children: [
          BlocBuilder<SelectProductFilterCubit, int>(
            builder: (context, selectedIndex) {
              bool isAllSelected = selectedIndex == -1;
              return InkWell(
                onTap: () {
                  context.read<SelectProductFilterCubit>().selectItem(-1);
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: isAllSelected ? colors.main.withOpacity(0.1) : null,
                    border: Border.all(
                      color: isAllSelected ? colors.main : Colors.transparent,
                    ),
                  ),
                  child: Text(
                    'all'.tr,
                    style: TextStyles.bold12(),
                  ),
                ),
              );
            },
          ),
          Gaps.hGap12,
          Expanded(
            child: ListView.separated(
              itemCount: data.length,
              separatorBuilder: (context, index) => Gaps.hGap12,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => FilterItem(
                index: index,
                name: data[index]['name'].toString(),
                image: data[index]['img'].toString(),
                id: '1',
                onAllSelected: false,
                onFilterSelected: () {
                  context.read<SelectProductFilterCubit>().selectItem(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
