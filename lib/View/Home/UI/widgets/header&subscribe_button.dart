
import 'package:apiiiiiiiiiiiiii/View/Home/UI/widgets/Subscribe_Button.dart';
import 'package:flutter/material.dart';

class HeaderandSubscribeButtonWidget extends StatelessWidget {
  const HeaderandSubscribeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: 387,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Back_image_UP.png'),
                fit: BoxFit.cover),
          ),
        ),
         Positioned(
          right: 3,
          bottom: 110,
          child: SubscribeButtonWidget(innerText: 'Subscribe',),
        ),
      ],
    );
  }
}
