import 'package:flutter/material.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/config/routes/app_routes.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/core/widgets/my_default_button.dart';
import 'package:tsh_soft/core/widgets/text_form_field.dart';
import 'package:tsh_soft/injection_container.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          focusNode: emailFocusNode,
          hintText: 'email'.tr(context),
          controller: emailController,
        ),
        Gaps.vGap20,
        AppTextFormField(
          focusNode: passwordFocusNode,
          hintText: 'password'.tr(context),
          obscureText: isSecure,
          controller: passwordController,
          suffixIcon: IconButton(
            icon: Icon(
              isSecure
                  ? Icons.remove_red_eye_outlined
                  : Icons.visibility_off_outlined,
              color: colors.buttonColor,
            ),
            onPressed: () {
              setState(() {
                isSecure = !isSecure;
              });
            },
          ),
        ),
        Gaps.vGap40,
        MyDefaultButton(
          btnText: 'logintxt',
          onPressed: () {
            Navigator.pushNamed(context, Routes.homeScreenRoute);
          },
          borderColor: colors.main,
        ),
      ],
    );
  }
}
