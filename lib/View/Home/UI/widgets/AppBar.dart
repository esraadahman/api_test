import 'package:apiiiiiiiiiiiiii/core/theming/colors/color.dart';
import 'package:apiiiiiiiiiiiiii/core/theming/size/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class AppBarWidget extends StatelessWidget {
  final ZoomDrawerController zoomDrawerController;

  const AppBarWidget({super.key, required this.zoomDrawerController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: Row(
        children: [
          size.width(25),
          GestureDetector(
            onTap: () {
              zoomDrawerController.toggle!();
            },
            child: const Icon(Icons.menu_outlined),
          ),
          size.width(75),
          const Image(image: AssetImage('assets/images/black_logo.png')),
          size.width(50),
          GestureDetector(
            onTap: () {
              zoomDrawerController.toggle!();
            },
            child: const CircleAvatar(
              
              radius: 22,
              backgroundColor: colorsClass.primary,
              backgroundImage: NetworkImage(
                'https://img.freepik.com/free-photo/portrait-handsome-serious-man_23-2149022618.jpg?ga=GA1.1.1454705726.1706974768&semt=ais_hybrid',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
