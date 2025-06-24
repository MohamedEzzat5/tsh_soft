import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/config/routes/app_routes.dart';
import 'package:tsh_soft/core/params/cart_params.dart';
import 'package:tsh_soft/core/utils/image_manager.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/core/widgets/my_default_button.dart';
import 'package:tsh_soft/features/cart/domain/entities/cart_entity.dart';
import 'package:tsh_soft/features/cart/presentation/cubit/delete_cart_item.dart/delete_cart_item_cubit.dart';
import 'package:tsh_soft/features/cart/presentation/cubit/get_cart/get_cart_cubit.dart';
import 'package:tsh_soft/features/cart/presentation/cubit/update_cart_item_cubit/update_cart_item_cubit.dart';
import 'package:tsh_soft/features/cart/presentation/widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    BlocProvider.of<GetCartCubit>(context).getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cart'.tr(context), style: TextStyles.bold18()),
      ),
      body: SafeArea(
        child: BlocBuilder<GetCartCubit, GetCartState>(
          builder: (context, state) {
            if (state is GetCartLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetCartFailureState) {
              return Center(child: Text(state.errorMessage));
            } else if (state is GetCartSuccessState) {
              final CartEntity cart = state.resp.data as CartEntity;
              final List<CartItemEntity> cartItems = cart.items ?? [];
              return Column(
                children: [
                  Expanded(
                    child: (cartItems.isEmpty || cart.items == null)
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  ImgAssets.cart,
                                  height: 200.h,
                                  width: 200.w,
                                ),
                                Gaps.vGap20,
                                Text("noCurrentOrders".tr(context),
                                    style: TextStyles.bold16()),
                                Gaps.vGap60,
                              ],
                            ),
                          )
                        : ListView.separated(
                            padding: const EdgeInsets.all(16),
                            itemCount: cartItems.length,
                            separatorBuilder: (_, __) => Gaps.vGap20,
                            itemBuilder: (context, index) {
                              final item = cartItems[index];
                              return CartItem(
                                item: item,
                                onPlus: () {
                                  BlocProvider.of<UpdateCartItemCubit>(context)
                                      .updateCartItem(
                                    params: CartParams(
                                        productId: item.productId ?? 0,
                                        quantity: (item.quantity! + 1)),
                                  );
                                },
                                onMinus: () {
                                  if (item.quantity! > 1)
                                    BlocProvider.of<UpdateCartItemCubit>(
                                            context)
                                        .updateCartItem(
                                      params: CartParams(
                                          productId: item.productId ?? 0,
                                          quantity: (item.quantity! - 1)),
                                    );
                                },
                                onDelete: () {
                                  BlocProvider.of<DeleteCartItemCubit>(context)
                                      .deleteCartItem(
                                    params: CartParams(
                                        productId: item.productId ?? 0),
                                  );
                                },
                              );
                            },
                          ),
                  ),
                  if (cartItems.isNotEmpty) ...[
                    Gaps.vGap10,
                    Container(
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 6,
                            offset: const Offset(0, -2),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          topRight: Radius.circular(16.r),
                        ),
                      ),
                      child: Row(
                        children: [
                          Text('total'.tr(context), style: TextStyles.bold14()),
                          Text(' ${cart.total ?? ''} ${'egp'.tr(context)}',
                              style: TextStyles.bold14()),
                          const Spacer(),
                          Expanded(
                            flex: 2,
                            child: MyDefaultButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, Routes.billScreenRoute,
                                    arguments: cart);
                              },
                              btnText: 'order_now',
                            ),
                          )
                        ],
                      ),
                    ),
                  ]
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
