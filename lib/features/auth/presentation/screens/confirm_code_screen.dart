import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/config/routes/app_routes.dart';
import 'package:tsh_soft/core/params/reset_password_params.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/core/widgets/my_default_button.dart';
import 'package:tsh_soft/features/auth/presentation/cubit/count_cubit/count_cubit.dart';
import 'package:tsh_soft/features/auth/presentation/widgets/pin_widget.dart';
import 'package:tsh_soft/injection_container.dart';

import '../../../../core/utils/image_manager.dart';
import '../../../../core/utils/values/text_styles.dart';

class ConfirmCodeScreen extends StatefulWidget {
  final String email;
  const ConfirmCodeScreen({super.key, required this.email});

  @override
  ConfirmCodeScreenState createState() => ConfirmCodeScreenState();
}

class ConfirmCodeScreenState extends State<ConfirmCodeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController pinCodeController = TextEditingController();
  final FocusNode pinCodeFocus = FocusNode();
  bool isTypeValid = true;

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   // remoteConfigService.checkForUpdates(context);
    // });
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
        child: BlocProvider(
          create: (context) => CountdownCubit(),
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
                      RichText(
                        text: TextSpan(
                          style:
                              TextStyles.regular22(color: context.colors.black),
                          children: [
                            TextSpan(
                                text:
                                    '${'sent_the_verification'.tr(context)} '),
                            TextSpan(
                              text: widget.email,
                              style: TextStyles.regular22(
                                color: context.colors.main,
                              ),
                            ),
                          ],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.visible,
                        softWrap: true,
                      ),

                      Gaps.vGap40,
                      PinCodeWidget(
                        textSubmit: (value) {},
                        pinLength: 4,
                        pinBoxWidth: 80.w,
                        controller: pinCodeController,
                        focus: pinCodeFocus,
                      ),
                      if (!isTypeValid)
                        Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                            'field_required'.tr(context),
                            style: TextStyles.regular16(
                                color: context.colors.errorColor),
                          ),
                        ),
                      Gaps.vGap20,
                      BlocBuilder<CountdownCubit, CountdownState>(
                        builder: (context, countdownState) {
                          final minutes = (countdownState.timeLeft ~/ 60)
                              .toString()
                              .padLeft(2, '0');
                          final seconds = (countdownState.timeLeft % 60)
                              .toString()
                              .padLeft(2, '0');

                          return SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "resend_code".tr(context),
                                  style: TextStyles.regular16(
                                    color: countdownState.isCounting
                                        ? context.colors.main
                                            .withValues(alpha: 0.6)
                                        : context.colors.main,
                                  ),
                                ),
                                // BlocListener<ResendOtpCubit, ResendOtpState>(
                                //   listener: (context, state) {
                                //     if (state is ResendOtpErrorState) {
                                //       Constants.hideLoading(context);
                                //       Constants.showSnakToast(
                                //         context: context,
                                //         message: state.message,
                                //         type: 3,
                                //       );
                                //     } else if (state is ResendOtpSuccessState) {
                                //       Constants.hideLoading(context);
                                //       Constants.showSnakToast(
                                //         context: context,
                                //         message: state.response.message,
                                //         type: 1,
                                //       );
                                //       context
                                //           .read<CountdownCubit>()
                                //           .resendCode(); // Start timer
                                //     } else if (state is ResendOtpLoadingState) {
                                //       Constants.showLoading(context);
                                //     }
                                //   },
                                //   child: GestureDetector(
                                //     onTap: countdownState.isCounting
                                //         ? null
                                //         : () {
                                //             BlocProvider.of<ResendOtpCubit>(
                                //                     context)
                                //                 .resendOtp(
                                //               email: widget.email,
                                //             );
                                //           },
                                //     child: Text(
                                //       "resend_code".tr(context),
                                //       style: TextStyles.regular16(
                                //         color: countdownState.isCounting
                                //             ? context.colors.secondaryColor
                                //                 .withValues(alpha: 0.6)
                                //             : context.colors.secondaryColor,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                Gaps.hGap4,
                                Row(
                                  children: [
                                    Text(
                                      "$minutes:$seconds",
                                      style: TextStyles.regular14(
                                        color:
                                            context.colors.black.withAlpha(400),
                                      ),
                                    ),
                                    Gaps.hGap30,
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Gaps.vGap40,
                      MyDefaultButton(
                        btnText: 'continue',
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.resetPasswordRoute,
                            arguments: ResetPasswordParams(
                              email: widget.email,
                              code: pinCodeController.text,
                            ),
                          );
                          // onPressed(context);
                        },
                      ),
                      // BlocConsumer<VerifyResetCodeCubit, VerifyResetCodeState>(
                      //   listener: (context, state) {
                      //     if (state is VerifyResetCodeErrorState) {
                      //       Constants.showSnakToast(
                      //         context: context,
                      //         message: state.message,
                      //         type: 3,
                      //       );
                      //     } else if (state is VerifyResetCodeSuccessState) {
                      //       context.read<CountdownCubit>().close();
                      //       Constants.showSnakToast(
                      //         context: context,
                      //         message: state.response.message,
                      //         type: 1,
                      //       );
                      //       Navigator.pushReplacementNamed(
                      //         context,
                      //         Routes.resetPasswordRoute,
                      //         arguments: VerifyResetCodeParams(
                      //           email: widget.email,
                      //           code: pinCodeController.text,
                      //         ),
                      //       );
                      //     }
                      //   },
                      //   builder: (context, state) {
                      //     return state is VerifyResetCodeLoadingState
                      //         ? const Center(child: LoadingView())
                      //         : Center(
                      //             child: MyDefaultButton(
                      //               textStyle:
                      //                   TextStyles.bold20(color: context.colors.black),
                      //               btnText: 'continue'.tr(context),
                      //               localeText: true,
                      //               onPressed: () {
                      //                 onPressed(context);
                      //               },
                      //             ),
                      //           );
                      //   },
                      // ),
                      Gaps.vGap20,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void onPressed(BuildContext context) async {
  //   final isValidForm = _formKey.currentState!.validate();
  //   final hasData = pinCodeController.text.isNotEmpty;

  //   setState(() {
  //     isTypeValid = hasData;
  //   });

  //   if (isValidForm && hasData) {
  //     _formKey.currentState!.save();
  //     BlocProvider.of<VerifyResetCodeCubit>(context).fVerifyResetCode(
  //       email: widget.email,
  //       code: pinCodeController.text,
  //     );
  //   }
  // }

  void unFocus() {
    pinCodeFocus.unfocus();
  }
}
