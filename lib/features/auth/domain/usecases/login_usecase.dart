import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:posts/core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/auth_entity.dart';
import '../repositories/auth_repository.dart';

class LoginParams extends Equatable {
  final String email;
  final String password;
  const LoginParams({required this.email, required this.password});
  @override
  List<Object?> get props => [email, password];
}

@lazySingleton
class LoginUseCase implements UseCase<AuthEntity, LoginParams> {
  final AuthRepository _repo;
  LoginUseCase(this._repo);

  @override
  Future<Either<Failure, AuthEntity>> call(LoginParams params) =>
      _repo.login(email: params.email, password: params.password);
}
