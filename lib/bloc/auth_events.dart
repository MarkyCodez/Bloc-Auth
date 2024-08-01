part of 'auth_bloc.dart';

sealed class AuthEvents {}

final class SignIn extends AuthEvents {
  final String email;
  final String password;
  SignIn({
    required this.email,
    required this.password,
  });
}

final class SignOut extends AuthEvents {}
