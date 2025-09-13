import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'CART SCREEN',
            style: TextStyle(color: Colors.pink),
          ),
        ),
      ],
    );
  }
}
