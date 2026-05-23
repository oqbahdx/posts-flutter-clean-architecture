import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:posts/core/errors/exceptions.dart';
import '../../../../core/constants/api_constants.dart';
import '../models/create_post_request_model.dart';
import '../models/paged_result_model.dart';
import '../models/post_model.dart';
import '../models/update_post_request_model.dart';

abstract class PostsRemoteDataSource {
  Future<PagedResultModel> getPosts({required int page, required int pageSize});
  Future<PostModel> getPostById(String id);
  Future<PostModel> createPost(CreatePostRequestModel req);
  Future<PostModel> updatePost(String id, UpdatePostRequestModel req);
  Future<void> deletePost(String id);
}

@LazySingleton(as: PostsRemoteDataSource)
class PostsRemoteDataSourceImpl implements PostsRemoteDataSource {
  final Dio _dio;
  PostsRemoteDataSourceImpl(this._dio);

  @override
  Future<PagedResultModel> getPosts({required int page, required int pageSize}) async {
    try {
      final res = await _dio.get(ApiConstants.posts, queryParameters: {
        'page': page,
        'pageSize': pageSize,
      });
      return PagedResultModel.fromJson(res.data);
    } on DioException catch (e) {
      throw _handle(e);
    }
  }

  @override
  Future<PostModel> getPostById(String id) async {
    try {
      final res = await _dio.get(ApiConstants.postById(id));
      return PostModel.fromJson(res.data);
    } on DioException catch (e) {
      throw _handle(e);
    }
  }

  @override
  Future<PostModel> createPost(CreatePostRequestModel req) async {
    try {
      final res = await _dio.post(ApiConstants.posts, data: req.toJson());
      return PostModel.fromJson(res.data);
    } on DioException catch (e) {
      throw _handle(e);
    }
  }

  @override
  Future<PostModel> updatePost(String id, UpdatePostRequestModel req) async {
    try {
      final res = await _dio.put(ApiConstants.postById(id), data: req.toJson());
      return PostModel.fromJson(res.data);
    } on DioException catch (e) {
      throw _handle(e);
    }
  }

  @override
  Future<void> deletePost(String id) async {
    try {
      await _dio.delete(ApiConstants.postById(id));
    } on DioException catch (e) {
      throw _handle(e);
    }
  }

  Exception _handle(DioException e) {
    if (e.response?.statusCode == 401) return UnauthorizedException();
    final msg = e.response?.data is Map
        ? (e.response?.data['error'] ?? e.response?.data['detail'] ?? e.message)
        : e.message;
    return ServerException(msg ?? 'Server error', statusCode: e.response?.statusCode);
  }
}
