import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/config/routes/app_routes.dart';
import 'package:tsh_soft/core/params/auth_params.dart';
import 'package:tsh_soft/core/params/reset_password_params.dart';
import 'package:tsh_soft/core/utils/constants.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/core/widgets/loading_view.dart';
import 'package:tsh_soft/core/widgets/my_default_button.dart';
import 'package:tsh_soft/features/auth/presentation/cubit/reset_password/reset_password_cubit.dart';

import '../../../../core/utils/image_manager.dart';
import '../../../../core/utils/validator.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/text_form_field.dart';
import '../../../../injection_container.dart';

class ResetPasswordScreen extends StatefulWidget {
  final ResetPasswordParams resetCodeParams;
  const ResetPasswordScreen({super.key, required this.resetCodeParams});

  @override
  ResetPasswordScreenState createState() => ResetPasswordScreenState();
}

class ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FocusNode confirmPasswordFocus = FocusNode();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode passwordFocus = FocusNode();
  bool isSecure = true;
  bool confirmIsSecure = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // remoteConfigService.checkForUpdates(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // onPopInvokedWithResult: (value,result) async {
      //   await showAppDialog(
      //         context: context,
      //         child: const ExitAppDialog(),
      //       ) ??
      //       false;
      // },
      child: GestureDetector(
        onTap: () => unFocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Form(
            key: _formKey,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackButton(
                      color: context.colors.main,
                    ),
                    Gaps.vGap30,
                    Center(
                      child: Image.asset(
                        ImgAssets.logo,
                        height: 120.h,
                      ),
                    ),
                    Gaps.vGap40,
                    Text(
                      "update_password".tr(context),
                      style: TextStyles.bold24(
                        color: context.colors.main,
                      ),
                    ),
                    Gaps.vGap40,
                    // Text(
                    //   'update_password_message'.tr(context),
                    //   style: TextStyles.regular16(
                    //     color: context.colors.upBackGround,
                    //   ),
                    // ),
                    // Gaps.vGap40,
                    Text(
                      "new_password".tr(context),
                      style: TextStyles.regular16(
                        color: context.colors.main,
                      ),
                    ),
                    Gaps.vGap12,
                    AppTextFormField(
                      controller: passwordController,
                      focusNode: passwordFocus,
                      obscureText: isSecure,
                      validatorType: ValidatorType.password,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isSecure = !isSecure;
                          });
                        },
                        icon: Icon(
                          !isSecure
                              ? Icons.visibility_outlined
                              : Icons.visibility_off,
                          color: context.colors.iconColor,
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      hintText: "new_password".tr(context),
                    ),
                    Gaps.vGap20,
                    Text(
                      "confirm_new_password".tr(context),
                      style: TextStyles.regular16(
                        color: context.colors.main,
                      ),
                    ),
                    Gaps.vGap12,
                    AppTextFormField(
                      controller: confirmPasswordController,
                      focusNode: confirmPasswordFocus,
                      obscureText: confirmIsSecure,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            confirmIsSecure = !confirmIsSecure;
                          });
                        },
                        icon: Icon(
                          !confirmIsSecure
                              ? Icons.visibility_outlined
                              : Icons.visibility_off,
                          color: context.colors.iconColor,
                        ),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      validatorType: ValidatorType.password,
                      textInputAction: TextInputAction.next,
                      hintText: "confirm_new_password".tr(context),
                    ),
                    Gaps.vGap50,
                    // MyDefaultButton(
                    //   btnText: 'confirm',
                    //   onPressed: () {},
                    // ),
                    BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                      listener: (context, state) {
                        if (state is ResetPasswordFailureState) {
                          Constants.showSnakToast(
                            context: context,
                            message: state.errorMessage,
                            type: 3,
                          );
                        } else if (state is ResetPasswordSuccessState) {
                          Constants.showSnakToast(
                            context: context,
                            message: state.resp.message,
                            type: 1,
                          );
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.loginScreenRoute,
                            (route) => false,
                          );
                        }
                      },
                      builder: (context, state) {
                        return state is ResetPasswordLoadingState
                            ? const Center(child: LoadingView())
                            : MyDefaultButton(
                                btnText: 'confirm',
                                onPressed: () {
                                  if (_formKey.currentState!.validate() &&
                                      passwordController.text ==
                                          confirmPasswordController.text) {
                                    unFocus();
                                    context
                                        .read<ResetPasswordCubit>()
                                        .resetPassword(AuthParams(
                                          email: widget.resetCodeParams.email
                                              .toString(),
                                          password: passwordController.text,
                                          passwordConfirmation:
                                              confirmPasswordController.text,
                                          otp: widget.resetCodeParams.code
                                              .toString(),
                                        ));
                                  } else if (passwordController.text.isNotEmpty &&
                                      confirmPasswordController
                                          .text.isNotEmpty &&
                                      passwordController.text !=
                                          confirmPasswordController.text) {
                                    Constants.showSnakToast(
                                      context: context,
                                      message: 'error_valid_password_confirm'
                                          .tr(context),
                                      type: 3,
                                    );
                                  }
                                },
                              );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void unFocus() {
    confirmPasswordFocus.unfocus();
    passwordFocus.unfocus();
  }
}
