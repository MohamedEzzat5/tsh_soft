import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/utils/image_manager.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';

import '../widgets/login_footer_links.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.vGap50,
                  Center(
                    child: SizedBox(
                      height: 200.h,
                      width: 200.w,
                      child: Image.asset(ImgAssets.logo),
                    ),
                  ),
                  Gaps.vGap20,
                  Text(
                    'welcome'.tr(context),
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.vGap10,
                  Text(
                    'login_txt'.tr(context),
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                  Gaps.vGap50,
                  const LoginForm(),
                  Gaps.vGap20,
                  const LoginFooterLinks(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
