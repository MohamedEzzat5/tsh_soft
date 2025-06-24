import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/features/favorite/presentation/cubit/get_favorites_cubit/get_favorites_cubit.dart';
import 'package:tsh_soft/features/products/domain/entities/product_entity_model.dart';
import 'package:tsh_soft/features/products/presentation/widgets/product_item.dart';
import 'package:tsh_soft/features/products/presentation/widgets/products_grid_view.dart';

class FavoriteGridview extends StatelessWidget {
  final bool isScrollable;
  const FavoriteGridview({super.key, this.isScrollable = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavoritesCubit, GetFavoritesState>(
      builder: (context, state) {
        if (state is GetFavoritesLoadingState) {
          return const ShimmerGrid();
        } else if (state is GetFavoritesFailureState) {
          return Center(child: Text(state.errorMessage));
        } else if (state is GetFavoritesSuccessState) {
          final List<ProductEntity> products =
              state.resp.data as List<ProductEntity>;
          if (products.isEmpty) {
            return Center(child: Text('لا يوجد منتجات مفضلة'));
          }
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
              return ProductItemWidget(
                productId: product.id ?? 0,
                isFavorite: product.isFavorite ?? false,
                name: product.name ?? '',
                image: product.image ?? '',
                price: product.price ?? 0.0,
              );
            },
          );
        }
        return Container();
      },
    );
  }
}

class Product {
  final String? name;
  final String? image;
  final double? price;
  final int? id;

  Product({
    required this.name,
    required this.image,
    required this.price,
    this.id,
  });
}
