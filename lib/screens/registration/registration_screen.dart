import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertask10623/blocs/auth/auth_bloc.dart';
import 'package:fluttertask10623/constants/decorations.dart';
import 'package:fluttertask10623/widgets/rounded_button.dart';
import 'package:fluttertask10623/widgets/toast.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  Map<String, String> formData = {
    "username": "",
    "email": "",
    "password1": "",
    "password2": "",
  };

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthenticatedAuthState) {
          SuccessToast.show("Registration successful");
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    Hero(
                      tag: 'logo',
                      child: Container(
                        height: 100.0,
                        child: Image.asset('assets/logo.png'),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        width: 180.0,
                        child: DefaultTextStyle(
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.grey.shade800,
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                'FlutterTask',
                                speed: const Duration(milliseconds: 150),
                              ),
                              TypewriterAnimatedText(
                                'FlutterTask',
                                speed: const Duration(milliseconds: 150),
                              ),
                            ],
                            repeatForever: true,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.emailAddress,
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your username',
                          errorText: state is FailureAuthState
                              ? state.username
                              : null),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                      onSaved: (value) => formData['username'] = value!,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.emailAddress,
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your email',
                          errorText:
                              state is FailureAuthState ? state.email : null),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      onSaved: (value) => formData['email'] = value!,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      style: const TextStyle(color: Colors.black),
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your password',
                          errorText: state is FailureAuthState
                              ? state.password
                              : null),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      onSaved: (value) => formData['password1'] = value!,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      style: const TextStyle(color: Colors.black),
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Confirm Password',
                          errorText: state is FailureAuthState
                              ? state.password
                              : null),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm password';
                        }
                        return null;
                      },
                      onSaved: (value) => formData['password2'] = value!,
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    if (state is FailureAuthState && state.errorMessage != null)
                      Center(
                          child: Text(
                        state.errorMessage!,
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      )),
                    state is LoadingAuthState
                        ? Center(child: const CircularProgressIndicator())
                        : RoundedButton(
                            text: 'Register',
                            color: Colors.lightBlueAccent,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                context
                                    .read<AuthBloc>()
                                    .add(RegisterEvent(formData));
                              }
                            },
                          ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Already have an account? Login',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
