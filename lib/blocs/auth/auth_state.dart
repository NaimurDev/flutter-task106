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
  final String? password;
  final String? errorMessage;
  FailureAuthState({this.errorMessage, this.username, this.password});
}