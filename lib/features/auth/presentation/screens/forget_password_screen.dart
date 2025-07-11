import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/config/routes/app_routes.dart';
import 'package:tsh_soft/core/params/auth_params.dart';
import 'package:tsh_soft/core/utils/constants.dart';
import 'package:tsh_soft/core/utils/validator.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/core/widgets/loading_view.dart';
import 'package:tsh_soft/core/widgets/my_default_button.dart';
import 'package:tsh_soft/features/auth/presentation/cubit/forget_password/forgot_password_cubit.dart';

import '../../../../core/utils/image_manager.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/text_form_field.dart';
import '../../../../injection_container.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  ForgetPasswordScreenState createState() => ForgetPasswordScreenState();
}

class ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocus = FocusNode();

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
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
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
                    "forgotPasswordText".tr(context),
                    style: TextStyles.bold18(
                      color: context.colors.main,
                    ),
                  ),
                  // Gaps.vGap10,
                  Text(
                    'email'.tr(context),
                    style: TextStyles.regular16(
                      color: context.colors.upBackGround,
                    ),
                  ),
                  Gaps.vGap40,
                  Text(
                    'email'.tr(context),
                    style: TextStyles.regular16(
                      color: context.colors.main,
                    ),
                  ),
                  Gaps.vGap12,
                  AppTextFormField(
                    controller: emailController,
                    focusNode: emailFocus,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validatorType: ValidatorType.email,
                    hintText: 'log_in_enter_email'.tr(context),
                  ),
                  Gaps.vGap60,

                  // MyDefaultButton(
                  //   btnText: 'send',
                  //   onPressed: () {
                  //     Navigator.pushNamed(
                  //       context,
                  //       Routes.confirmCodeScreenRoute,
                  //       arguments: emailController.text,
                  //     );
                  //   },
                  // ),

                  BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
                    listener: (context, state) {
                      if (state is ForgotPasswordFailureState) {
                        Constants.showSnakToast(
                          context: context,
                          message: state.errorMessage,
                          type: 3,
                        );
                      } else if (state is ForgotPasswordSuccessState) {
                        Constants.showSnakToast(
                          context: context,
                          message: state.resp.data.token,
                          type: 1,
                        );
                        Navigator.pushNamed(
                          context,
                          Routes.confirmCodeScreenRoute,
                          arguments: emailController.text,
                        );
                      }
                    },
                    builder: (context, state) {
                      return state is ForgotPasswordLoadingState
                          ? const Center(
                              child: LoadingView(),
                            )
                          : MyDefaultButton(
                              btnText: 'send',
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  FocusScope.of(context).unfocus();
                                  context
                                      .read<ForgotPasswordCubit>()
                                      .forgotPassword(
                                        params: AuthParams(
                                          email: emailController.text,
                                        ),
                                      );
                                }
                              },
                            );
                    },
                  ),
                  Gaps.vGap40,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
