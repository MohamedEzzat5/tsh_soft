import 'package:equatable/equatable.dart';

class UpdateProfileParams extends Equatable {
  final String? name;
  final String? email;
  final String? city;
  final String? photoPath; 

  UpdateProfileParams({
    this.email,
    this.name,
    this.city,
    this.photoPath,
  });
  
  @override
  List<Object?> get props => [name, email, city, photoPath];
}
