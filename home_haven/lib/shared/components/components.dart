import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget defaultButton({
  required String text,
  required VoidCallback onPressed,
}) =>
    Container(
      decoration: BoxDecoration(
          color: HexColor('#156651'),
          borderRadius: BorderRadius.circular(10.0)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: 43.0,
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
      ),
    );

void navigateAndFinish(
        {required BuildContext context, required Widget widget}) =>
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => widget));

void navigateTo({required BuildContext context, required Widget widget}) =>
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => widget));

Widget formField({
  required String label,
  required IconData prefix,
  IconData? suffix,
  required TextInputType type,
  required TextEditingController controller,
  required FormFieldValidator validateFunction,
  String? Function(String?)? submit,
  VoidCallback? pressed,
  bool obscureText = false,
}) =>
    Container(
      height: 53.0,
      width: double.infinity,
      child: TextFormField(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              12.0,
            ),
            borderSide: BorderSide(color: HexColor('#156651'), width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              12.0,
            ),
            borderSide: BorderSide(color: HexColor('#C2C2C2'), width: 0.8),
          ),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            prefix,
            size: 24.0,
            color: HexColor('#757575'),
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: pressed,
                  icon: Icon(
                    suffix,
                    size: 24.0,
                    color: HexColor('#757575'),
                  ))
              : null,
          focusColor: HexColor('#156651'),
          label: Text(label),
        ),
        style: TextStyle(
          fontSize: 17.0,
          color: HexColor('#404040'),
        ),
        keyboardType: type,
        validator: validateFunction,
        onFieldSubmitted: submit,
        cursorOpacityAnimates: true,
        controller: controller,
        obscureText: obscureText,
      ),
    );
