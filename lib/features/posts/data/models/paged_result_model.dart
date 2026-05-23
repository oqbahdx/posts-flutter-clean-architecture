import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/paged_result_entity.dart';
import '../../domain/entities/post_entity.dart';
import 'post_model.dart';

part 'paged_result_model.freezed.dart';
part 'paged_result_model.g.dart';

@freezed
abstract class PagedResultModel with _$PagedResultModel {
  const PagedResultModel._();

  const factory PagedResultModel({
    required List<PostModel> items,
    required int page,
    required int pageSize,
    required int totalCount,
    required int totalPages,
    required bool hasPreviousPage,
    required bool hasNextPage,
  }) = _PagedResultModel;

  factory PagedResultModel.fromJson(Map<String, dynamic> json) =>
      _$PagedResultModelFromJson(json);

  PagedResultEntity<PostEntity> toEntity() => PagedResultEntity<PostEntity>(
        items: items.map((e) => e.toEntity()).toList(),
        page: page,
        pageSize: pageSize,
        totalCount: totalCount,
        totalPages: totalPages,
        hasPreviousPage: hasPreviousPage,
        hasNextPage: hasNextPage,
      );
}
