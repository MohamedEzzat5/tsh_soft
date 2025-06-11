import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/config/routes/app_routes.dart';
import 'package:tsh_soft/core/params/auth_params.dart';
import 'package:tsh_soft/core/utils/constants.dart';
import 'package:tsh_soft/core/utils/enums.dart';
import 'package:tsh_soft/core/utils/validator.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/core/widgets/loading_view.dart';
import 'package:tsh_soft/core/widgets/my_default_button.dart';
import 'package:tsh_soft/core/widgets/text_form_field.dart';
import 'package:tsh_soft/features/auth/presentation/cubit/register/register_cubit.dart';
import 'package:tsh_soft/features/splash/presentation/cubit/auto_login/auto_login_cubit.dart';
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
            hintText: 'name'.tr(context),
            validatorType: ValidatorType.standard,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
          ),
          Gaps.vGap20,
          AppTextFormField(
            focusNode: emailFocus,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: 'log_in_enter_email'.tr(context),
            validatorType: ValidatorType.email,
            textInputAction: TextInputAction.next,
          ),
          Gaps.vGap20,
          AppTextFormField(
            focusNode: phoneFocus,
            controller: phoneController,
            hintText: 'register_phone'.tr(context),
            keyboardType: TextInputType.phone,
            validatorType: ValidatorType.phone,
            textInputAction: TextInputAction.next,
          ),
          Gaps.vGap20,
          AppTextFormField(
            controller: passController,
            focusNode: passFocus,
            hintText: 'log_in_enter_pass'.tr(context),
            keyboardType: TextInputType.visiblePassword,
            obscureText: isSecure,
            validatorType: ValidatorType.password,
            textInputAction: TextInputAction.next,
            suffixIcon: IconButton(
              icon: Icon(
                isSecure
                    ? Icons.remove_red_eye_outlined
                    : Icons.visibility_off_outlined,
                color: context.colors.buttonColor,
              ),
              onPressed: () => setState(() => isSecure = !isSecure),
            ),
          ),
          Gaps.vGap20,
          AppTextFormField(
            focusNode: confirmPasswordFocus,
            controller: confirmPasswordController,
            keyboardType: TextInputType.visiblePassword,
            hintText: 'confirm_password'.tr(context),
            obscureText: isSecureConfirm,
            textInputAction: TextInputAction.done,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'error_field_required'.tr(context);
              }
              if (value != passController.text) {
                return 'error_valid_password_confirm'.tr(context);
              }
              return null;
            },
            suffixIcon: IconButton(
              icon: Icon(
                isSecureConfirm
                    ? Icons.remove_red_eye_outlined
                    : Icons.visibility_off_outlined,
                color: context.colors.buttonColor,
              ),
              onPressed: () =>
                  setState(() => isSecureConfirm = !isSecureConfirm),
            ),
          ),
          Gaps.vGap60,
          BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterSuccessState) {
                Constants.showSnakToast(
                  context: context,
                  message: state.response?.message ?? "done".tr(context),           
                  type: 1,
                );
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.homeScreenRoute,
                  (Route route) => false,
                );
                BlocProvider.of<AutoLoginCubit>(context)
                    .saveUserType(type: UserType.approved);
              }
              if (state is RegisterFailureState) {
                Constants.showSnakToast(
                  context: context,
                  message: state.errorMessage,
                  type: 3,
                );
              }
            },
            builder: (context, state) {
              return Column(
                children: [
                  state is RegisterLoadingState
                      ? const LoadingView()
                      : MyDefaultButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              BlocProvider.of<RegisterCubit>(context).fRegister(
                                params: AuthParams(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  password: passController.text,
                                  passwordConfirmation:
                                      confirmPasswordController.text,
                                ),
                              );
                            }
                          },
                          btnText: 'create_account',
                          borderColor: context.colors.main,
                        ),
                  if (state is RegisterFailureState) ...[
                    Text(
                      state.errorMessage,
                      style:
                          TextStyles.bold20(color: context.colors.errorColor),
                    )
                  ]
                ],
              );
            },
          ),
          // MyDefaultButton(
          //   btnText: 'create_account',
          //   onPressed: () {
          //     Navigator.pushNamed(context, Routes.homeScreenRoute);
          //   },
          //   borderColor: context.colors.main,
          // ),
          Gaps.vGap40,
        ],
      ),
    );
  }
}
