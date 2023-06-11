part of 'user_details_cubit.dart';

@immutable
abstract class UserDetailsState {}

class UserDetailsInitial extends UserDetailsState {}

class UserDetailsLoading extends UserDetailsState {}

class UserDetailsLoaded extends UserDetailsState {
  final UserModel user;
  UserDetailsLoaded(this.user);
}

class UserDetailsError extends UserDetailsState {
  final String message;
  UserDetailsError(this.message);
}