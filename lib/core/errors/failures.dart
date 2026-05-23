import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  const factory Failure.server({required String message, int? statusCode}) = ServerFailure;
  const factory Failure.network({@Default('No internet connection') String message}) = NetworkFailure;
  const factory Failure.unauthorized({@Default('Session expired') String message}) = UnauthorizedFailure;
  const factory Failure.cache({@Default('Cache error') String message}) = CacheFailure;
  const factory Failure.validation({required String message}) = ValidationFailure;
  const factory Failure.unknown({@Default('Something went wrong') String message}) = UnknownFailure;
}

extension FailureX on Failure {
  String get displayMessage => when(
        server: (msg, _) => msg,
        network: (msg) => msg,
        unauthorized: (msg) => msg,
        cache: (msg) => msg,
        validation: (msg) => msg,
        unknown: (msg) => msg,
      );
}
