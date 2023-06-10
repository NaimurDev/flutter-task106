import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertask10623/blocs/auth/auth_bloc.dart';
import 'package:fluttertask10623/screens/home/home_screen.dart';
import 'package:fluttertask10623/screens/login/login_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterTask10623',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if(state is AuthenticatedAuthState){
            return const HomeScreen();
          }
          return const LoginScreen();
        },
      )
    );
  }
}