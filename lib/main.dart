import 'package:flutter/material.dart';
import 'package:fluttertask10623/app.dart';
import 'package:fluttertask10623/blocs/auth/auth_bloc.dart';
import 'package:fluttertask10623/screens/login/login_screen.dart';
import 'injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<AuthBloc>(),
      child: const App(),
    );
  }
}
