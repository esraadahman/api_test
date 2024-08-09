
import 'package:apiiiiiiiiiiiiii/View/sign_in/models/sign_inModel.dart';
import 'package:apiiiiiiiiiiiiii/repositories/auth_repository.dart';
import 'package:apiiiiiiiiiiiiii/repositories/user_repository.dart';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.userrepo) : super(SigninInitial());
  final AuthRepo userrepo;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> signInFormKey = GlobalKey();

  SignInModel? user;

  signin() async {
    emit(SignInloading());
    final response = await userrepo.sign_in(
        email: emailController.text,
         pass: passwordController.text);
    response.fold((erromessage) {
      emit(SignInfailer(errorMessage: erromessage));
    }, (SignInModel) {
      emit(SignInSuccess());
    });
  }
}
