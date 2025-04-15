import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tsh_soft/core/utils/svg_manager.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/injection_container.dart';

class ProductItem extends StatelessWidget {
  final String name;
  final String image;
  final double price;

  const ProductItem({
    super.key,
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: colors.secondaryColor.withAlpha(70 * 255),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gaps.vGap10,
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.network(
                  image,
                  width: 150.w,
                  height: 100.h,
                  fit: BoxFit.cover,
                ),
              ),
              Gaps.vGap4,
              Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.bold16(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '$price',
                        style: TextStyles.bold16(),
                      ),
                      Gaps.hGap2,
                      Text(
                        'EGP',
                        style: TextStyles.regular12(),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 22.r,
                    backgroundColor: colors.main,
                    child: SvgPicture.asset(SvgAssets.homeItemCart),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
