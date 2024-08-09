import 'package:apiiiiiiiiiiiiii/View/profile/cubit/cubit/profile_cubit.dart';
import 'package:apiiiiiiiiiiiiii/core/theming/colors/color.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChangeAvatarButton extends StatefulWidget {
  ChangeAvatarButton({super.key, });

  @override
  State<ChangeAvatarButton> createState() => _ChangeAvatarButtonState();
}

class _ChangeAvatarButtonState extends State<ChangeAvatarButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
    
      },
      child: Container(
        width: 150,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: const Center(
          child: Text(
            'Change Avatar',
            style: TextStyle(
              color: colorsClass.primary,
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
