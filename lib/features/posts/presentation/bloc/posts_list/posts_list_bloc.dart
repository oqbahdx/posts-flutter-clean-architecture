import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:posts/core/errors/failures.dart';
import '../../../domain/usecases/delete_post_usecase.dart';
import '../../../domain/usecases/get_posts_usecase.dart';
import 'posts_list_event.dart';
import 'posts_list_state.dart';

@injectable
class PostsListBloc extends Bloc<PostsListEvent, PostsListState> {
  final GetPostsUseCase _getPosts;
  final DeletePostUseCase _deletePost;

  PostsListBloc(this._getPosts, this._deletePost) : super(const PostsListState()) {
    on<PostsListEvent>((event, emit) async {
      await event.when(
        started: () => _fetch(emit, reset: true),
        refreshed: () => _fetch(emit, reset: true),
        loadMore: () => _fetch(emit, reset: false),
        deleted: (id) => _delete(emit, id),
      );
    });
  }

  Future<void> _fetch(Emitter<PostsListState> emit, {required bool reset}) async {
    if (state.hasReachedMax && !reset) return;

    final nextPage = reset ? 1 : state.page + 1;
    emit(state.copyWith(
      status: reset ? PostsStatus.loading : PostsStatus.loadingMore,
      errorMessage: null,
    ));

    final res = await _getPosts(GetPostsParams(page: nextPage, pageSize: state.pageSize));
    res.fold(
      (f) => emit(state.copyWith(status: PostsStatus.failure, errorMessage: f.displayMessage)),
      (paged) {
        emit(state.copyWith(
          status: PostsStatus.success,
          posts: reset ? paged.items : [...state.posts, ...paged.items],
          page: paged.page,
          hasReachedMax: !paged.hasNextPage,
        ));
      },
    );
  }

  Future<void> _delete(Emitter<PostsListState> emit, String id) async {
    final res = await _deletePost(id);
    res.fold(
      (f) => emit(state.copyWith(status: PostsStatus.failure, errorMessage: f.displayMessage)),
      (_) => emit(state.copyWith(
        posts: state.posts.where((p) => p.id != id).toList(),
      )),
    );
  }
}
