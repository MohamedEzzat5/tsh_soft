import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final dynamic price;
  final int? discount;
  final int? stock;
  final String? image;
  final ProductCategoryEntity? category;
  final bool? isFavorite;

  const ProductEntity({
    this.id,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.stock,
    this.image,
    this.category,
    this.isFavorite,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        discount,
        stock,
        image,
        category,
        isFavorite,
      ];
}

class ProductCategoryEntity extends Equatable {
  final int? id;
  final String? name;

  const ProductCategoryEntity({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
