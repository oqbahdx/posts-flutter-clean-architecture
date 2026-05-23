// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_post_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreatePostRequestModel _$CreatePostRequestModelFromJson(
  Map<String, dynamic> json,
) => _CreatePostRequestModel(
  title: json['title'] as String,
  description: json['description'] as String,
);

Map<String, dynamic> _$CreatePostRequestModelToJson(
  _CreatePostRequestModel instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
};
