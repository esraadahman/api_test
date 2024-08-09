import 'package:apiiiiiiiiiiiiii/View/create_post/model/addpost_model.dart';
import 'package:apiiiiiiiiiiiiii/repositories/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'addpost_state.dart';

class AddpostCubit extends Cubit<AddpostState> {
  AddpostCubit(this.userrepo) : super(AddpostInitial());


  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  final userRepo userrepo;

  Future<void> addPosts() async {
    emit(Addpostloading());

    final data = await userrepo.addPosts(title.text, description.text);
    data.fold((errormessage) {
      emit(Addpostfail(errormessage: errormessage));
    }, (added) {
      emit(Addpostsuccess(data: added));
    });
  }
}
