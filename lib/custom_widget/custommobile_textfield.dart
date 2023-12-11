import 'package:flutter/material.dart';
import 'package:kayla/utilities/dimensions.dart';

class CustomOtpTextField extends StatefulWidget {
  const CustomOtpTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.validator,
    required this.keyBoard,
  }) : super(key: key);

  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int keyBoard;

  @override
  State<CustomOtpTextField> createState() => _CustomOtpTextFieldState();
}

class _CustomOtpTextFieldState extends State<CustomOtpTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.heightCalc(context, 20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(Dimensions.heightCalc(context, 20))),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(
                Radius.circular(Dimensions.heightCalc(context, 20))),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: widget.hintText,
          hintStyle: const TextStyle(fontFamily: 'RobotoMedium'),
          labelText: widget.labelText,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelStyle: const TextStyle(
            fontFamily: 'RobotoMedium',
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),
        validator: widget.validator,
      ),
    );
  }
}
