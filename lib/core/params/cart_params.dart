import 'package:equatable/equatable.dart';

class CartParams extends Equatable {
  final int? productId;
  final int? quantity;

  const CartParams({
     this.productId,
     this.quantity,
  });

  @override
  List<Object?> get props => [productId, quantity];
}