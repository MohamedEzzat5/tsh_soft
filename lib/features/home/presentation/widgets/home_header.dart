import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tsh_soft/core/utils/svg_manager.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/injection_container.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(SvgAssets.homeAppBarIcon),
            Gaps.hGap8,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome',
                    style: TextStyles.regular12(color: Colors.black)),
                Text('Hello, User',
                    style: TextStyles.bold14(color: Colors.black)),
              ],
            ),
          ],
        ),
        Row(
          children: [
            _buildIcon(SvgAssets.notificationIcon),
            Gaps.hGap8,
            _buildIcon(SvgAssets.cartIcon),
          ],
        ),
      ],
    );
  }

  Widget _buildIcon(String asset) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: const Color(0xffEEEEEE),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          SvgPicture.asset(asset),
          CircleAvatar(radius: 6.r, backgroundColor: colors.main),
        ],
      ),
    );
  }
}
