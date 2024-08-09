
import 'package:apiiiiiiiiiiiiii/View/Home/UI/widgets/AppBar.dart';
import 'package:apiiiiiiiiiiiiii/View/Home/UI/widgets/Green_space_widget.dart';
import 'package:apiiiiiiiiiiiiii/View/Home/UI/widgets/PostWidget.dart';
import 'package:apiiiiiiiiiiiiii/View/Home/UI/widgets/Select_NHL_team.dart';
import 'package:apiiiiiiiiiiiiii/View/Home/UI/widgets/footer.dart';
import 'package:apiiiiiiiiiiiiii/View/Home/UI/widgets/header&subscribe_button.dart';
import 'package:apiiiiiiiiiiiiii/core/theming/colors/color.dart';
import 'package:apiiiiiiiiiiiiii/core/theming/size/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ZoomDrawerController _zoomDrawerController = ZoomDrawerController();

    return ZoomDrawer(
      controller: _zoomDrawerController,
      style: DrawerStyle.style1,
      menuScreen: const MenuScreen(),
      mainScreen: buildMainScreen(_zoomDrawerController),
      borderRadius: 24.0,
      showShadow: true,
      angle: 0.0,
      slideWidth: MediaQuery.of(context).size.width * 0.7,
    );
  }

  Widget buildMainScreen(ZoomDrawerController zoomDrawerController) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0), // Adjust this as needed
        child: Container(
            padding: EdgeInsets.only(top: 50),
            child: AppBarWidget(zoomDrawerController: zoomDrawerController)),
      ),
      backgroundColor: colorsClass.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //! Header Background
            const HeaderandSubscribeButtonWidget(),
            size.height(20),
            //! Select NHL team Text within Container
            SelectContainerWidget(),
            size.height(30),
            //! Posts
            ListView.separated(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // Disable ListView scrolling
              itemCount: 5,
              itemBuilder: (context, index) {
                return PostWidget();
              },
              separatorBuilder: (BuildContext context, int index) {
                return size.height(30);
              },
            ),
            size.height(50),
            //! Load More Posts Text
            Container(
              width: 250,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                    color: const Color.fromARGB(255, 202, 200, 200),
                    width: 2.0),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: const Center(
                child: Text(
                  'Load More Posts',
                  style: TextStyle(
                    color: colorsClass.primary,
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            size.height(50),
            //! Green Rec before footer
            GreenRectangleWidget(),
            //! footer
            Footer()
          ],
        ),
      ),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
        child: Column(
          children: [
            size.height(30),
            const CircleAvatar(
              radius: 49,
              backgroundColor: colorsClass.primary,
              child: CircleAvatar(
                radius: 46,
                backgroundImage: NetworkImage(
                  'https://img.freepik.com/free-photo/portrait-handsome-serious-man_23-2149022618.jpg?ga=GA1.1.1454705726.1706974768&semt=ais_hybrid',
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            ListTile(
              leading: const Icon(
                Icons.create,
                color: colorsClass.primary,
              ),
              title: const Text('Create Post'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: colorsClass.primary,
              ),
              title: const Text('Profile'),
              onTap: () {},
            ),
            const Spacer(
              flex: 4,
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: colorsClass.primary,
              ),
              title: const Text('LogOut'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
