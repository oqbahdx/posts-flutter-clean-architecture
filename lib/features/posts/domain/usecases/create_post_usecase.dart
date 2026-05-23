import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:posts/core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/post_entity.dart';
import '../repositories/posts_repository.dart';

class CreatePostParams extends Equatable {
  final String title;
  final String description;
  const CreatePostParams({required this.title, required this.description});
  @override
  List<Object?> get props => [title, description];
}

@lazySingleton
class CreatePostUseCase implements UseCase<PostEntity, CreatePostParams> {
  final PostsRepository _repo;
  CreatePostUseCase(this._repo);

  @override
  Future<Either<Failure, PostEntity>> call(CreatePostParams p) =>
      _repo.createPost(title: p.title, description: p.description);
}
