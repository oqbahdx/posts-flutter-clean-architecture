import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:posts/core/errors/exceptions.dart';
import 'package:posts/core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/storage/secure_storage_service.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/login_request_model.dart';
import '../models/register_request_model.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remote;
  final SecureStorageService _storage;
  final NetworkInfo _network;

  AuthRepositoryImpl(this._remote, this._storage, this._network);

  @override
  Future<Either<Failure, AuthEntity>> login({required String email, required String password}) async {
    if (!await _network.isConnected) return const Left(Failure.network());
    try {
      final res = await _remote.login(LoginRequestModel(email: email, password: password));
      await _persist(res.toEntity());
      return Right(res.toEntity());
    } on UnauthorizedException catch (e) {
      return Left(Failure.unauthorized(message: e.message));
    } on ServerException catch (e) {
      return Left(Failure.server(message: e.message, statusCode: e.statusCode));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> register({required String email, required String password}) async {
    if (!await _network.isConnected) return const Left(Failure.network());
    try {
      final res = await _remote.register(RegisterRequestModel(email: email, password: password));
      // Do not persist credentials on sign-up; require explicit login after registration.
      return Right(res.toEntity());
    } on ServerException catch (e) {
      return Left(Failure.server(message: e.message, statusCode: e.statusCode));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await _storage.clear();
      return const Right(unit);
    } catch (e) {
      return Left(Failure.cache(message: e.toString()));
    }
  }

  @override
  Future<bool> isLoggedIn() => _storage.hasToken();

  Future<void> _persist(AuthEntity e) async {
    await _storage.saveToken(e.token);
    await _storage.saveUserId(e.userId);
    await _storage.saveEmail(e.email);
  }
}
