import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  final int? id;
  final int? customerId;
  final String? createdAt;
  final String? updatedAt;
  final int? total;
  final List<CartItemEntity>? items;

  const CartEntity({
    this.id,
    this.customerId,
    this.createdAt,
    this.updatedAt,
    this.items,
    this.total
  });

  @override
  List<Object?> get props => [id, customerId, createdAt, updatedAt, items,total,];
}

class CartItemEntity extends Equatable {
  final int? id;
  final int? cartId;
  final int? productId;
  final int? quantity;
  final String? price;
  final String? createdAt;
  final String? updatedAt;
  final CartProductEntity? product;

  const CartItemEntity({
    this.id,
    this.cartId,
    this.productId,
    this.quantity,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  @override
  List<Object?> get props =>
      [id, cartId, productId, quantity, price, createdAt, updatedAt, product];
}

class CartProductEntity extends Equatable {
  final int? id;
  final int? categoryId;
  final String? name;
  final String? description;
  final String? price;
  final int? discount;
  final int? stock;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  const CartProductEntity({
    this.id,
    this.categoryId,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.stock,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        categoryId,
        name,
        description,
        price,
        discount,
        stock,
        image,
        createdAt,
        updatedAt
      ];
}
