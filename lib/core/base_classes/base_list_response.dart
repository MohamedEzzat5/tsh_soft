import 'package:equatable/equatable.dart';

import '/core/base_classes/pagination.dart';

class BaseListResponse extends Equatable {
  const BaseListResponse({
    this.data,
    this.message,
    this.status,
    this.pagination,
    this.statusCode,
  });

  final List<dynamic>? data;
  final String? message;
  final bool? status;
  final Pagination? pagination;
  final num? statusCode;

  @override
  List<Object?> get props => [
        data,
        message,
        status,
        pagination,
        statusCode,
      ];
}
