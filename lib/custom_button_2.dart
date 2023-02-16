import 'package:flutter/material.dart';

class CustomButton2 extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const CustomButton2({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
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
      onPressed: onPressed,
      child: Text(text),
    );
    // return GestureDetector(
    //   onTap: () {
    //     print('object');
    //   },
    //   child: Container(
    //     width: 100,
    //     height: 40,
    //     decoration: BoxDecoration(
    //       color: Colors.red,
    //       borderRadius: BorderRadius.circular(40),
    //     ),
    //     alignment: Alignment.center,
    //     child: Text(text),
    //   ),
    // );
  }
}
