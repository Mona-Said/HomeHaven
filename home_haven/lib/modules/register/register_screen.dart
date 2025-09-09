import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:home_haven/layout/layout_screen.dart';
import 'package:home_haven/modules/register/cubit/cubit.dart';
import 'package:home_haven/modules/register/cubit/states.dart';

import '../../shared/components/components.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  var fNameController = TextEditingController();
  var lNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (BuildContext context, state) {
          if (state is CreateAccountSuccessState) {
            itemToast(text: 'Welcome To HomeHaven', state: ToastStates.success);
            navigateAndFinish(context: context, widget: LayoutScreen());
          } else if (state is CreateAccountErrorState) {
            itemToast(text: 'Error,Try Again', state: ToastStates.error);
          }
        },
        builder: (BuildContext context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create Account',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'Fill in your details below to get started on a seamless shopping experience.',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#9E9E9E')),
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    formField(
                      label: 'First Name',
                      prefix: Icons.person_outlined,
                      type: TextInputType.name,
                      controller: fNameController,
                      validateFunction: (value) {
                        if (value.isEmpty) {
                          return 'Please,Enter Your First Name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    formField(
                      label: 'Last Name',
                      prefix: Icons.person_outlined,
                      type: TextInputType.name,
                      controller: lNameController,
                      validateFunction: (value) {
                        if (value.isEmpty) {
                          return 'Please,Enter Your Last Name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    formField(
                      label: 'Email Address',
                      prefix: Icons.email_outlined,
                      type: TextInputType.emailAddress,
                      controller: emailController,
                      validateFunction: (value) {
                        if (value.isEmpty) {
                          return 'Please,Enter Your Email Address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    formField(
                      label: 'Password',
                      prefix: Icons.lock_outline,
                      suffix: cubit.suffix,
                      type: TextInputType.visiblePassword,
                      obscureText: cubit.isPassword,
                      controller: passwordController,
                      pressed: () {
                        cubit.changeVisiblity();
                      },
                      validateFunction: (value) {
                        if (value.isEmpty) {
                          return 'Please,Enter Your Password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      'By clicking Create Account, you acknowledge you have read and agreed to our Terms of Use and Privacy Policy',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: HexColor('#616161'),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    ConditionalBuilder(
                      condition: state is! RegisterLoadingState,
                      builder: (BuildContext context) => defaultButton(
                        text: 'Create Account',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.register(
                              email: emailController.text,
                              password: passwordController.text,
                              fName: fNameController.text,
                              lName: lNameController.text,
                            );
                          }
                        },
                      ),
                      fallback: (BuildContext context) =>
                          Center(child: CircularProgressIndicator()),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
