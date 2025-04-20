import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/core/utils/image_manager.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/injection_container.dart';

class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colors.secondaryColor.withAlpha(90),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Container(
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.colors.main,
            ),
            child: Image.asset(
              ImgAssets.logo,
              width: 50.w,
              height: 50.w,
            ),
          ),
          Gaps.hGap10,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'title',
                  style: TextStyles.semiBold14(),
                ),
                Gaps.vGap4,
                Text(
                  'Notification description',
                  style: TextStyles.regular12(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
