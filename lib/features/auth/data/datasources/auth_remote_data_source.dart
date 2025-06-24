import 'package:dio/dio.dart';
import 'package:tsh_soft/core/api/end_points.dart';
import 'package:tsh_soft/core/error/exceptions.dart';
import 'package:tsh_soft/core/params/auth_params.dart';
import 'package:tsh_soft/features/auth/data/models/delete_account_resp_model.dart';
import 'package:tsh_soft/features/auth/data/models/forget_password_resp_model.dart';
import 'package:tsh_soft/features/auth/data/models/login_resp_model.dart';
import 'package:tsh_soft/features/auth/data/models/logout_model.dart';
import 'package:tsh_soft/features/auth/data/models/reaet_password_resp_model.dart';
import 'package:tsh_soft/features/auth/data/models/register_resp_model.dart';
import 'package:tsh_soft/features/auth/data/models/verify_otp_resp_model.dart';
import 'package:tsh_soft/injection_container.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterRespModel> register({required AuthParams params});
  Future<LoginRespModel> login({required AuthParams params});
  Future<ForgotPasswordRespModel> forgotPassword({required AuthParams params});
  Future<VerifyOtpRespModel> verifyOtp({required AuthParams params});
  Future<ResetPasswordRespModel> resetPassword({required AuthParams params});
  Future<LogOutRespModel> logout();

  Future<DeleteAccountRespModel> deleteAccount();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<RegisterRespModel> register({required AuthParams params}) async {
    final FormData formData = FormData();
    formData.fields.addAll([
      MapEntry('name', params.name ?? ''),
      MapEntry('email', params.email ?? ''),
      MapEntry('password', params.password ?? ''),
      MapEntry('password_confirmation', params.passwordConfirmation ?? ''),
      MapEntry('phone', params.phone ?? ''),
    ]);
    if (params.photo != null) {
      if (params.photo != null) {
        formData.files.add(
          MapEntry(
            'photo',
            await MultipartFile.fromFile(
              params.photo!,
              filename: params.photo!.split('/').last,
            ),
          ),
        );
      }
    }
    try {
      final dynamic response = await dioConsumer.post(
        EndPoints.register,
        formData: formData,
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

  @override
  Future<ForgotPasswordRespModel> forgotPassword(
      {required AuthParams params}) async {
    try {
      Map<String, dynamic> body = {
        'email': params.email != null ? params.email : null,
      };
      final response = await dioConsumer.post(
        '/forgot-password',
        body: body,
      );
      if (response['status'] == true) {
        return ForgotPasswordRespModel.fromJson(response);
      }
      throw ServerException(message: response['message'] ?? '');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<VerifyOtpRespModel> verifyOtp({required AuthParams params}) async {
    try {
      Map<String, dynamic> body = {
        'email': params.email,
        'otp': params.otp,
      };
      final response = await dioConsumer.post(
        '/verify-otp',
        body: body,
      );
      if (response['status'] == true) {
        return VerifyOtpRespModel.fromJson(response);
      }
      throw ServerException(message: response['message'] ?? '');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ResetPasswordRespModel> resetPassword(
      {required AuthParams params}) async {
    try {
      Map<String, dynamic> body = {
        'email': params.email,
        'otp': params.otp,
        'password': params.password,
        'password_confirmation': params.passwordConfirmation,
      };
      final response = await dioConsumer.post(
        '/reset-password',
        body: body,
      );
      if (response['status'] == true) {
        return ResetPasswordRespModel.fromJson(response);
      }
      throw ServerException(message: response['message'] ?? '');
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  Future<DeleteAccountRespModel> deleteAccount() async {
  
    try {
      final dynamic response = await dioConsumer.get(
        '/delete',
      );
      if (response['status'] == true) {
        return DeleteAccountRespModel.fromJson(response);
      }
      throw ServerException(message: response['message'] ?? '');
    } catch (error) {
      rethrow;
    }
  }
  
  @override
  Future<LogOutRespModel> logout() async {
    try {
      final dynamic response = await dioConsumer.get(
        '/logout',
      );
      if (response['status'] == true) {
        return LogOutRespModel.fromJson(response);
      }
      throw ServerException(message: response['message'] ?? '');
    } catch (error) {
      rethrow;
    }
  }
}
