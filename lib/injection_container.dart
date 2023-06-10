import 'package:dio/dio.dart';
import 'package:fluttertask10623/blocs/auth/auth_bloc.dart';
import 'package:fluttertask10623/config.dart';
import 'package:fluttertask10623/repositories/api_repository.dart';
import 'package:fluttertask10623/repositories/api_repository_impl.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  // dio
  sl.registerSingleton<Dio>(Dio(
      BaseOptions(
        baseUrl: Config.apiBaseurl,
        connectTimeout: Duration(seconds: 5),
        receiveTimeout: Duration(seconds: 3),)
  ));

  // repositories
  sl.registerSingleton<ApiRepository>(ApiRepositoryImpl(sl.call()));

  // register singleton for auth bloc
  sl.registerSingleton<AuthBloc>(AuthBloc(sl.call()));

}