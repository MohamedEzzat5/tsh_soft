import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/widgets/app_image.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
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
      {
        'name': 'موبايلات',
        'img':
            'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8c2Ftc3VuZ3xlbnwwfHwwfHx8MA%3D%3D'
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('all_categories'.tr),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0.h),
        child: GridView.builder(
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
                  imageUrl: category['img']!,
                  width: 100.w,
                  height: 80.h,
                  fit: BoxFit.cover,
                  isCached: true,
                ),
                Gaps.vGap8,
                Text(category['name']!),
              ],
            );
          },
        ),
      ),
    );
  }
}
