import 'package:freezed_annotation/freezed_annotation.dart';

part 'paged_result_entity.freezed.dart';

@Freezed(genericArgumentFactories: true)
abstract class PagedResultEntity<T> with _$PagedResultEntity<T> {
  const factory PagedResultEntity({
    required List<T> items,
    required int page,
    required int pageSize,
    required int totalCount,
    required int totalPages,
    required bool hasPreviousPage,
    required bool hasNextPage,
  }) = _PagedResultEntity<T>;
}
