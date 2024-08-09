
import 'package:apiiiiiiiiiiiiii/View/logout/cubit/cubit/logout_cubit.dart';
import 'package:apiiiiiiiiiiiiii/core/api/dio_consumer.dart';
import 'package:apiiiiiiiiiiiiii/repositories/auth_repository.dart';
import 'package:apiiiiiiiiiiiiii/repositories/user_repository.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(AuthRepo(api: DioConsumer(dio: Dio()))),
      child: BlocConsumer<LogoutCubit, LogoutState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<LogoutCubit>(context);
          return Scaffold(
            body: Center(
              child: Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Logout(),
                      ),
                    );
                  },
                  child: Container(
                    //  margin: EdgeInsets.all(20),
                    width: 150,
                    height: 40,
                    color: Colors.blue,
                    child: Center(
                        child: Text(
                      "Log out",
                      style: TextStyle(fontSize: 30),
                    )),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
