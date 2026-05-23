import 'package:dartz/dartz.dart';
import 'package:posts/core/errors/failures.dart';
import '../entities/paged_result_entity.dart';
import '../entities/post_entity.dart';

abstract class PostsRepository {
  Future<Either<Failure, PagedResultEntity<PostEntity>>> getPosts({required int page, required int pageSize});
  Future<Either<Failure, PostEntity>> getPostById(String id);
  Future<Either<Failure, PostEntity>> createPost({required String title, required String description});
  Future<Either<Failure, PostEntity>> updatePost({required String id, required String title, required String description});
  Future<Either<Failure, Unit>> deletePost(String id);
}
