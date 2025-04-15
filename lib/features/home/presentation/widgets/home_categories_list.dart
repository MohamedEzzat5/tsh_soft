import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';

class HomeCategoriesList extends StatelessWidget {
  const HomeCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'name': 'الكترونيات',
        'img': 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8'
      },
      {
        'name': 'مواد التجميل',
        'img': 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8'
      },
      {
        'name': 'الملابس',
        'img': 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8'
      },
      {
        'name': 'الكترونيات',
        'img': 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8'
      },
      {
        'name': 'الملابس',
        'img': 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8'
      },
    ];

    return SizedBox(
      height: 140.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, _) => Gaps.hGap12,
        itemBuilder: (context, index) {
          final item = categories[index];
          return Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.network(
                  item['img']!,
                  width: 100.w,
                  height: 80.h,
                  fit: BoxFit.cover,
                ),
              ),
              Gaps.vGap8,
              Text(item['name']!),
            ],
          );
        },
      ),
    );
  }
}
