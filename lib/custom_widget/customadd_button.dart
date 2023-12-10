import 'package:flutter/material.dart';
import 'package:kayla/utilities/dimensions.dart';

class CustomAddButton extends StatelessWidget {
  CustomAddButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xff01796F)),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontSize: Dimensions.heightCalc(context, 15)),
      ),
    );
  }
}
