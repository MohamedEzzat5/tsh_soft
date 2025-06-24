import 'package:equatable/equatable.dart';

class AddressParams extends Equatable {
  final String? id;
  final String? title;
  final String? city;
  final String? area;
  final String? details;
  final String? lat;
  final String? lng;

  const AddressParams({
    this.id,
    this.title,
    this.city,
    this.area,
    this.details,
    this.lat,
    this.lng,
  });

  AddressParams copyWith({
    final String? id,
    final String? title,
    final String? city,
    final String? area,
    final String? details,
    final String? lat,
    final String? lng,
  }) =>
      AddressParams(
        id: this.id,
        title: this.title,
        city: this.city,
        area: this.area,
        details: this.details,
        lat: this.lat,
        lng: this.lng,
      );

  @override
  List<Object?> get props => [
        id,
        title,
        city,
        area,
        details,
        lat,
        lng,
      ];
}
