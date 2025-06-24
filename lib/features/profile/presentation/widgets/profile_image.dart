import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/features/profile/domain/entities/profile_entity.dart';

import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/diff_img.dart';
import '../../../../core/widgets/gaps.dart';

class ProfileImageWidget extends StatelessWidget {
  final ProfileEntity profileData;

  const ProfileImageWidget({super.key, required this.profileData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          DiffImage(
            image: profileData.photo != null
                ? "https://store.tsh-dev.com/storage/${profileData.photo}"
                : 'https://img.freepik.com/free-psd/3d-illustration-human-avatar-profile_23-2150671142.jpg?t=st=1740821083~exp=1740824683~hmac=6a0365d6a328894f5c8278105377a058197b506585d15960ebbbb4391da5de2a&w=900',
            isCircle: true,
            hasBorder: false,
            fitType: BoxFit.cover,
            radius: 55.r,
            height: 110.h,
            width: 110.w,
          ),
          Gaps.vGap12,
          Text(profileData.name ?? '', style: TextStyles.bold16()),
        ],
      ),
    );
  }
}
