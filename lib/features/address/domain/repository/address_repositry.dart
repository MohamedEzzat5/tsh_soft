import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_list_response.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/address_params.dart';

abstract class AddressRepository {
  Future<Either<Failure, BaseListResponse>> getAddresses();
  Future<Either<Failure, BaseOneResponse>> addAddress(AddressParams params);
  Future<Either<Failure, BaseOneResponse>> deleteAddress(AddressParams params);
}
