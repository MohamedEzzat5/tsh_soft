// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';

import '../widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (value) async {
        // await showAppDialog(
        //       context: context,
        //       child: const RegisterBackDialog(),
        //     ) ??
        //     false;
      },
      child: Scaffold(
        // backgroundColor: context.colors.upBackGround,
        appBar: AppBar(
          centerTitle: false,
          // backgroundColor: context.colors.upBackGround,
          title: Text(
            'create_account'.tr(context),
            style: TextStyles.bold18(),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: const RegisterForm(),
        ),
      ),
    );
  }
}
