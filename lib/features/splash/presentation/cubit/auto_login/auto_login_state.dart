part of 'auto_login_cubit.dart';

class AutoLoginState extends Equatable {
  final UserType userType;
  final String? message;

  const AutoLoginState({
    this.userType = UserType.firstOpen,
    this.message,
  });

  @override
  List<Object?> get props => <Object?>[userType, message];
}
