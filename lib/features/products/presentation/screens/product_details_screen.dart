import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/params/product_params.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/features/products/domain/entities/product_entity_model.dart';
import 'package:tsh_soft/features/products/presentation/cubit/get_product_details_cubit/get_product_details_cubit.dart';
import 'package:tsh_soft/features/products/presentation/widgets/bottom_action_bar.dart';
import 'package:tsh_soft/features/products/presentation/widgets/product_info_widget.dart';
import 'package:tsh_soft/features/products/presentation/widgets/quantity_selector_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductEntity product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetProductDetailsCubit>(context)
        .getProductDetails(params: ProductsParams(id: widget.product.id!));
  }

  int counter = 0;
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text('product_details'.tr(context)),
      ),
      body: SafeArea(
        child: BlocBuilder<GetProductDetailsCubit, GetProductDetailsState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            if (state is GetProductDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetProductDetailsError) {
              return Center(child: Text(state.message));
            } else if (state is GetProductDetailsSuccess) {
              final ProductEntity product = state.response.data as ProductEntity;
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          children: [
                            ProductInfoWidget(
                              isFavorite: product.isFavorite ?? false,
                              name: product.name ?? '' ,
                              image: product.image ?? '',
                              description: product.description ?? '',
                              price: product.price ?? 0,
                            ),
                            Gaps.vGap20,
                            QuantitySelector(
                              counter: counter,
                              onIncrement: () => setState(() => counter++),
                              onDecrement: () {
                                if (counter > 0) setState(() => counter--);
                              },
                            ),
                            Gaps.vGap16,
                          ],
                        ),
                      ),
                    ),
                  ),
                  BottomActionBar(
                    totalPrice: counter * (product.price ?? 0) ,
                    counter: counter,
                    productId: product.id ?? 0,
                  ),
                ],
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}