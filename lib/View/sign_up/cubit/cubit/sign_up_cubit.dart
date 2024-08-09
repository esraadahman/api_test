
import 'package:apiiiiiiiiiiiiii/View/sign_up/models/sign_upmodel.dart';
import 'package:apiiiiiiiiiiiiii/repositories/auth_repository.dart';
import 'package:apiiiiiiiiiiiiii/repositories/user_repository.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';


part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.userrepo) : super(SignUpInitial());

  final AuthRepo userrepo;

  XFile? profilePic;

  TextEditingController signup_email = TextEditingController();
  TextEditingController signup_password = TextEditingController();
  TextEditingController signup_name = TextEditingController();
  TextEditingController signup_phone = TextEditingController();
  TextEditingController signup_bio = TextEditingController();
    GlobalKey<FormState> signUpFormKey = GlobalKey();
   

  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePic());
  }

  SignUpModel? user;
  sign_up() async {
    emit(SignUpLoading());
    final response = await userrepo.sign_up(
        email: signup_email.text,
        pass: signup_password.text,
        name: signup_name.text,
        bio: signup_bio.text,
        profilePic: profilePic!
        );
        
    response.fold((errormessage) {
      emit(SignUpFailure(errMessage: errormessage));
    }, (SignUpModel) {
      emit(SignUpSuccess(message: SignUpModel.message));
    });
  
  }
}
