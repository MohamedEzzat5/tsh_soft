// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/params/product_params.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/features/products/presentation/cubit/get_products_cubit/get_products_cubit.dart';
import 'package:tsh_soft/features/products/presentation/widgets/filter_list_widget.dart';
import 'package:tsh_soft/features/products/presentation/widgets/products_grid_view.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  @override
  void initState() {
    BlocProvider.of<GetProductsCubit>(context).getProducts(params: ProductsParams());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => searchFocusNode.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('products'.tr(context)),
        ),
        body: Column(
          children: [
            // MySearchBar(
            //   controller: searchController,
            //   focusNode: searchFocusNode,
            //   hintText: 'search'.tr(context),
            // ),
            Gaps.vGap10,
            const FilterListWidget(),
            Gaps.vGap10,
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: ProductsGridView(
                  isScrollable: true,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
