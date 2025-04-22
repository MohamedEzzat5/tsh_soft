import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/config/routes/app_routes.dart';
import 'package:tsh_soft/core/utils/image_manager.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';
import 'package:tsh_soft/core/widgets/gaps.dart';
import 'package:tsh_soft/core/widgets/my_default_button.dart';
import 'package:tsh_soft/features/cart/presentation/widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double total = 0;

  List<Map<String, dynamic>> cartItems = [
    {
      'id': 1,
      'name': 'Product A',
      'price': 50.0,
      'image':
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8V2lyZWxlc3MlMjBIZWFkcGhvbmVzfGVufDB8fDB8fHww',
      'quantity': 2,
    },
    {
      'id': 2,
      'name': 'Product B',
      'price': 100.0,
      'image':
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8V2lyZWxlc3MlMjBIZWFkcGhvbmVzfGVufDB8fDB8fHww',
      'quantity': 1,
    },
  ];

  @override
  void initState() {
    super.initState();
    _calculateTotal();
  }

  void _calculateTotal() {
    total = 0;
    for (var item in cartItems) {
      total += item['price'] * item['quantity'];
    }
    setState(() {});
  }

  void _increaseQuantity(int index) {
    cartItems[index]['quantity'] += 1;
    _calculateTotal();
  }

  void _decreaseQuantity(int index) {
    if (cartItems[index]['quantity'] > 0) {
      cartItems[index]['quantity'] -= 1;
      _calculateTotal();
    }
  }

  void _removeItem(int index) {
    cartItems.removeAt(index);
    _calculateTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cart'.tr(context), style: TextStyles.bold18()),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: cartItems.isEmpty
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
                          onPlus: () => _increaseQuantity(index),
                          onMinus: () => _decreaseQuantity(index),
                          onDelete: () => _removeItem(index),
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
                    Text(' $total${'egp'.tr(context)}',
                        style: TextStyles.bold14()),
                    const Spacer(),
                    Expanded(
                      flex: 2,
                      child: MyDefaultButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.billScreenRoute);
                        },
                        btnText: 'order_now',
                      ),
                    )
                  ],
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
