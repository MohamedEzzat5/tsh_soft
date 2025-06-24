import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/config/routes/app_routes.dart';
import 'package:tsh_soft/core/params/order_params.dart';
import 'package:tsh_soft/core/utils/constants.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/core/widgets/loading_view.dart';
import 'package:tsh_soft/core/widgets/my_default_button.dart';
import 'package:tsh_soft/core/widgets/text_form_field.dart';
import 'package:tsh_soft/features/address/domain/entities/address_entity.dart';
import 'package:tsh_soft/features/address/presentation/cubit/get_address_cubit/get_address_cubit.dart';
import 'package:tsh_soft/features/cart/domain/entities/cart_entity.dart';
import 'package:tsh_soft/features/orders/presentation/cubit/create_order_cubit/create_order_cubit.dart';
import 'package:tsh_soft/injection_container.dart';

class BillScreen extends StatefulWidget {
  final CartEntity cart;
  const BillScreen({Key? key, required this.cart}) : super(key: key);

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  final TextEditingController notesController = TextEditingController();
  String addressId = '';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetAddressesCubit>(context).getAddresses();
  }

  void _navigateToAddAddress() async {
    final result = await Navigator.pushNamed(context, Routes.addAddressesRoute);
    if (result == true) {
      BlocProvider.of<GetAddressesCubit>(context).getAddresses();
    }
  }

  void _sendOrder() {
    if (addressId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: context.colors.errorColor,
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
          dismissDirection: DismissDirection.down,
          content: Text('choose_delivery_address'.tr(context)),
        ),
      );
      return;
    } else {
      BlocProvider.of<CreateOrderCubit>(context).createOrder(
        params: OrderParams(
          cartId: widget.cart.id,
          addressId: addressId,
          note: notesController.text,
        ),
      );
    }

    print('Order Sent with Address ID: $addressId');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('bill'.tr(context)),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductsSection(),
              Gaps.vGap20,
              Text('delivery_address'.tr(context),
                  style: TextStyles.regular16()),
              Gaps.vGap10,
              BlocBuilder<GetAddressesCubit, GetAddressesState>(
                builder: (context, state) {
                  if (state is GetAddressesLoadingState) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    );
                  } else if (state is GetAddressesFailureState) {
                    return Center(
                      child: Text(
                        state.errorMessage,
                        style: TextStyles.regular14(
                            color: context.colors.errorColor),
                      ),
                    );
                  } else if (state is GetAddressesSuccessState) {
                    List<AddressEntity> listAddresses =
                        state.resp.data as List<AddressEntity>;

                    if (listAddresses.isEmpty) {
                      return Center(
                        child: Column(
                          children: [
                            Text(
                              'no_address'.tr(context),
                              style: TextStyles.semiBold16(),
                              textAlign: TextAlign.center,
                            ),
                            Gaps.vGap10,
                            MyDefaultButton(
                              btnText: 'add_address',
                              onPressed: _navigateToAddAddress,
                            ),
                          ],
                        ),
                      );
                    }

                    return DropdownButtonFormField<AddressEntity>(
                      value: listAddresses.first,
                      validator: (value) {
                        if (value == null) {
                          return 'choose_delivery_address'.tr(context);
                        }
                        return null;
                      },
                      decoration: _inputDecoration(
                          context, 'choose_delivery_address'.tr(context)),
                      isExpanded: true,
                      items: [
                        ...listAddresses.map((address) {
                          return DropdownMenuItem<AddressEntity>(
                            value: address,
                            child: Padding(
                              padding: EdgeInsets.only(right: 12.r),
                              child: Text(
                                "${address.city ?? ''}, ${address.area ?? ''}, ${address.details ?? ''}",
                                style: TextStyles.bold14(),
                              ),
                            ),
                          );
                        }).toList(),
                        DropdownMenuItem<AddressEntity>(
                          value: AddressEntity(id: -1),
                          child: Padding(
                            padding: EdgeInsets.only(right: 12.r),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 20,
                                  color: context.colors.main,
                                ),
                                Gaps.hGap8,
                                Text(
                                  "${'add_address'.tr(context)}",
                                  style: TextStyles.bold14(
                                      color: context.colors.main),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                      onChanged: (AddressEntity? selected) async {
                        if (selected == null) return;

                        if (selected.id == -1) {
                          // لو اختار «إضافة عنوان جديد»
                          final result = await Navigator.pushNamed(
                              context, Routes.addAddressesRoute);
                          if (result == true) {
                            // بعد الإضافة أعد تحميل العناوين
                            BlocProvider.of<GetAddressesCubit>(context)
                                .getAddresses();
                          }
                        } else {
                          setState(() {
                            addressId = selected.id.toString();
                          });
                        }
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              Gaps.vGap20,
              Text('notes'.tr(context), style: TextStyles.regular16()),
              Gaps.vGap10,
              AppTextFormField(
                controller: notesController,
                focusNode: FocusNode(),
                hintText: 'notes'.tr(context),
                maxLines: 5,
              ),
              Gaps.vGap40,
              BlocConsumer<CreateOrderCubit, CreateOrderState>(
                listener: (BuildContext context, CreateOrderState state) {
                  if (state is CreateOrderSuccessState) {
                    Constants.showSnakToast(
                      context: context,
                      message: state.resp.message,
                      type: 1,
                    );
                    Navigator.pushNamedAndRemoveUntil(
                        context, Routes.homeScreenRoute, (route) => false);
                  } else if (state is CreateOrderFailureState) {
                    Constants.showSnakToast(
                      context: context,
                      message: state.errorMessage,
                      type: 3,
                    );
                  }
                },
                builder: (context, state) {
                  return state is CreateOrderLoadingState
                      ? const LoadingView()
                      : MyDefaultButton(
                          btnText: 'send_order',
                          onPressed: _sendOrder,
                        );
                },
              ),
              Gaps.vGap40,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductsSection() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.r, horizontal: 16.r),
      decoration: BoxDecoration(
        color: context.colors.backGround,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'products'.tr(context),
            style: TextStyles.semiBold16(color: context.colors.textColor),
          ),
          Gaps.vGap10,
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('اكسسوارات بناتي', style: TextStyles.semiBold16()),
                  const Spacer(),
                  Text('2 x', style: TextStyles.semiBold16()),
                  Gaps.hGap10,
                  Text('1000 ${'egp'.tr(context)}',
                      style: TextStyles.semiBold16()),
                ],
              );
            },
            separatorBuilder: (_, __) => Gaps.vGap10,
            itemCount: 2,
          ),
          Divider(color: context.colors.borderColor, height: 30.h),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text('delivery'.tr(context), style: TextStyles.semiBold16()),
          //     Text('200 ${'egp'.tr(context)}', style: TextStyles.semiBold16()),
          //   ],
          // ),
          // Divider(color: context.colors.borderColor, height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('payment_method'.tr(context),
                  style: TextStyles.semiBold16()),
              Text('cach_on_delivery'.tr(context),
                  style: TextStyles.semiBold16()),
            ],
          ),
          Divider(color: context.colors.borderColor, height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('total'.tr(context), style: TextStyles.semiBold16()),
              Text('2200 ${'egp'.tr(context)}', style: TextStyles.semiBold16()),
            ],
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration(BuildContext context, String label) {
    return InputDecoration(
      fillColor: context.colors.upBackGround,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
        borderSide: BorderSide(color: context.colors.dividerColor, width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
        borderSide: BorderSide(color: context.colors.main, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
        borderSide: BorderSide(color: context.colors.errorColor, width: 1.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
        borderSide: BorderSide(color: context.colors.errorColor, width: 1.0),
      ),
      labelText: label,
      errorMaxLines: 2,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
      labelStyle: TextStyles.regular14(),
      errorStyle: TextStyles.regular12(color: context.colors.errorColor),
      hintStyle: TextStyles.regular14(color: context.colors.body),
    );
  }
}
