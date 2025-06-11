import 'package:equatable/equatable.dart';

class ProductsParams extends Equatable {
  final int id;

  const ProductsParams({required this.id});

  @override
  List<Object?> get props => [id];
}
