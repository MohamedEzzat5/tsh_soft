import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tsh_soft/core/utils/constants.dart';

import '../../../../core/utils/svg_manager.dart';
import '../../../../core/widgets/diff_img.dart';
import '../../../../injection_container.dart';

class EditProfileImage extends StatelessWidget {
  const EditProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topRight,
        children: [
          DiffImage(
            image:
                'https://img.freepik.com/free-psd/3d-illustration-human-avatar-profile_23-2150671142.jpg?t=st=1740821083~exp=1740824683~hmac=6a0365d6a328894f5c8278105377a058197b506585d15960ebbbb4391da5de2a&w=900',
            isCircle: false,
            hasBorder: false,
            fitType: BoxFit.cover,
            height: 100.h,
            width: 100.w,
          ),
          Positioned(
              bottom: -8,
              left: -20,
              child: IconButton(
                onPressed: () {},
                icon: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color:
                            Colors.black.withValues(alpha: 0.2), // Shadow color
                        blurRadius: 6, // Softness of shadow
                        spreadRadius: 2, // Spread effect
                        offset: Offset(0, 3), // Moves shadow downward
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundColor: context.colors.white,
                    child: SvgPicture.asset(
                      SvgAssets.addPhotoIcon,
                     colorFilter: Constants.colorFilter(
                        context.colors.main,
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
