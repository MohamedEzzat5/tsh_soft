import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/features/address/data/models/get_addresses_resp_model.dart';
import 'package:tsh_soft/injection_container.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/params/address_params.dart';
import '../../../../core/utils/log_utils.dart' as log;
import '../../domain/repository/address_repositry.dart';
import '../data_source/address_remote_data_source.dart';
import '../models/add_new_address_response_model.dart';
import '../models/delete_address_resp_model.dart';

class AddressRepositoryImpl extends AddressRepository {
  final AddressRemoteDataSource addressRemoteDataSource;

  AddressRepositoryImpl({required this.addressRemoteDataSource});

  @override
  Future<Either<Failure, GetAddressesRespModel>> getAddresses() async {
    if (await networkInfo.isConnected) {
      try {
        GetAddressesRespModel response =
            await addressRemoteDataSource.getAddresses();
        return Right(response);
      } on AppException catch (error) {
        log.Log.e(
            '[getAddedLocations] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: "No internet connection"));
    }
  }

  @override
  Future<Either<Failure, AddNewAddressRespModel>> addAddress(params) async {
    if (await networkInfo.isConnected) {
      try {
        AddNewAddressRespModel response =
            await addressRemoteDataSource.addAddress(params);
        return Right(response);
      } on AppException catch (error) {
        log.Log.e(
            '[addLocation] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: "No internet connection"));
    }
  }

  @override
  Future<Either<Failure, DeleteAddressRespModel>> deleteAddress(
      AddressParams params) async {
    if (await networkInfo.isConnected) {
      try {
        DeleteAddressRespModel response =
            await addressRemoteDataSource.deleteAddress(params);
        return Right(response);
      } on AppException catch (error) {
        log.Log.e(
            '[deleteLocation] [${error.runtimeType.toString()}] ---- ${error.message}');
        return Left(error.toFailure());
      }
    } else {
      return Left(NetworkFailure(message: "No internet connection"));
    }
  }
}
