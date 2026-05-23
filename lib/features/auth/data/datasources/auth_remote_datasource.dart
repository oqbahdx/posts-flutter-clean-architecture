import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:posts/core/errors/exceptions.dart';
import '../../../../core/constants/api_constants.dart';
import '../models/auth_response_model.dart';
import '../models/login_request_model.dart';
import '../models/register_request_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login(LoginRequestModel request);
  Future<AuthResponseModel> register(RegisterRequestModel request);
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;
  AuthRemoteDataSourceImpl(this._dio);

  @override
  Future<AuthResponseModel> login(LoginRequestModel request) async {
    try {
      final res = await _dio.post(ApiConstants.login, data: request.toJson());
      return AuthResponseModel.fromJson(res.data);
    } on DioException catch (e) {
      throw _handle(e);
    }
  }

  @override
  Future<AuthResponseModel> register(RegisterRequestModel request) async {
    try {
      final res = await _dio.post(ApiConstants.register, data: request.toJson());
      return AuthResponseModel.fromJson(res.data);
    } on DioException catch (e) {
      throw _handle(e);
    }
  }

  Exception _handle(DioException e) {
    if (e.response?.statusCode == 401) {
      return UnauthorizedException(e.response?.data?['error'] ?? 'Invalid credentials');
    }
    final msg = e.response?.data is Map
        ? (e.response?.data['error'] ?? e.response?.data['detail'] ?? e.message)
        : e.message;
    return ServerException(msg ?? 'Server error', statusCode: e.response?.statusCode);
  }
}
