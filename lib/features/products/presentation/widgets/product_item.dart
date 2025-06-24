import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:tsh_soft/core/utils/constants.dart';
import 'package:tsh_soft/core/utils/svg_manager.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';
import 'package:tsh_soft/core/widgets/app_image.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/features/favorite/presentation/cubit/add_to_favorite_cubit/add_to_favorite_cubit.dart';
import 'package:tsh_soft/injection_container.dart';

import '../../../../core/utils/animation_assets.dart';

class ProductItemWidget extends StatelessWidget {
  final String name;
  final String image;
  final dynamic price;
  final int productId;

  final bool isFavorite;

  const ProductItemWidget({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.productId,
    required this.isFavorite,
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
                  topLeft: Radius.circular(12.r),
                ),
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
                child: BlocBuilder<AddToFavoriteCubit, AddToFavoriteState>(
                  buildWhen: (prev, curr) =>
                      prev.isFavorite(productId) !=
                          curr.isFavorite(productId) ||
                      prev.isLoading(productId) != curr.isLoading(productId),
                  builder: (context, state) {
                    final isLoading = state.isLoading(productId);
                    return InkWell(
                      onTap: isLoading
                          ? null
                          : () => context
                              .read<AddToFavoriteCubit>()
                              .toggleFavorite(productId),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 20),
                          child: Container(
                            padding: EdgeInsets.all(8.r),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: isLoading
                                ? Lottie.asset(
                                    AnimationAssets.addToFavorites,
                                    width: 25.w,
                                    height: 25.h,
                                  )
                                : SvgPicture.asset(
                                    SvgAssets.heart,
                                    width: 20.w,
                                    height: 20.h,
                                    colorFilter: Constants.colorFilter(
                                      isFavorite
                                          ? context.colors.errorColor
                                          : context.colors.borderColor,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    );
                  },
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
                          'EGP',
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
