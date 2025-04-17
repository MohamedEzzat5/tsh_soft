import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'favorite_Item_widget.dart';

class FavoriteGridview extends StatelessWidget {
  final bool isScrollable;
  const FavoriteGridview({super.key, this.isScrollable = false});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: isScrollable
          ? const BouncingScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      itemCount: mockData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: .75,
      ),
      itemBuilder: (context, index) {
        final product = mockData[index];
        return FavoriteItemWidget(
          name: product.name,
          image: product.image,
          price: product.price,
        );
      },
    );
  }
}

class Product {
  final String name;
  final String image;
  final double price;

  Product({
    required this.name,
    required this.image,
    required this.price,
  });
}

List<Product> mockData = [
  Product(
    name: "Perfume Bottle Set",
    image:
        "https://plus.unsplash.com/premium_photo-1676748933022-e1183e997436?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8UGVyZnVtZXxlbnwwfHwwfHx8MA%3D%3D",
    price: 149.99,
  ),
  Product(
    name: "Smart Watch Case",
    image:
        "https://images.unsplash.com/photo-1557438159-51eec7a6c9e8?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fHNtYXJ0JTIwd2F0Y2h8ZW58MHx8MHx8fDA%3D",
    price: 520.00,
  ),
  Product(
    name: "Blue Jacket Set",
    image:
        "https://images.unsplash.com/photo-1727515546577-f7d82a47b51d?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8SmFja2V0JTIwU2V0fGVufDB8fDB8fHww",
    price: 420.00,
  ),
];
