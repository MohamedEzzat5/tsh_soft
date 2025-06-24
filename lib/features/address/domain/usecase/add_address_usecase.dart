import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_one_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/params/address_params.dart';
import 'package:tsh_soft/core/usecases/usecase.dart';
import 'package:tsh_soft/features/address/domain/repository/address_repositry.dart';

class AddAddressUseCase extends UseCase<BaseOneResponse, AddressParams> {
  final AddressRepository locationRepository;

  AddAddressUseCase({required this.locationRepository});
  @override
  Future<Either<Failure, BaseOneResponse>> call(AddressParams params) async =>
      await locationRepository.addAddress(params);
}
