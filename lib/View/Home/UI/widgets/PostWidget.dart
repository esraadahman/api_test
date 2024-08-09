import 'package:apiiiiiiiiiiiiii/core/theming/fonts/fonts.dart';
import 'package:apiiiiiiiiiiiiii/core/theming/size/size.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              child: Column(children: [
              Container(
                width: 339,
                height: 200,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/post-image.png'))),
              ),
              size.height(5),
              Text('This Is My First post to publish here, \n say Hi', style: styling.subtitle.copyWith(color: Colors.black, fontSize: 18),),
               size.height(10),
               Row(
               
                children: [
                size.width(50),
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage('https://img.freepik.com/free-photo/portrait-handsome-serious-man_23-2149022618.jpg?ga=GA1.1.1454705726.1706974768&semt=ais_hybrid'),
                ),
                size.width(5),
                Text('By ,Mohamed Khaled'),
                 size.width(10),
                Text('Sep.6,2024', style: TextStyle(color: Colors.grey),),
               ],)
            ],),);
  }
}