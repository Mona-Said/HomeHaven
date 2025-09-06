import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:home_haven/modules/login/cubit/cubit.dart';
import 'package:home_haven/modules/login/cubit/states.dart';
import 'package:home_haven/modules/register/register_screen.dart';
import 'package:home_haven/shared/components/components.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
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
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  defaultButton(
                    text: 'Log In',
                    onPressed: () {},
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
          );
        },
      ),
    );
  }
}
