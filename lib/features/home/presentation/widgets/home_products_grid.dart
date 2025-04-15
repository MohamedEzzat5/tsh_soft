import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/features/home/presentation/widgets/product_item.dart';

class HomeProductsGrid extends StatelessWidget {
  const HomeProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: mockProducts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: .75,
      ),
      itemBuilder: (context, index) {
        final product = mockProducts[index];
        return ProductItem(
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

List<Product> mockProducts = [
  Product(
    name: "Wireless Headphones",
    image: "https://images.unsplash.com/photo-1517336714731-489689fd1ca8",
    price: 249.99,
  ),
  Product(
    name: "Perfume Bottle Set",
    image: "https://images.unsplash.com/photo-1517336714731-489689fd1ca8",
    price: 149.99,
  ),
  Product(
    name: "Ceramic Coffee Mug",
    image: "https://images.unsplash.com/photo-1517336714731-489689fd1ca8",
    price: 45.00,
  ),
  Product(
    name: "Makeup Set Kit",
    image: "https://images.unsplash.com/photo-1517336714731-489689fd1ca8",
    price: 299.00,
  ),
  Product(
    name: "Smart Watch Case",
    image: "https://images.unsplash.com/photo-1517336714731-489689fd1ca8",
    price: 520.00,
  ),
  Product(
    name: "Blue Jacket Set",
    image: "https://images.unsplash.com/photo-1517336714731-489689fd1ca8",
    price: 420.00,
  ),
];
