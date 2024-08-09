
import 'package:apiiiiiiiiiiiiii/View/profile/UI/page/profilescreen_res.dart';
import 'package:apiiiiiiiiiiiiii/View/sign_in/UI/widget/custom_form_button.dart';
import 'package:apiiiiiiiiiiiiii/View/sign_in/UI/widget/custom_input_field.dart';
import 'package:apiiiiiiiiiiiiii/View/sign_in/UI/widget/dont_have_an_account.dart';
import 'package:apiiiiiiiiiiiiii/View/sign_in/UI/widget/forget_password_widget.dart';
import 'package:apiiiiiiiiiiiiii/View/sign_in/UI/widget/page_header.dart';
import 'package:apiiiiiiiiiiiiii/View/sign_in/UI/widget/page_heading.dart';
import 'package:apiiiiiiiiiiiiii/View/sign_in/cubit/cubit/signin_cubit.dart';
import 'package:apiiiiiiiiiiiiii/core/api/dio_consumer.dart';
import 'package:apiiiiiiiiiiiiii/core/theming/size/size.dart';
import 'package:apiiiiiiiiiiiiii/repositories/auth_repository.dart';
import 'package:apiiiiiiiiiiiiii/repositories/user_repository.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class SignIn extends StatefulWidget {
  SignIn({Key? key});

  @override
  State<SignIn> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    Size sizee = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => SigninCubit(AuthRepo(api: DioConsumer(dio: Dio()))),
      child: BlocConsumer<SigninCubit, SigninState>(
        listener: (context, state) {
            if (state is SignInSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("succes"),
                
              ),
            );
              
          } else if (state is  SignInfailer) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<SigninCubit>(context);
          
          return Scaffold(
            backgroundColor: const Color(0xffEEF1F3),
            body: Column(
              children: [
                size.height(30),
               PageHeader(),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: cubit.signInFormKey,
                        child: Column(
                          children: [
                            const PageHeading(title: 'Sign-in'),
                            //!Email
                            CustomInputField(
                              labelText: 'Email',
                              hintText: 'Your email',
                              controller: cubit.emailController,
                            ),
                            const SizedBox(height: 16),
                            //!Password
                            CustomInputField(
                              labelText: 'Password',
                              hintText: 'Your password',
                              obscureText: true,
                              suffixIcon: true,
                              controller:
                                  cubit.passwordController,
                            ),
                            const SizedBox(height: 16),
                            //! Forget password?
                            ForgetPasswordWidget(size: sizee),
                            const SizedBox(height: 20),
                            //!Sign In Button
                            state is SignInloading
                                ? CircularProgressIndicator()
                                : CustomFormButton(
                                    innerText: 'Sign In',
                                    onPressed: () {
                                      cubit.signin();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProfileScreen_res()),
                                      );
                                    },
                                  ),
                            const SizedBox(height: 18),
                            //! Dont Have An Account ?
                            DontHaveAnAccountWidget(size: sizee),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
