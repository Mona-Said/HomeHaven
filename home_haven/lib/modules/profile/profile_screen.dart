import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_haven/shared/components/components.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  var fNameController = TextEditingController();
  var lNameController = TextEditingController();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeHavenCubit, HomeHavenStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = HomeHavenCubit.get(context);

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                height: 50.0,
              ),
              defaultButton(
                  text: 'Update Profile',
                  onPressed: () {
                    cubit.updateUserData(
                        fName: fNameController.text,
                        lName: lNameController.text,
                        email: emailController.text);
                  }),
            ],
          ),
        );
      },
    );
  }
}
