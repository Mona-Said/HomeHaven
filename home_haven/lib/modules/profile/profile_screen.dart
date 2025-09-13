import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'PROFILE SCREEN',
            style: TextStyle(color: Colors.cyan),
          ),
        ),
      ],
    );
  }
}
