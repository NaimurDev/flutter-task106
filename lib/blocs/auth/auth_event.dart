part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String username;
  final String password;

  LoginEvent(this.username, this.password);
}

class LogoutEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {
  final Map<String, String> formData;

  RegisterEvent(this.formData);
}