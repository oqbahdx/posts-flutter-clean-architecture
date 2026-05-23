import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:posts/core/errors/exceptions.dart';
import 'package:posts/core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/paged_result_entity.dart';
import '../../domain/entities/post_entity.dart';
import '../../domain/repositories/posts_repository.dart';
import '../datasources/posts_remote_datasource.dart';
import '../models/create_post_request_model.dart';
import '../models/update_post_request_model.dart';

@LazySingleton(as: PostsRepository)
class PostsRepositoryImpl implements PostsRepository {
  final PostsRemoteDataSource _remote;
  final NetworkInfo _network;

  PostsRepositoryImpl(this._remote, this._network);

  Future<Either<Failure, T>> _guard<T>(Future<T> Function() action) async {
    if (!await _network.isConnected) return const Left(Failure.network());
    try {
      return Right(await action());
    } on UnauthorizedException catch (e) {
      return Left(Failure.unauthorized(message: e.message));
    } on ServerException catch (e) {
      return Left(Failure.server(message: e.message, statusCode: e.statusCode));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PagedResultEntity<PostEntity>>> getPosts({required int page, required int pageSize}) =>
      _guard(() async => (await _remote.getPosts(page: page, pageSize: pageSize)).toEntity());

  @override
  Future<Either<Failure, PostEntity>> getPostById(String id) =>
      _guard(() async => (await _remote.getPostById(id)).toEntity());

  @override
  Future<Either<Failure, PostEntity>> createPost({required String title, required String description}) =>
      _guard(() async => (await _remote.createPost(
            CreatePostRequestModel(title: title, description: description),
          )).toEntity());

  @override
  Future<Either<Failure, PostEntity>> updatePost({required String id, required String title, required String description}) =>
      _guard(() async => (await _remote.updatePost(
            id,
            UpdatePostRequestModel(title: title, description: description),
          )).toEntity());

  @override
  Future<Either<Failure, Unit>> deletePost(String id) =>
      _guard(() async {
        await _remote.deletePost(id);
        return unit;
      });
}
