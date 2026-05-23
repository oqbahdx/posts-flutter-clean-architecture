import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:posts/core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _login;
  final RegisterUseCase _register;
  final LogoutUseCase _logout;
  final AuthRepository _repo;

  AuthBloc(this._login, this._register, this._logout, this._repo)
      : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        checkStatus: () async {
          final logged = await _repo.isLoggedIn();
          emit(logged ? const AuthState.unauthenticated() : const AuthState.unauthenticated());
          // Note: We emit unauthenticated since we don't restore the AuthEntity here.
          // For deeper restore, store the entity and rehydrate.
        },
        login: (email, password) async {
          emit(const AuthState.loading());
          final res = await _login(LoginParams(email: email, password: password));
          res.fold(
            (f) => emit(AuthState.error(f.displayMessage)),
            (u) => emit(AuthState.authenticated(u)),
          );
        },
        register: (email, password) async {
          emit(const AuthState.loading());
          final res = await _register(RegisterParams(email: email, password: password));
          res.fold(
            (f) => emit(AuthState.error(f.displayMessage)),
            (_) => emit(const AuthState.registered()),
          );
        },
        logout: () async {
          await _logout(const NoParams());
          emit(const AuthState.unauthenticated());
        },
      );
    });
  }
}
