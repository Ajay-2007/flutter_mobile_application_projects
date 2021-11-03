import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:instagram_BLoC_pattern/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  StreamSubscription<auth.User> _userSubcription;

  AuthBloc({
    @required AuthRepository authRepository,
  })
      : _authRepository = authRepository,
        super(AuthState.unknown()) {
    _userSubcription =
        _authRepository.user.listen((user) => add(AuthUserChanged(user: user)));
  }

  @override
  Future<void> close() {
    _userSubcription?.cancel();
    return super.close();
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event,) async* {
    if (event is AuthUserChanged) {
      yield* _mapAuthUserChangedToState(event);
    } else if (event is AuthLogoutRequested) {
      await _authRepository.logOut();
    }
  }

  Stream<AuthState> _mapAuthUserChangedToState(AuthUserChanged event) async* {
    yield event.user != null
        ? AuthState.authenticated(user: event.user)
        : AuthState.unauthenticated();
  }
}
