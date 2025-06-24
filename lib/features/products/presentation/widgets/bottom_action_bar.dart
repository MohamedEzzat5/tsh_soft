import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/config/routes/app_routes.dart';
import 'package:tsh_soft/core/params/cart_params.dart';
import 'package:tsh_soft/core/utils/animation_assets.dart';
import 'package:tsh_soft/core/utils/constants.dart';
import 'package:tsh_soft/core/utils/string_extension.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/core/widgets/loading_view.dart';
import 'package:tsh_soft/core/widgets/my_default_button.dart';
import 'package:tsh_soft/features/cart/presentation/cubit/add_to_cart_cubit/add_cart_cubit.dart';
import 'package:tsh_soft/injection_container.dart';

class BottomActionBar extends StatelessWidget {
  final num? totalPrice;
  final int? counter;
  final int? productId;

  const BottomActionBar({
    super.key,
    required this.totalPrice,
    required this.counter,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: context.colors.backGround,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.r),
          topRight: Radius.circular(8.r),
        ),
      ),
      child: Row(
        children: [
          Row(
            children: [
              Text('total'.tr(context), style: TextStyles.bold14()),
              Gaps.hGap2,
              Text('${totalPrice?.mRoundDouble(2)} ${'egp'.tr(context)}',
                  style: TextStyles.bold14()),
            ],
          ),
          const Spacer(),
          Expanded(
            flex: 2,
            child: BlocConsumer<AddToCartCubit, AddToCartState>(
              listener: (context, state) {
                if (state is AddToCartFailureState) {
                  Constants.showSnakToast(
                    context: context,
                    message: state.errorMessage,
                    type: 3,
                  );
                } else if (state is AddToCartSuccessState) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: SizedBox(
                        height: 0.3.sh,
                        width: 0.8.sw,
                        child: Column(
                          // mainAxisAlignment:
                          // MainAxisAlignment.spaceBetween,
                          children: [
                            Lottie.asset(AnimationAssets.addToCart),
                            Text(
                              'add_to_cart_successfully'.tr(context),
                              style: TextStyles.semiBold14(),
                            ),
                            Gaps.vGap16,
                            Expanded(
                              child: MyDefaultButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pushReplacementNamed(
                                      context, Routes.cartScreenRoute);
                                },
                                btnText: 'finishOrder',
                              ),
                            ),
                            Gaps.vGap8,
                            Expanded(
                              child: MyDefaultButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                btnText: 'continue_shopping',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return state is AddToCartLoadingState
                    ? LoadingView()
                    : MyDefaultButton(
                        onPressed: counter == 0
                            ? () {
                                Constants.showSnakToast(
                                  context: context,
                                  message: 'cart_error'.tr(context),
                                  type: 3,
                                );
                              }
                            : () {
                                context.read<AddToCartCubit>().addToCart(
                                        params: CartParams(
                                      productId: productId,
                                      quantity: counter,
                                    ));
                              },
                        btnText: 'add_to_cart',
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
