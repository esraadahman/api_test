
import 'package:apiiiiiiiiiiiiii/View/Home/UI/page/homeScreen.dart';
import 'package:apiiiiiiiiiiiiii/View/profile/UI/page/profilescreen_res.dart';
import 'package:flutter/material.dart';


import 'cache/cache_healper.dart';
import 'core/api/endPointes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await  CacheHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:MyApp(),
      //CacheHelper().getData(key: ApiKey.id) ==null? SignIn(): HomeScreen(),
    // ProfileScreen_res()
    
    );
  }
}
