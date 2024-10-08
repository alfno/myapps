import 'package:flutter/material.dart';
import 'package:myapps/widget/mycolor.dart';




class CustomText extends StatelessWidget {
  final String text;
  final String fontFamily;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;

  const CustomText({
    Key? key,
    required this.text,
    this.fontFamily = 'MontserratMedium', 
    this.fontSize = 14.0, 
    this.color = MyColor.textColor, 
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: color,
      ),
      textAlign: textAlign,
    );
  }
}





