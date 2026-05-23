import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_entity.freezed.dart';

@freezed
abstract class AuthEntity with _$AuthEntity {
  const factory AuthEntity({
    required String token,
    required String email,
    required String userId,
    required DateTime expiresAt,
  }) = _AuthEntity;
}
