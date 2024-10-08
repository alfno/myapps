import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String labelText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextEditingController controller;

  const MyTextField({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.0,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: labelText,
          hintStyle: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            fontFamily: 'MontserratMedium',
            color: Colors.grey,
          ),
          labelText: labelText, 
          labelStyle: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.grey, 
          ),
          
          prefixIcon: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(prefixIcon, color: Colors.grey),
          ),
          suffixIcon: suffixIcon != null 
            ? Padding(
                padding: const EdgeInsets.all(15.0),
                child: Icon(suffixIcon, color: Colors.grey),
              )
            : null,
          border: InputBorder.none, // Remove the default border
        ),
      ),
    );
  }
}
