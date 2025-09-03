import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:home_haven/shared/components/components.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              type: TextInputType.visiblePassword,
              controller: passwordController,
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
              height: 32.0,
            ),
            Align(
              alignment: AlignmentGeometry.center,
              child: Text(
                'OR',
                style: TextStyle(
                  fontSize: 15.0,
                  color: HexColor('#404040'),
                ),
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
          ],
        ),
      ),
    );
  }
}
