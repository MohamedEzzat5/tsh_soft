import 'package:flutter/material.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/config/routes/app_routes.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/injection_container.dart';

class LoginFooterLinks extends StatelessWidget {
  const LoginFooterLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {},
              child: Text(
                'log_in_forget_pass'.tr(context),
                style: TextStyles.regular16(color: colors.main),
              ),
            ),
          ],
        ),
        Gaps.vGap25,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${'newAccount'.tr(context)} !',
              style: TextStyles.regular16(color: Colors.black),
            ),
            Gaps.hGap8,
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.registerScreenRoute);
              },
              child: Text(
                'create_account'.tr(context),
                style: TextStyles.bold16(color: colors.main),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
