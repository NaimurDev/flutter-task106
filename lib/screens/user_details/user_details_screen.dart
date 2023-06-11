import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertask10623/blocs/user_details/user_details_cubit.dart';
import 'package:fluttertask10623/injection_container.dart' as di;
import 'package:fluttertask10623/repositories/api_repository.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserDetailsCubit(di.sl<ApiRepository>())..getUserDetails(),
      child: Scaffold(
        appBar: AppBar(
          title: Hero(tag: "User Details", child: Text("User Details")),
        ),
        body: BlocBuilder<UserDetailsCubit, UserDetailsState>(
          builder: (context, state) {
            if (state is UserDetailsLoaded) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                        tag: "User Details Icon",
                        child: Icon(
                          Icons.person,
                          size: 100,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Email: ${state.user.email}"),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Username: ${state.user.username}"),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            } else if (state is UserDetailsError) {
              return Center(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.message),
                  ElevatedButton(
                      onPressed: () {
                        context.read<UserDetailsCubit>().getUserDetails();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Refresh"),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.refresh)
                        ],
                      )),
                ],
              ));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
