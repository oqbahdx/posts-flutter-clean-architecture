import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:posts/core/errors/failures.dart';
import '../../../domain/entities/post_entity.dart';
import '../../../domain/usecases/get_post_by_id_usecase.dart';

part 'post_detail_bloc.freezed.dart';

@freezed
abstract class PostDetailEvent with _$PostDetailEvent {
  const factory PostDetailEvent.load(String id) = _Load;
}

@freezed
class PostDetailState with _$PostDetailState {
  const factory PostDetailState.initial() = _Initial;
  const factory PostDetailState.loading() = _Loading;
  const factory PostDetailState.loaded(PostEntity post) = _Loaded;
  const factory PostDetailState.error(String message) = _Error;
}

@injectable
class PostDetailBloc extends Bloc<PostDetailEvent, PostDetailState> {
  final GetPostByIdUseCase _getPostById;

  PostDetailBloc(this._getPostById) : super(const PostDetailState.initial()) {
    on<PostDetailEvent>((event, emit) async {
      await event.when(
        load: (id) async {
          emit(const PostDetailState.loading());
          final res = await _getPostById(id);
          res.fold(
            (f) => emit(PostDetailState.error(f.displayMessage)),
            (p) => emit(PostDetailState.loaded(p)),
          );
        },
      );
    });
  }
}
