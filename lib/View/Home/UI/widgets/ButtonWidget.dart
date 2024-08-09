import 'package:apiiiiiiiiiiiiii/core/theming/colors/color.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
                          width: 250,
                          height: 60,
                          decoration: BoxDecoration(
                            color:Colors.white,
                            border: Border.all(color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: const Center(
                            child: Text(
                              'Start your SportBlog',
                              style: TextStyle(
                                color: colorsClass.primary,
                                fontSize: 18.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        );
  }
}