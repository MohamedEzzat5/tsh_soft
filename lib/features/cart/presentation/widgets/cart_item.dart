import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/utils/constants.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';
import 'package:tsh_soft/core/widgets/app_image.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/features/cart/domain/entities/cart_entity.dart';
import 'package:tsh_soft/features/cart/presentation/cubit/delete_cart_item.dart/delete_cart_item_cubit.dart';
import 'package:tsh_soft/features/cart/presentation/cubit/get_cart/get_cart_cubit.dart';
import 'package:tsh_soft/features/cart/presentation/cubit/update_cart_item_cubit/update_cart_item_cubit.dart';

class CartItem extends StatelessWidget {
  final CartItemEntity item;
  final VoidCallback onPlus;
  final VoidCallback onMinus;
  final VoidCallback onDelete;

  const CartItem({
    super.key,
    required this.item,
    required this.onPlus,
    required this.onMinus,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          Row(
            children: [
              AppImage(
                imageUrl: item.product?.image ?? '',
                width: 100.w,
                height: 70.w,
                fit: BoxFit.cover,
                borderRadius: 4.r,
                isCached: true,
              ),
              Gaps.hGap10,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.product?.name ?? '', style: TextStyles.bold14()),
                    Gaps.vGap4,
                    Text('${item.product?.price ?? ''} ${'egp'.tr(context)}',
                        style: TextStyles.bold16()),
                  ],
                ),
              ),
              BlocListener<DeleteCartItemCubit, DeleteCartItemState>(
                listener: (context, state) {
                  if (state is DeleteCartItemLoadingState) {
                    Constants.showLoading(context);
                  } else if (state is DeleteCartItemFailureState) {
                    Constants.hideLoading(context);
                    Constants.showSnakToast(
                        context: context, message: state.errorMessage, type: 3);
                  } else if (state is DeleteCartItemSuccessState) {
                    Constants.hideLoading(context);
                    BlocProvider.of<GetCartCubit>(context).getCart();
                    Constants.showSnakToast(
                        context: context, message: state.resp.message, type: 1);
                  }
                },
                child: IconButton(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
              ),
            ],
          ),
          Gaps.vGap12,
          BlocListener<UpdateCartItemCubit, UpdateCartItemState>(
            listener: (context, state) {
              if (state is UpdateCartItemLoadingState) {
                Constants.showLoading(context);
              } else if (state is UpdateCartItemFailureState) {
                Constants.hideLoading(context);
                Constants.showSnakToast(
                    context: context, message: state.errorMessage, type: 3);
              } else if (state is UpdateCartItemSuccessState) {
                Constants.hideLoading(context);
                BlocProvider.of<GetCartCubit>(context).getCart();
                Constants.showSnakToast(
                    context: context, message: state.resp.message, type: 1);
              }
            },
            child: Row(
              children: [
                InkWell(
                  onTap: onMinus,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.remove),
                  ),
                ),
                Gaps.hGap10,
                Text('${item.quantity ?? ''}', style: TextStyles.bold16()),
                Gaps.hGap10,
                InkWell(
                  onTap: onPlus,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.add),
                  ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('total'.tr(context), style: TextStyles.bold14()),
                    Text(
                      '${item.price ?? ''}  ${'egp'.tr(context)}',
                      style: TextStyles.bold16(color: Colors.blue),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
