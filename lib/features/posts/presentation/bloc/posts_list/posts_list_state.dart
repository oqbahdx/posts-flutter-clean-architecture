import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/post_entity.dart';

part 'posts_list_state.freezed.dart';

enum PostsStatus { initial, loading, success, failure, loadingMore }

@freezed
abstract class PostsListState with _$PostsListState {
  const factory PostsListState({
    @Default(PostsStatus.initial) PostsStatus status,
    @Default([]) List<PostEntity> posts,
    @Default(1) int page,
    @Default(10) int pageSize,
    @Default(false) bool hasReachedMax,
    String? errorMessage,
  }) = _PostsListState;
}
