import 'package:equatable/equatable.dart';

class BaseOneResponse extends Equatable {
  const BaseOneResponse({
    this.data,
    this.message,
    this.status,
    this.statusCode,
  });

  final dynamic data;
  final String? message;
  final bool? status;
  final num? statusCode;

  @override
  List<Object?> get props => [
        data,
        message,
        status,
        statusCode,
      ];
}
