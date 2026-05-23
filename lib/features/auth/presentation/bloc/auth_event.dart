import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkStatus() = _CheckStatus;
  const factory AuthEvent.login({required String email, required String password}) = _Login;
  const factory AuthEvent.register({required String email, required String password}) = _Register;
  const factory AuthEvent.logout() = _Logout;
}
