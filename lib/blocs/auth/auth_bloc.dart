import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fluttertask10623/config.dart';
import 'package:fluttertask10623/constants/functions.dart';
import 'package:fluttertask10623/repositories/api_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiRepository apiRepository;

  AuthBloc(this.apiRepository) : super(InitialAuthState()) {
    on<LoginEvent>(_onLogin);
    on<LogoutEvent>(_onLogout);
    on<RegisterEvent>(_onRegister);
  }

  FutureOr<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());
    try {
      final result = await apiRepository.login(
          username: event.username, password: event.password);
      if (result.success) {
        Config.accessToken = result.response['key'];
        emit(AuthenticatedAuthState(result.response['key']));
      } else {
        final nonFErrors = result.response['non_field_errors'];
        emit(FailureAuthState(
            errorMessage: result.response['non_field_errors'] == null ? null : result.response['non_field_errors'][0],
            username: result.response['username'] != null ? result.response['username'][0] : null,
            password: result.response['password'] != null ? result.response['password'][0] : null,));
      }
    } catch (e, trace) {
      dPrint("Error: $e, Trace: $trace");
      final errorMessage =
          'Failed to login: $e';
      emit(FailureAuthState(errorMessage: errorMessage));
    }
  }

  FutureOr<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async{
    Config.accessToken = "";
    emit(InitialAuthState());
  }

  FutureOr<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async{
    emit(LoadingAuthState());
    try {
      final result = await apiRepository.register(formData: event.formData,);
      if (result.success) {
        Config.accessToken = result.response['key'];
        emit(AuthenticatedAuthState(result.response['key']));
      } else {

        emit(FailureAuthState(
            errorMessage: result.response['non_field_errors'] == null ? null : result.response['non_field_errors'][0],
            username: result.response['username'] != null ? result.response['username'][0] : null,
            password: result.response['password1'] != null ? result.response['password1'][0] : null,
            email: result.response['email'] != null ? result.response['email'][0] : null,
            password2: result.response['password2'] != null ? result.response['password2'][0] : null,
        ));
      }
    } catch (e, trace) {
      dPrint("Error: $e, Trace: $trace");
      final errorMessage =
          'Failed to login: $e';
      emit(FailureAuthState(errorMessage: errorMessage));
    }
  }
}
