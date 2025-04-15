import 'package:flutter/material.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/core/widgets/profile_image.dart';

class RegisterHeader extends StatelessWidget {
  final Function(dynamic) onImageSelected;

  const RegisterHeader({super.key, required this.onImageSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gaps.vGap25,
        ProfileImage(updateBannerImage: onImageSelected),
        Gaps.vGap35,
      ],
    );
  }
}
