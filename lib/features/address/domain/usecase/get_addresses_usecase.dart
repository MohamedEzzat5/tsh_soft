import 'package:dartz/dartz.dart';
import 'package:tsh_soft/core/base_classes/base_list_response.dart';
import 'package:tsh_soft/core/error/failures.dart';
import 'package:tsh_soft/core/usecases/usecase.dart';
import 'package:tsh_soft/features/address/domain/repository/address_repositry.dart';

class GetAddressesUseCase extends UseCase<BaseListResponse, NoParams> {
  final AddressRepository locationRepository;

  GetAddressesUseCase({required this.locationRepository});
  @override
  Future<Either<Failure, BaseListResponse>> call(NoParams params) async =>
      await locationRepository.getAddresses();
}
