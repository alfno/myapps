import 'package:flutter/material.dart';

class MyLogo extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;

  const MyLogo({
    Key? key,
    required this.imagePath, 
    this.width = 100.0, 
    this.height = 100.0, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0), 
        image: DecorationImage(
          image: AssetImage(imagePath), 
          fit: BoxFit.contain, 
        ),
      ),
    );
  }
}
