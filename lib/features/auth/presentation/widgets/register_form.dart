import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/config/routes/app_routes.dart';
import 'package:tsh_soft/core/utils/validator.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/core/widgets/my_default_button.dart';
import 'package:tsh_soft/core/widgets/text_form_field.dart';
import 'package:tsh_soft/injection_container.dart';

import 'register_header.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode passFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();

  bool isSecure = true;
  bool isSecureConfirm = true;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          RegisterHeader(onImageSelected: (img) => selectedImage = img),
          AppTextFormField(
            controller: nameController,
            focusNode: nameFocus,
            hintText: 'name'.tr,
            validatorType: ValidatorType.standard,
          ),
          Gaps.vGap20,
          AppTextFormField(
            focusNode: emailFocus,
            controller: emailController,
            hintText: 'log_in_enter_email'.tr,
            validatorType: ValidatorType.email,
          ),
          Gaps.vGap20,
          AppTextFormField(
            focusNode: phoneFocus,
            controller: phoneController,
            hintText: 'register_phone'.tr,
            keyboardType: TextInputType.phone,
            validatorType: ValidatorType.phone,
          ),
          Gaps.vGap20,
          AppTextFormField(
            controller: passController,
            focusNode: passFocus,
            hintText: 'log_in_enter_pass'.tr,
            obscureText: isSecure,
            validatorType: ValidatorType.password,
            suffixIcon: IconButton(
              icon: Icon(
                isSecure
                    ? Icons.remove_red_eye_outlined
                    : Icons.visibility_off_outlined,
                color: colors.buttonColor,
              ),
              onPressed: () => setState(() => isSecure = !isSecure),
            ),
          ),
          Gaps.vGap20,
          AppTextFormField(
            focusNode: confirmPasswordFocus,
            controller: confirmPasswordController,
            hintText: 'confirm_password'.tr,
            obscureText: isSecureConfirm,
            validatorType: ValidatorType.password,
            suffixIcon: IconButton(
              icon: Icon(
                isSecureConfirm
                    ? Icons.remove_red_eye_outlined
                    : Icons.visibility_off_outlined,
                color: colors.buttonColor,
              ),
              onPressed: () =>
                  setState(() => isSecureConfirm = !isSecureConfirm),
            ),
          ),
          Gaps.vGap60,
          MyDefaultButton(
            btnText: 'create_account',
            onPressed: () {
            Navigator.pushNamed(context, Routes.homeScreenRoute);
            },
            borderColor: colors.main,
          ),
          Gaps.vGap40,
        ],
      ),
    );
  }
}
