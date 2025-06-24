import 'package:equatable/equatable.dart';
import 'package:tsh_soft/features/address/domain/entities/address_entity.dart';
import 'package:tsh_soft/features/cart/domain/entities/cart_entity.dart';

class OrderEntity extends Equatable {
  final int? id;
  final int? customerId;
  final String? addressId;
  final int? cartId;
  final String? status;
  final String? total;
  final String? createdAt;
  final String? updatedAt;
  final String? note;
  final CartEntity? cart; 
  final AddressEntity? address;

  const OrderEntity({
    this.id,
    this.customerId,
    this.addressId,
    this.cartId,
    this.status,
    this.total,
    this.createdAt,
    this.updatedAt,
    this.note,
    this.cart,
    this.address,
  });

  @override
  List<Object?> get props => [
        id,
        customerId,
        addressId,
        cartId,
        status,
        total,
        createdAt,
        updatedAt,
        note,
        cart,
        address,
      ];
}
