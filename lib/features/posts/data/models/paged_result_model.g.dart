// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PagedResultModel _$PagedResultModelFromJson(Map<String, dynamic> json) =>
    _PagedResultModel(
      items: (json['items'] as List<dynamic>)
          .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: (json['page'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      totalCount: (json['totalCount'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      hasPreviousPage: json['hasPreviousPage'] as bool,
      hasNextPage: json['hasNextPage'] as bool,
    );

Map<String, dynamic> _$PagedResultModelToJson(_PagedResultModel instance) =>
    <String, dynamic>{
      'items': instance.items,
      'page': instance.page,
      'pageSize': instance.pageSize,
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
      'hasPreviousPage': instance.hasPreviousPage,
      'hasNextPage': instance.hasNextPage,
    };
