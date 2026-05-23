import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:posts/core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/posts_repository.dart';

@lazySingleton
class DeletePostUseCase implements UseCase<Unit, String> {
  final PostsRepository _repo;
  DeletePostUseCase(this._repo);

  @override
  Future<Either<Failure, Unit>> call(String id) => _repo.deletePost(id);
}
