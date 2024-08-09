import 'package:apiiiiiiiiiiiiii/core/theming/colors/color.dart';
import 'package:apiiiiiiiiiiiiii/core/theming/size/size.dart';
import 'package:flutter/material.dart';

class SelectContainerWidget extends StatelessWidget {
  const SelectContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
              width: 335,
              height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Select NHL Team',style: TextStyle(color: colorsClass.primary,fontSize: 17, fontWeight: FontWeight.bold),),
                   size.width(10),
                   const Icon(Icons.keyboard_arrow_down_sharp,color: colorsClass.primary,size: 30,)
                ],
              ),
            );
  }
}