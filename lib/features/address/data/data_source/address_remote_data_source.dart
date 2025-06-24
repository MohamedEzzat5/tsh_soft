import 'package:tsh_soft/core/error/exceptions.dart';
import 'package:tsh_soft/core/params/address_params.dart';
import 'package:tsh_soft/injection_container.dart';

import '../models/add_new_address_response_model.dart';
import '../models/delete_address_resp_model.dart';
import '../models/get_addresses_resp_model.dart';

abstract class AddressRemoteDataSource {
  Future<GetAddressesRespModel> getAddresses();
  Future<AddNewAddressRespModel> addAddress(AddressParams params);
  Future<DeleteAddressRespModel> deleteAddress(AddressParams params);
}

class LocationRemoteDataSourceImpl extends AddressRemoteDataSource {
  @override
  Future<GetAddressesRespModel> getAddresses() async {
    try {
      final response = await dioConsumer.get('/addresses');
      if (response['status'] == true) {
        return GetAddressesRespModel.fromJson(response);
      }
      throw ServerException(message: response['message'] ?? '');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AddNewAddressRespModel> addAddress(AddressParams params) async {
    try {
      Map<String, dynamic> body = {
        'title': params.title,
        'city': params.city,
        'area': params.area,
        'details': params.details,
      };

      final response = await dioConsumer.post(
        '/addresses',
        body: body,
      );
      if (response['status'] == true) {
        return AddNewAddressRespModel.fromJson(response);
      }
      throw ServerException(message: response['message'] ?? '');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<DeleteAddressRespModel> deleteAddress(AddressParams params) async {
    try {
      final response = await dioConsumer.delete('/addresses/${params.id}');
      if (response['status'] == true) {
        return DeleteAddressRespModel.fromJson(response);
      }
      throw ServerException(message: response['message'] ?? '');
    } catch (e) {
      rethrow;
    }
  }
}
