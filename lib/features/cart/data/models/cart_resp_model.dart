import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/features/cart/domain/entities/cart_entity.dart';

class MainCartRespModel extends BaseOneResponse {
  MainCartRespModel({
    super.status,
    super.message,
    super.data,
  });

  factory MainCartRespModel.fromJson(Map<String, dynamic> json) =>
      MainCartRespModel(
        status: json['status'],
        message: json['message'],
        data: json['data'] != null ? CartModel.fromJson(json['data']) : null,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data != null ? (data as CartModel).toJson() : null,
      };
}

class CartModel extends CartEntity {
  const CartModel({
    super.id,
    super.customerId,
    super.createdAt,
    super.updatedAt,
    super.items,
    super.total,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json['id'],
        customerId: json['customer_id'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        total: json['total'],
        items: json['items'] == null
            ? []
            : List<CartItemModel>.from(
                json['items'].map((x) => CartItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'customer_id': customerId,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'items': items == null
            ? []
            : List<dynamic>.from(
                items!.map((x) => (x as CartItemModel).toJson())),
      };
}

class CartItemModel extends CartItemEntity {
  const CartItemModel({
    super.id,
    super.cartId,
    super.productId,
    super.quantity,
    super.price,
    super.createdAt,
    super.updatedAt,
    super.product,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        id: json['id'],
        cartId: json['cart_id'],
        productId: json['product_id'],
        quantity: json['quantity'],
        price: json['price'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
        product: json['product'] != null
            ? ProductModel.fromJson(json['product'])
            : null,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'cart_id': cartId,
        'product_id': productId,
        'quantity': quantity,
        'price': price,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'product': product != null ? (product as ProductModel).toJson() : null,
      };
}

class ProductModel extends CartProductEntity {
  const ProductModel({
    super.id,
    super.categoryId,
    super.name,
    super.description,
    super.price,
    super.discount,
    super.stock,
    super.image,
    super.createdAt,
    super.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        categoryId: json['category_id'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        discount: json['discount'],
        stock: json['stock'],
        image: json['image'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'category_id': categoryId,
        'name': name,
        'description': description,
        'price': price,
        'discount': discount,
        'stock': stock,
        'image': image,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
