import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tsh_soft/config/routes/app_routes.dart';
import 'package:tsh_soft/features/products/domain/entities/product_entity_model.dart';
import 'package:tsh_soft/features/products/presentation/cubit/get_products_cubit/get_products_cubit.dart';
import 'package:tsh_soft/features/products/presentation/widgets/product_item.dart';

class ProductsGridView extends StatelessWidget {
  final bool isScrollable;
  const ProductsGridView({super.key, this.isScrollable = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsCubit, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsLoading) {
          return ShimmerGrid();
        } else if (state is GetProductsError) {
          return Center(child: Text(state.message));
        } else if (state is GetProductsSuccess) {
          final List<ProductEntity> products =
              state.response.data as List<ProductEntity>;
          return GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: isScrollable
                ? const BouncingScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
              childAspectRatio: .75,
            ),
            itemBuilder: (context, index) {
              final product = products[index];
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.productDetailsScreenRoute,
                    arguments: product,
                  );
                },
                child: ProductItemWidget(
                  productId: product.id ?? 0,
                  isFavorite: product.isFavorite ?? false,
                  name: product.name ?? '',
                  image: product.image ?? '',
                  price: product.price ?? 0.0,
                ),
              );
            },
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}

class ShimmerGrid extends StatelessWidget {
  const ShimmerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: .88,
      ),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        );
      },
    );
  }
}
