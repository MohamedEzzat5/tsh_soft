import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/features/products/presentation/widgets/bottom_action_bar.dart';
import 'package:tsh_soft/features/products/presentation/widgets/product_info_widget.dart';
import 'package:tsh_soft/features/products/presentation/widgets/quantity_selector_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int counter = 0;

  final dummyData = {
    'name': 'ايفون 13 pro max',
    'image':
        'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8V2lyZWxlc3MlMjBIZWFkcGhvbmVzfGVufDB8fDB8fHww',
    'description':
        'ايفون 13 برو ماكس مساحة 256 جيجا بايت ومقاعدة 6 اينشيت 12MP للكاميرا والكاميرا الموبايلة والكاميرا اللوكي والكاميرا اللوكي الموبايلة',
    'price': 500.00,
  };

  @override
  Widget build(BuildContext context) {
    final price = dummyData['price'] as double;

    return Scaffold(
      appBar: AppBar(
        title: Text('product_details'.tr),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      ProductInfoWidget(
                        name: "${dummyData['name']!}",
                        image: dummyData['image']!.toString(),
                        description: "${dummyData['description']!}",
                        price: price,
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
              totalPrice: counter * price,
              counter: counter,
            ),
          ],
        ),
      ),
    );
  }
}
