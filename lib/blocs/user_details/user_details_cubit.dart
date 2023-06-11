import 'package:bloc/bloc.dart';
import 'package:fluttertask10623/models/UserModel.dart';
import 'package:fluttertask10623/repositories/api_repository.dart';
import 'package:fluttertask10623/repositories/models/ApiResponse.dart';
import 'package:meta/meta.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit(this._apiRepository) : super(UserDetailsInitial());

  final ApiRepository _apiRepository;

  void getUserDetails() async {
    emit(UserDetailsLoading());
    try {
      ApiResponse response = await _apiRepository.getUserDetails();
      if (response.success) {
        emit(UserDetailsLoaded(UserModel.fromJson(response.response)));
      } else {
        emit(UserDetailsError(response.response.toString()));
      }
    } catch (e) {
      emit(UserDetailsError(e.toString()));
    }
  }
}
