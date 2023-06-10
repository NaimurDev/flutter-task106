import 'package:fluttertask10623/repositories/models/ApiResponse.dart';

abstract class ApiRepository{
  Future<ApiResponse> login({required String username, required String password});
}