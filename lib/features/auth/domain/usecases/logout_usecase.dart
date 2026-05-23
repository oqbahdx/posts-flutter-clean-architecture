import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:posts/core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class LogoutUseCase implements UseCase<Unit, NoParams> {
  final AuthRepository _repo;
  LogoutUseCase(this._repo);

  @override
  Future<Either<Failure, Unit>> call(NoParams params) => _repo.logout();
}
