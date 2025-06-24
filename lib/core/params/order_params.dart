import 'package:equatable/equatable.dart';

class OrderParams extends Equatable {
  final String? status;
  final String? addressId;
  final int? cartId;
  final String? note;

  const OrderParams({
    this.status,
    this.addressId,
    this.cartId,
    this.note,
  });

  @override
  List<Object?> get props => [
        status,
        addressId,
        cartId,
        note,
      ];
}
