import 'dart:io';
import 'package:apiiiiiiiiiiiiii/View/sign_up/cubit/cubit/sign_up_cubit.dart';
import 'package:apiiiiiiiiiiiiii/core/theming/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';


class PickImageWidget extends StatelessWidget {
SignUpCubit cubit;
   PickImageWidget({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
          width: 130,
          height: 130,
          child: 
          cubit.profilePic == null
              ? 
              CircleAvatar(
                  backgroundColor: colorsClass.primary,
                  backgroundImage: const AssetImage("assets/images/avatar.png"),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: GestureDetector(
                          onTap: () async {},
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: colorsClass.primary,
                              border: Border.all(color: Colors.white, width: 3),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                ImagePicker()
                                    .pickImage(source: ImageSource.gallery)
                                    .then((value) => cubit
                                        .uploadProfilePic(value!));
                              },
                              child: const Icon(
                                Icons.camera_alt_sharp,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : CircleAvatar(
                  backgroundImage: FileImage(
                      File(cubit.profilePic!.path)),
                ),
        );
      
    
  }
}
