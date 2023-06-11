import 'package:dio/dio.dart';
import 'package:fluttertask10623/config.dart';
import 'package:fluttertask10623/constants/functions.dart';
import 'package:fluttertask10623/repositories/api_repository.dart';
import 'package:fluttertask10623/repositories/models/ApiResponse.dart';

class ApiRepositoryImpl extends ApiRepository {
  final Dio _dio;

  ApiRepositoryImpl(this._dio);

  @override
  Future<ApiResponse> login(
      {required String username, required String password}) async {
    try {
      final response = await _dio.post('auth/login/',
          data: {'username': username, 'password': password});
      return ApiResponse(
        success: true,
        response: response.data,
      );
    } catch (e, trace) {
      dPrint("Error: $e, Trace: $trace");
      if (e is DioException && e.response != null) {
        return ApiResponse(
          success: false,
          response: e.response!.data,
        );
      }
      return ApiResponse(success: false, errorMessage: "Something went wrong.");
    }
  }

  @override
  Future<ApiResponse> register({required Map<String, String> formData}) async {
    try {
      final response = await _dio.post('registration/', data: formData);
      dPrint("dio response ${response.data}");
      return ApiResponse(
        success: true,
        response: response.data,
      );
    } catch (e, trace) {
      dPrint("Error: $e, Trace: $trace");
      if (e is DioException && e.response != null) {
        return ApiResponse(
          success: false,
          response: e.response!.data,
        );
      }
      return ApiResponse(success: false, errorMessage: "Something went wrong.");
    }
  }

  @override
  Future<ApiResponse> getUserDetails() async {
    try {
      dPrint("Token ${Config.accessToken}");
      dPrint("Authorization ${_dio.options.headers['Authorization']}");
      _dio.options.headers['Authorization'] = "Token ${Config.accessToken}";
      final response = await _dio.get('auth/user/',
          options: Options(
              headers: {"Authorization": "Token ${Config.accessToken}"}));
      return ApiResponse(
        success: true,
        response: response.data,
      );
    } catch (e, trace) {
      dPrint("Error: $e, Trace: $trace");
      if (e is DioException && e.response != null) {
        return ApiResponse(
          success: false,
          response: e.response!.data,
        );
      }
      return ApiResponse(success: false, errorMessage: "Something went wrong.");
    }
  }
}
