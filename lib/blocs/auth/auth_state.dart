part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class InitialAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class AuthenticatedAuthState extends AuthState {
  final String accessToken;
  AuthenticatedAuthState(this.accessToken);
}

class FailureAuthState extends AuthState {
  final String? username;
  final String? email;
  final String? password;
  final String? password2;
  final String? errorMessage;
  FailureAuthState({this.errorMessage, this.username, this.password, this.password2, this.email});
}