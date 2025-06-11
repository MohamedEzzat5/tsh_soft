import 'package:equatable/equatable.dart';

class ResetPasswordParams extends Equatable {
  final String? email;
  final String? code;

  const ResetPasswordParams({
    required this.email,
    required this.code,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'code': code,
      };

  @override
  List<Object?> get props => <Object?>[
        email,
        code,
      ];
}
