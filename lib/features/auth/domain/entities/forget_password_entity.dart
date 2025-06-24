import 'package:equatable/equatable.dart';

class ForgotPasswordEntity extends Equatable {
  final int? token;

  const ForgotPasswordEntity({this.token});

  @override
  List<Object?> get props => [token];
}
