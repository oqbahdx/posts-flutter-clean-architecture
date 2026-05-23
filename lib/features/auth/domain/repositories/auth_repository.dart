import 'package:dartz/dartz.dart';
import 'package:posts/core/errors/failures.dart';
import 'package:posts/features/auth/domain/entities/auth_entity.dart';


abstract class AuthRepository {
  Future<Either<Failure, AuthEntity>> login({required String email, required String password});
  Future<Either<Failure, AuthEntity>> register({required String email, required String password});
  Future<Either<Failure, Unit>> logout();
  Future<bool> isLoggedIn();
}
