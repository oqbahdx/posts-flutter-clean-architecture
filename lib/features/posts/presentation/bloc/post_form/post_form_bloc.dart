import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:posts/core/errors/failures.dart';
import '../../../domain/entities/post_entity.dart';
import '../../../domain/usecases/create_post_usecase.dart';
import '../../../domain/usecases/update_post_usecase.dart';

part 'post_form_bloc.freezed.dart';

@freezed
abstract class PostFormEvent with _$PostFormEvent {
  const factory PostFormEvent.submitCreate({required String title, required String description}) = _SubmitCreate;
  const factory PostFormEvent.submitUpdate({required String id, required String title, required String description}) = _SubmitUpdate;
}

@freezed
abstract class PostFormState with _$PostFormState {
  const factory PostFormState.initial() = _Initial;
  const factory PostFormState.submitting() = _Submitting;
  const factory PostFormState.success(PostEntity post) = _Success;
  const factory PostFormState.failure(String message) = _Failure;
}

@injectable
class PostFormBloc extends Bloc<PostFormEvent, PostFormState> {
  final CreatePostUseCase _create;
  final UpdatePostUseCase _update;

  PostFormBloc(this._create, this._update) : super(const PostFormState.initial()) {
    on<PostFormEvent>((event, emit) async {
      emit(const PostFormState.submitting());
      await event.when(
        submitCreate: (title, description) async {
          final res = await _create(CreatePostParams(title: title, description: description));
          res.fold(
            (f) => emit(PostFormState.failure(f.displayMessage)),
            (p) => emit(PostFormState.success(p)),
          );
        },
        submitUpdate: (id, title, description) async {
          final res = await _update(UpdatePostParams(id: id, title: title, description: description));
          res.fold(
            (f) => emit(PostFormState.failure(f.displayMessage)),
            (p) => emit(PostFormState.success(p)),
          );
        },
      );
    });
  }
}
