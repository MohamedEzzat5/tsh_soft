import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/utils/constants.dart';
import 'package:tsh_soft/core/utils/svg_manager.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';
import 'package:tsh_soft/core/widgets/app_image.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/injection_container.dart';

class ProductInfoWidget extends StatelessWidget {
  final String name;
  final String description;
  final String image;
  final double price;

  const ProductInfoWidget({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: AppImage(
            imageUrl: image,
            height: 0.25.sh,
            width: 1.sw,
            borderRadius: 8.r,
            isCached: true,
            fit: BoxFit.cover,
          ),
        ),
        Gaps.vGap16,
        Row(
          children: [
            Text(name, style: TextStyles.bold18(color: colors.main)),
            const Spacer(),
            SvgPicture.asset(
              SvgAssets.heart,
              height: 28.h,
              colorFilter: Constants.colorFilter(colors.errorColor),
            )
          ],
        ),
        Gaps.vGap12,
        Text(
          description,
          style: TextStyles.regular14(),
          maxLines: 14,
        ),
        Gaps.vGap16,
        Container(
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: colors.secondaryColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: colors.backGround,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      SvgAssets.priceIcon,
                      colorFilter: Constants.colorFilter(colors.main),
                    ),
                    Gaps.hGap4,
                    Text('price'.tr, style: TextStyles.bold14()),
                  ],
                ),
                Text('$price ${'egp'.tr}',
                    style: TextStyles.bold14(color: colors.main)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
