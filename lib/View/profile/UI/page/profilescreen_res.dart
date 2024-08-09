import 'package:apiiiiiiiiiiiiii/View/logout/screen/logout.dart';
import 'package:apiiiiiiiiiiiiii/View/profile/UI/widget/Save_Changes_button.dart';
import 'package:apiiiiiiiiiiiiii/View/profile/UI/widget/change_avatar_button.dart';
import 'package:apiiiiiiiiiiiiii/View/profile/UI/widget/profile_Circle_avatar.dart';
import 'package:apiiiiiiiiiiiiii/View/profile/UI/widget/upload_profile_image.dart';
import 'package:apiiiiiiiiiiiiii/View/profile/cubit/cubit/profile_cubit.dart';
import 'package:apiiiiiiiiiiiiii/View/sign_up/UI/widgets/upload_image.dart';
import 'package:apiiiiiiiiiiiiii/core/api/dio_consumer.dart';
import 'package:apiiiiiiiiiiiiii/core/api/endPointes.dart';
import 'package:apiiiiiiiiiiiiii/core/theming/colors/color.dart';
import 'package:apiiiiiiiiiiiiii/core/theming/fonts/fonts.dart';
import 'package:apiiiiiiiiiiiiii/core/theming/size/size.dart';
import 'package:apiiiiiiiiiiiiii/repositories/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen_res extends StatelessWidget {
  ProfileScreen_res({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileCubit(userRepo(api: DioConsumer(dio: Dio())))..getdataChach(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is GetUserFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<ProfileCubit>(context);
          return Scaffold(
              resizeToAvoidBottomInset: false,
              body: state is GetUserLoading
                  ? CircularProgressIndicator()
                  : state is GetuserSuccess
                      ? Column(
                          children: [
                            size.height(60),
                            Text(
                              'Account Settings',
                              style: styling.subtitle.copyWith(fontSize: 20),
                            ),
                            size.height(20),
                            Row(
                              children: [
                                size.width(30),
                                Text(
                                  'My Profile',
                                  style: styling.maintitle,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                size.width(40),
                                Container(
                                  width: 120,
                                  height: 3,
                                  color: colorsClass.primary,
                                ),
                              ],
                            ),
                            size.height(30),
                            Row(
                              children: [
                                size.width(30),
                                // ProfileAvatar(),
                                // size.width(30),
                                // ChangeAvatarButton()
                                PickProfileImageWidget(cubit: ProfileCubit(userRepo(api: DioConsumer(dio: Dio()))))
                              ],
                            ),
                            size.height(50),
                            Container(
                              width: 350,
                              child: TextField(
                                controller: cubit.user_name_controller,
                                decoration: InputDecoration(
                                    hintText: 'User Name',
                                    label: Text(
                                        state.data[ApiKey.name].toString()),
                                    filled: true,
                                    fillColor: colorsClass.background,
                                    prefixIcon: Icon(Icons.person),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: colorsClass.sub_background,
                                            width: 0))),
                              ),
                            ),
                            size.height(30),
                            Container(
                              width: 350,
                              child: TextField(
                                controller: cubit.user_email_cntroller,
                                decoration: InputDecoration(
                                    hintText: 'Email',
                                    label: Text(
                                        state.data[ApiKey.email].toString()),
                                    filled: true,
                                    fillColor: colorsClass.background,
                                    prefixIcon: Icon(Icons.email),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: colorsClass.sub_background,
                                            width: 0))),
                              ),
                            ),
                            size.height(30),
                            Container(
                              width: 350,
                              child: TextField(
                                controller: cubit.user_pass_controller,
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    label: Text(
                                        state.data[ApiKey.password].toString()),
                                    filled: true,
                                    fillColor: colorsClass.background,
                                    prefixIcon: Icon(Icons.password_rounded),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: colorsClass.sub_background,
                                            width: 0))),
                              ),
                            ),
                            size.height(30),
                            SaveChangesButton()
                            
                          ],
                        )
                      : Container());
        },
      ),
    );
  }
}




// state is GetUserLoading
//                 ? CircularProgressIndicator()
//                 : state is GetuserSuccess
//                     ? Center(
//                         child: ListView(
//                           children: [
//                             SizedBox(height: 16),

//                             //! Name
//                             ListTile(
//                               title: Text(state.data[ApiKey.name].toString()),
//                               leading: Icon(Icons.person),
//                             ),
//                             SizedBox(height: 16),

//                             //! Email
//                             ListTile(
//                               title: Text(state.data[ApiKey.email].toString()),
//                               leading: Icon(Icons.email),
//                             ),
//                             SizedBox(height: 16),

//                             ListTile(
//                               title: Text(state.data[ApiKey.token].toString()),
//                               leading: Icon(Icons.person),
//                             ),
//                             SizedBox(height: 50),
//                             GestureDetector(
//                               onTap: () {
//                                    Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => Logout(),
//                                   ),
//                                 );
//                               },
//                               child: Container(
//                                 margin: EdgeInsets.all(20),
//                                 width: 100,
//                                 height: 40,
//                                 color: Colors.blue,
//                                 child: Center(
//                                     child: Text(
//                                   "Log out",
//                                   style: TextStyle(fontSize: 30),
//                                 )),
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     : Container(),