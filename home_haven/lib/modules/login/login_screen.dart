import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:home_haven/modules/home/home_screen.dart';
import 'package:home_haven/modules/login/cubit/cubit.dart';
import 'package:home_haven/modules/login/cubit/states.dart';
import 'package:home_haven/modules/register/register_screen.dart';
import 'package:home_haven/shared/components/components.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, state) {
          if (state is LoginSuccessState) {
            navigateAndFinish(context: context, widget: HomeScreen());
          }
        },
        builder: (BuildContext context, state) {
          var cubit = LoginCubit.get(context);
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
                      'Welcome Back!',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'Enter your email to start shopping and get awesome deals today!',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: HexColor('#9E9E9E')),
                    ),
                    SizedBox(
                      height: 32.0,
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
                      controller: passwordController,
                      obscureText: cubit.isPassword,
                      pressed: () {
                        cubit.changeVisiblity();
                      },
                      validateFunction: (value) {
                        if (value.isEmpty) {
                          return 'Please,Enter Your Password';
                        }
                        return null;
                      },
                      submit: (value) {
                        if (formKey.currentState!.validate()) {
                          cubit.login(
                              email: emailController.text,
                              password: passwordController.text);
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    ConditionalBuilder(
                      condition: state is! LoginLoadingState,
                      builder: (BuildContext context) => defaultButton(
                        text: 'Log In',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.login(
                                email: emailController.text,
                                password: passwordController.text);
                          }
                        },
                      ),
                      fallback: (BuildContext context) =>
                          Center(child: CircularProgressIndicator()),
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: HexColor('#404040'),
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        InkWell(
                          onTap: () {
                            navigateTo(
                                context: context, widget: RegisterScreen());
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: HexColor('#156651'),
                            ),
                          ),
                        ),
                      ],
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
