import 'package:apiiiiiiiiiiiiii/core/theming/colors/color.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
                    radius: 46,
                    backgroundColor: colorsClass.primary,
                    child: CircleAvatar(
                      radius: 43,
                      backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/portrait-handsome-serious-man_23-2149022618.jpg?ga=GA1.1.1454705726.1706974768&semt=ais_hybrid',
                      ),
                    ));
  }
}