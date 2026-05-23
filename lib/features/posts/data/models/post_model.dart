import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/post_entity.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
abstract class PostModel with _$PostModel {
  const PostModel._();

  const factory PostModel({
    required String id,
    required String title,
    required String description,
    required DateTime createdAt,
    required String userId,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);

  PostEntity toEntity() => PostEntity(
        id: id,
        title: title,
        description: description,
        createdAt: createdAt,
        userId: userId,
      );
}
