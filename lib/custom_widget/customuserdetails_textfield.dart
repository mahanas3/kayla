import 'package:flutter/material.dart';

class CustomUserTextField extends StatefulWidget {
  const CustomUserTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.validator,

  }) : super(key: key);

  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;


  @override
  State<CustomUserTextField> createState() => _CustomUserTextFieldState();
}

class _CustomUserTextFieldState extends State<CustomUserTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          filled: true,
          fillColor: Colors.white,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusColor: Colors.grey,
          hintText: widget.hintText,
          hintStyle: const TextStyle(fontFamily: 'RobotoMedium'),
          labelText: widget.labelText,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontFamily: 'RobotoMedium',
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),
      ),
    );
  }
}
