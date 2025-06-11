import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/features/products/domain/entities/product_entity_model.dart';

class ProductDetailsRespModel extends BaseOneResponse {
  ProductDetailsRespModel({
    required super.data,
  });

  factory ProductDetailsRespModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsRespModel(
      data: json['data'] != null
          ? ProductModel.fromJson(json['data']) 
          : null,
    );
  }
}

class ProductModel extends ProductEntity {
  const ProductModel({
    super.id,
    super.name,
    super.description,
    super.price,
    super.discount,
    super.stock,
    super.image,
    super.category,
    super.isFavorite,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      discount: json['discount'],
      stock: json['stock'],
      image: json['image'],
      isFavorite: json['is_favorited'],

      category: json['category'] != null
          ? ProductCategoryModel.fromJson(json['category'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'stock': stock,
      'image': image,
      'is_favorited': isFavorite,
      'category':
          category != null ? (category as ProductCategoryModel).toJson() : null,
    };
  }
}

class ProductCategoryModel extends ProductCategoryEntity {
  const ProductCategoryModel({
    super.id,
    super.name,
  });

  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    return ProductCategoryModel(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
