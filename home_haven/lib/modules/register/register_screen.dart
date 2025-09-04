import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/components/components.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  var fNameController = TextEditingController();
  var lNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
            defaultButton(
              text: 'Create Account',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
