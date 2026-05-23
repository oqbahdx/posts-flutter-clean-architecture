import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:posts/core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/paged_result_entity.dart';
import '../entities/post_entity.dart';
import '../repositories/posts_repository.dart';

class GetPostsParams extends Equatable {
  final int page;
  final int pageSize;
  const GetPostsParams({required this.page, required this.pageSize});
  @override
  List<Object?> get props => [page, pageSize];
}

@lazySingleton
class GetPostsUseCase implements UseCase<PagedResultEntity<PostEntity>, GetPostsParams> {
  final PostsRepository _repo;
  GetPostsUseCase(this._repo);

  @override
  Future<Either<Failure, PagedResultEntity<PostEntity>>> call(GetPostsParams params) =>
      _repo.getPosts(page: params.page, pageSize: params.pageSize);
}
