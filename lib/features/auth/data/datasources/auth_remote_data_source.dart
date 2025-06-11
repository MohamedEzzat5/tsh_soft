import 'package:tsh_soft/core/api/end_points.dart';
import 'package:tsh_soft/core/error/exceptions.dart';
import 'package:tsh_soft/core/params/auth_params.dart';
import 'package:tsh_soft/features/auth/data/models/login_resp_model.dart';
import 'package:tsh_soft/features/auth/data/models/register_resp_model.dart';
import 'package:tsh_soft/injection_container.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterRespModel> register({required AuthParams params});
  Future<LoginRespModel> login({required AuthParams params});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<RegisterRespModel> register({required AuthParams params}) async {
    final Map<String, dynamic> body = {
      'name': params.name,
      'email': params.email,
      'password': params.password,
      'password_confirmation': params.passwordConfirmation,
      'phone': params.phone,
    };
    try {
      final dynamic response = await dioConsumer.post(
        EndPoints.register,
        body: body,
      );

      if (response['status'] == true) {
        return RegisterRespModel.fromJson(response);
      }
      throw ServerException(message: response['message'] ?? '');
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<LoginRespModel> login({required AuthParams params}) async {
    final Map<String, dynamic> body = {
      'email': params.email,
      'password': params.password,
    };
    try {
      final dynamic response = await dioConsumer.post(
        EndPoints.login,
        body: body,
      );
      if (response['status'] == true) {
        return LoginRespModel.fromJson(response);
      }
      throw ServerException(message: response['message'] ?? '');
    } catch (error) {
      rethrow;
    }
  }
}
