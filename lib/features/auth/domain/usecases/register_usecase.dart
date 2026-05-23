import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:posts/core/errors/failures.dart';
import 'package:posts/core/usecase/usecase.dart';
import '../entities/auth_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterParams extends Equatable {
  final String email;
  final String password;
  const RegisterParams({required this.email, required this.password});
  @override
  List<Object?> get props => [email, password];
}

@lazySingleton
class RegisterUseCase implements UseCase<AuthEntity, RegisterParams> {
  final AuthRepository _repo;
  RegisterUseCase(this._repo);

  @override
  Future<Either<Failure, AuthEntity>> call(RegisterParams params) =>
      _repo.register(email: params.email, password: params.password);
}
