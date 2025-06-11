import 'package:dio/dio.dart';
import 'package:tsh_soft/core/api/end_points.dart';
import 'package:tsh_soft/core/error/exceptions.dart';
import 'package:tsh_soft/core/params/update_profile_params.dart';
import 'package:tsh_soft/features/profile/data/models/profile_resp_model.dart';
import 'package:tsh_soft/features/profile/data/models/update_profile_resp_model.dart';
import 'package:tsh_soft/injection_container.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileRespModel> getProfile();
  Future<UpdateProfileRespModel> updateProfile(
      {required UpdateProfileParams params});
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  @override
  Future<ProfileRespModel> getProfile() async {
    try {
      final response = await dioConsumer.get(EndPoints.getProfile);

      if (response['status'] == true) {
        return ProfileRespModel.fromJson(response);
      }

      throw ServerException(message: response['message'] ?? 'Unexpected error');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UpdateProfileRespModel> updateProfile({
    required UpdateProfileParams params,
  }) async {
    final formData = FormData();

    formData.fields.addAll([
      MapEntry('name', params.name ?? ''),
      MapEntry('email', params.email ?? ''),
      MapEntry('city', params.city ?? ''),
    ]);

    if (params.photoPath != null) {
      formData.files.add(
        MapEntry(
          'photo',
          await MultipartFile.fromFile(
            params.photoPath!,
            filename: params.photoPath!.split('/').last,
          ),
        ),
      );
    }

    try {
      final response = await dioConsumer.post(
        EndPoints.updateProfile,
        formData: formData,
      );

      if (response['status'] == true) {
        return UpdateProfileRespModel.fromJson(response);
      }

      throw ServerException(message: response['message'] ?? 'Unexpected error');
    } catch (e) {
      rethrow;
    }
  }
}
