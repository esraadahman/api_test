import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
 PageHeader({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.4,
      child: Image.asset('assets/images/SignUp.jpg', fit: BoxFit.cover,),
    );
  }
}
