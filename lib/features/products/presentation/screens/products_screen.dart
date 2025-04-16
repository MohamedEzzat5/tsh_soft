// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/core/widgets/search_text_field.dart';
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => searchFocusNode.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('products'.tr),
        ),
        body: Column(
          children: [
            MySearchBar(
              controller: searchController,
              focusNode: searchFocusNode,
              hintText: 'search'.tr,
            ),
            Gaps.vGap4,
            const FilterListWidget(),
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
