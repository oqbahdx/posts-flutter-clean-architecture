import 'package:freezed_annotation/freezed_annotation.dart';

part 'posts_list_event.freezed.dart';

@freezed
class PostsListEvent with _$PostsListEvent {
  const factory PostsListEvent.started() = _Started;
  const factory PostsListEvent.refreshed() = _Refreshed;
  const factory PostsListEvent.loadMore() = _LoadMore;
  const factory PostsListEvent.deleted(String id) = _Deleted;
}
