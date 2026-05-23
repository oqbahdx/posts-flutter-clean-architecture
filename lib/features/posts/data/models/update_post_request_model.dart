import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_post_request_model.freezed.dart';
part 'update_post_request_model.g.dart';

@freezed
abstract class UpdatePostRequestModel with _$UpdatePostRequestModel {
  const factory UpdatePostRequestModel({
    required String title,
    required String description,
  }) = _UpdatePostRequestModel;

  factory UpdatePostRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdatePostRequestModelFromJson(json);
}
