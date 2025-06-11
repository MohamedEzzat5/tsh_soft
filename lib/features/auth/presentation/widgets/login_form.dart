import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import 'package:tsh_soft/features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:tsh_soft/features/splash/presentation/cubit/auto_login/auto_login_cubit.dart';
import 'package:tsh_soft/injection_container.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          AppTextFormField(
            focusNode: emailFocusNode,
            hintText: 'email'.tr(context),
            controller: emailController,
            validatorType: ValidatorType.email,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
          ),
          Gaps.vGap20,
          AppTextFormField(
            focusNode: passwordFocusNode,
            hintText: 'password'.tr(context),
            obscureText: isSecure,
            controller: passwordController,
            validatorType: ValidatorType.password,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: IconButton(
              icon: Icon(
                isSecure
                    ? Icons.remove_red_eye_outlined
                    : Icons.visibility_off_outlined,
                color: context.colors.buttonColor,
              ),
              onPressed: () {
                setState(() {
                  isSecure = !isSecure;
                });
              },
            ),
          ),
          Gaps.vGap40,
          BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccessState) {
                Constants.showSnakToast(
                  context: context,
                  message: 'done'.tr(context),
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
              if (state is LoginFailureState) {
                Constants.showSnakToast(
                  context: context,
                  message: state.message,
                  type: 3,
                );
              }
            },
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    state is LoginLoadingState
                        ? const LoadingView()
                        : MyDefaultButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                // displayOTPDialog(context);
                                BlocProvider.of<LoginCubit>(context).login(
                                  params: AuthParams(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                );
                              }
                            },
                            btnText: 'logintxt',
                            borderColor: context.colors.main,
                          ),
                    if (state is LoginFailureState) ...[
                      Text(
                        state.message,
                        style:
                            TextStyles.bold20(color: context.colors.errorColor),
                      )
                    ]
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
