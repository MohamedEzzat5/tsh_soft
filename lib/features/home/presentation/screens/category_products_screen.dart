import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsh_soft/core/params/product_params.dart';
import 'package:tsh_soft/features/home/domain/entities/category_entity.dart';
import 'package:tsh_soft/features/products/presentation/cubit/get_products_cubit/get_products_cubit.dart';
import 'package:tsh_soft/features/products/presentation/widgets/products_grid_view.dart';

class CategoryProductsScreen extends StatefulWidget {
  final CategoryEntity category;
  const CategoryProductsScreen({Key? key, required this.category})
      : super(key: key);

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  @override
  void initState() {
    BlocProvider.of<GetProductsCubit>(context)
        .getProducts(params: ProductsParams(id: widget.category.id!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name ?? ''),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ProductsGridView(
          isScrollable: true,
        ),
      ),
    );
  }
}
