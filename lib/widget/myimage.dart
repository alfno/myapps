import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;

  const MyImage({
    Key? key,
    required this.imagePath,
    this.width = 130,
    this.height = 180,
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
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
