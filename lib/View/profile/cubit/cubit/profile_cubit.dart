
import 'package:apiiiiiiiiiiiiii/View/profile/model/usermodel.dart';
import 'package:apiiiiiiiiiiiiii/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.userrepo) : super(ProfileInitial());

  final userRepo userrepo;
  TextEditingController user_name_controller =TextEditingController();
  TextEditingController user_email_cntroller =TextEditingController();
  TextEditingController user_pass_controller =TextEditingController();
  XFile ?profilePic;

  getuserProfile() async {
    emit(GetUserLoading());
    final response = await userrepo.getUserProfile();
    response.fold(
      (errMessage) => emit(GetUserFailure(errMessage: errMessage)),
      (user) => emit(GetUserSuccess(user: user)),
    );
  }

  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePic());
  }


  //  getdataChach() async{
  // //  print("enter function");
  //   emit(GetUserLoading());
  //   data[ApiKey.email] =await CacheHelper().getData(key: ApiKey.email);
  //   data[ApiKey.name] =await CacheHelper().getData(key: ApiKey.name);
  //   data[ApiKey.token] = await CacheHelper().getData(key: ApiKey.token);
  // //  print("email ${data[ApiKey.email]}   name ${data[ApiKey.name]}  token ${data[ApiKey.token]}");
  //   emit(GetuserSuccess());
  // //  print("end function ");

  // }

//  final Map<String, dynamic> data = {};
  getdataChach() async {
    emit(GetUserLoading());
  final  data =await userrepo.getdataChach();
    data.fold((errormessage) {
      
      emit(GetUserFailure(errMessage: errormessage));
    }, (data) {
      emit(GetuserSuccess(data: data));
    });
  }




  
}
