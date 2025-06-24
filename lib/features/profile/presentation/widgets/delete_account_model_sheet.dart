import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/utils/enums.dart';
import 'package:tsh_soft/features/auth/presentation/cubit/delete_account_cubit/delete_account_cubit.dart';
import 'package:tsh_soft/features/splash/presentation/cubit/auto_login/auto_login_cubit.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/svg_manager.dart';
import '../../../../core/utils/values/text_styles.dart';
import '../../../../core/widgets/gaps.dart';
import '../../../../core/widgets/my_default_button.dart';
import '../../../../injection_container.dart';

class DeleteAccountModalSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Gaps.vGap16,
              SvgPicture.asset(
                SvgAssets.recycleBinIcon,
                height: 30.h,
                colorFilter: ColorFilter.mode(
                    context.colors.errorColor, BlendMode.srcIn),
              ),
              Gaps.vGap16,
              Text(
                'confirm_delete_account'.tr(context),
                style: TextStyles.bold18(),
                textAlign: TextAlign.center,
              ),
              Gaps.vGap20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
                    listener: (context, state) {
                      if (state is DeleteAccountLoading) {
                        Constants.showLoading(context);
                      } else if (state is DeleteAccountSuccess) {
                        Constants.hideLoading(context);
                        Constants.showSnakToast(
                          context: context,
                          message: state.response.message,
                          type: 1,
                        );
                        sharedPreferences.clearAll();
                        secureStorage.clearAll();
                        BlocProvider.of<AutoLoginCubit>(context)
                            .saveUserType(type: UserType.login);
                        Navigator.pushNamedAndRemoveUntil(
                            context, Routes.loginScreenRoute, (route) => false);
                      } else if (state is DeleteAccountFailure) {
                        Constants.hideLoading(context);
                        Constants.showSnakToast(
                          context: context,
                          message: state.message,
                          type: 3,
                        );
                      }
                    },
                    builder: (context, state) {
                      return Expanded(
                        child: MyDefaultButton(
                          color: context.colors.errorColor,
                          borderColor: context.colors.errorColor,
                          onPressed: () {
                            BlocProvider.of<DeleteAccountCubit>(context)
                                .deleteAccount();
                          },
                          btnText: 'delete',
                          textColor: context.colors.white,
                          textStyle: TextStyles.regular18(),
                        ),
                      );
                    },
                  ),
                  Gaps.hGap20,
                  Expanded(
                    child: MyDefaultButton(
                      borderColor: context.colors.main,
                      color: context.colors.white,
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      btnText: 'cancel',
                      textColor: context.colors.black,
                      textStyle: TextStyles.regular18(),
                    ),
                  ),
                ],
              ),
              Gaps.vGap16,
            ],
          ),
        );
      },
    );
  }
}
