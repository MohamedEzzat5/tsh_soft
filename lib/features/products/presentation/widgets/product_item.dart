import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/utils/constants.dart';
import 'package:tsh_soft/core/utils/svg_manager.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';
import 'package:tsh_soft/core/widgets/app_image.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/injection_container.dart';

class ProductItemWidget extends StatelessWidget {
  final String name;
  final String image;
  final dynamic price;
  final bool isFavorite;

  const ProductItemWidget({
    super.key,
    required this.name,
    required this.isFavorite,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12.r),
                    topLeft: Radius.circular(12.r)),
                child: AppImage(
                  imageUrl: image,
                  width: double.infinity,
                  height: 140.h,
                  isCached: true,
                  borderRadius: 0,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8.h,
                right: 8.w,
                child: Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                    color: context.colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    SvgAssets.heart,
                    width: 20.w,
                    height: 20.h,
                    colorFilter: Constants.colorFilter(isFavorite
                        ? context.colors.errorColor
                        : context.colors.borderColor),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.vGap4,
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.bold16(),
                ),
                Gaps.vGap4,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '$price',
                          style: TextStyles.bold14(),
                        ),
                        Gaps.hGap4,
                        Text(
                          'egp'.tr(context),
                          style: TextStyles.regular12(),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 20.r,
                      backgroundColor: context.colors.main,
                      child: Padding(
                        padding: EdgeInsets.all(6.r),
                        child: SvgPicture.asset(
                          SvgAssets.homeItemCart,
                          width: 18.w,
                          height: 18.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
