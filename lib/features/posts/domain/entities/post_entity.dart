import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_entity.freezed.dart';

@freezed
abstract class PostEntity with _$PostEntity {
  const factory PostEntity({
    required String id,
    required String title,
    required String description,
    required DateTime createdAt,
    required String userId,
  }) = _PostEntity;
}
