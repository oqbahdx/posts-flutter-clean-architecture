import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:posts/core/errors/failures.dart';

import '../../../../core/usecase/usecase.dart';
import '../entities/post_entity.dart';
import '../repositories/posts_repository.dart';

@lazySingleton
class GetPostByIdUseCase implements UseCase<PostEntity, String> {
  final PostsRepository _repo;
  GetPostByIdUseCase(this._repo);

  @override
  Future<Either<Failure, PostEntity>> call(String id) => _repo.getPostById(id);
}
