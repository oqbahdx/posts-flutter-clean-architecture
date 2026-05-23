import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:posts/core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/post_entity.dart';
import '../repositories/posts_repository.dart';

class UpdatePostParams extends Equatable {
  final String id;
  final String title;
  final String description;
  const UpdatePostParams({required this.id, required this.title, required this.description});
  @override
  List<Object?> get props => [id, title, description];
}

@lazySingleton
class UpdatePostUseCase implements UseCase<PostEntity, UpdatePostParams> {
  final PostsRepository _repo;
  UpdatePostUseCase(this._repo);

  @override
  Future<Either<Failure, PostEntity>> call(UpdatePostParams p) =>
      _repo.updatePost(id: p.id, title: p.title, description: p.description);
}
