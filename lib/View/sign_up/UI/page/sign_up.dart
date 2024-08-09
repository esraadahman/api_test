
import 'package:apiiiiiiiiiiiiii/View/sign_in/UI/widget/already_have_an_account_widget.dart';
import 'package:apiiiiiiiiiiiiii/View/sign_in/UI/widget/custom_form_button.dart';
import 'package:apiiiiiiiiiiiiii/View/sign_in/UI/widget/custom_input_field.dart';
import 'package:apiiiiiiiiiiiiii/View/sign_in/UI/widget/page_header.dart';
import 'package:apiiiiiiiiiiiiii/View/sign_in/UI/widget/page_heading.dart';
import 'package:apiiiiiiiiiiiiii/View/sign_up/UI/widgets/upload_image.dart';
import 'package:apiiiiiiiiiiiiii/View/sign_up/cubit/cubit/sign_up_cubit.dart';
import 'package:apiiiiiiiiiiiiii/core/api/dio_consumer.dart';
import 'package:apiiiiiiiiiiiiii/repositories/auth_repository.dart';
import 'package:apiiiiiiiiiiiiii/repositories/user_repository.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key});

  @override
  State<SignUpScreen> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SignUpCubit(AuthRepo(api: DioConsumer(dio: Dio()))),
        child:
            BlocConsumer<SignUpCubit, SignUpState>(listener: (context, state) {
          if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          } else if (state is SignUpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
              ),
            );
          }
        }, builder: (context, state) {
          final cubit = BlocProvider.of<SignUpCubit>(context);
          return SafeArea(
          child: Scaffold(
            // backgroundColor: const Color(0xffEEF1F3),
            body: SingleChildScrollView(
              child: Form(
                key: cubit.signUpFormKey,
                child: Column(
                  children: [
                     PageHeader(),
                    const PageHeading(title: 'Sign-up'),
                    //! Image
                    PickImageWidget(cubit: SignUpCubit(AuthRepo(api: DioConsumer(dio: Dio()))),),
                    const SizedBox(height: 16),
                    //! Name
                    CustomInputField(
                      labelText: 'Name',
                      hintText: 'Your name',
                      isDense: true,
                      controller: cubit.signup_name,
                    ),
                    const SizedBox(height: 16),
                    //!Email
                    CustomInputField(
                      labelText: 'Email',
                      hintText: 'Your email',
                      isDense: true,
                      controller: cubit.signup_email,
                    ),
                    
                    const SizedBox(height: 16),
                    //! Password
                    CustomInputField(
                      labelText: 'Password',
                      hintText: 'Your password',
                      isDense: true,
                      obscureText: true,
                      suffixIcon: true,
                      controller: cubit.signup_password,
                    ),
                      const SizedBox(height: 16),
                      //! Password
                      CustomInputField(
                        labelText: 'Bio',
                        hintText: 'Your password',
                        isDense: true,
                        obscureText: true,
                        suffixIcon: true,
                        controller: cubit.signup_password,
                      ),
                    
                    const SizedBox(height: 22),
                    //!Sign Up Button
                    state is SignUpLoading
                        ? CircularProgressIndicator()
                        : CustomFormButton(
                            innerText: 'Signup',
                            onPressed: () {
                              cubit.sign_up();
                            },
                          ),
                    const SizedBox(height: 18),
                    //! Already have an account widget
                    const AlreadyHaveAnAccountWidget(
                      
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        );
        }));
  }
}
