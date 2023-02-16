import 'package:flutter/material.dart';

class CustomButton1 extends TextButton {
  final String text;

  CustomButton1({
    required this.text,
    super.key,
    required super.onPressed,
  }) : super(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.red;
              }
              return Colors.blue;
            }),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
          child: Text(text),
        );
}
