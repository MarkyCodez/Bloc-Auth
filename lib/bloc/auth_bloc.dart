import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_events.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvents, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignIn>(_onLogin);
    on<SignOut>(_onLogOut);
  }

  void _onLogin(SignIn event, Emitter emit) async {
    emit(AuthLoading());
    try {
      final email = event.email;
      final password = event.password;
      if (password.length < 6) {
        emit(
          AuthFailure("Password must be 6 characters long"),
        );
        return;
      }
      await Future.delayed(
          const Duration(
            seconds: 2,
          ), () {
        return emit(
          AuthSuccess(uid: "$email-$password"),
        );
      });
    } catch (e) {
      return emit(
        AuthFailure(
          e.toString(),
        ),
      );
    }
  }

  void _onLogOut(SignOut event, Emitter emit) async {
    emit(AuthLoading());
    try {
      await Future.delayed(const Duration(seconds: 2), () {
        return emit(
          AuthInitial(),
        );
      });
    } catch (e) {
      return emit(
        AuthFailure(
          e.toString(),
        ),
      );
    }
  }
}
