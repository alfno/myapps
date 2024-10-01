import 'package:flutter/material.dart';
import 'package:myapps/widget/mycolor.dart';

class MyCategory extends StatefulWidget {
  final String label;
  final VoidCallback onPressed; 
  final Color backgroundColor;
  final Color textColor;

  const MyCategory({
    Key? key,
    required this.label,
    required this.onPressed, 
    this.backgroundColor = MyColor.backgroundColor, 
    this.textColor = Colors.white, 
  }) : super(key: key);

  @override
  _MyCategoryState createState() => _MyCategoryState();
}

class _MyCategoryState extends State<MyCategory> {
  bool isHovered = false; 

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true), 
      onExit: (_) => setState(() => isHovered = false), 
      child: AnimatedScale(
        scale: isHovered ? 1.1 : 1.0, 
        duration: Duration(milliseconds: 200), 
        child: SizedBox(
          height: 30, 
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.backgroundColor, 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), 
              ),
              padding: EdgeInsets.symmetric(horizontal: 10), 
            ),
            onPressed: widget.onPressed, 
            child: Text(
              widget.label,
              style: TextStyle(
                fontSize: 12, 
                fontFamily: 'MontserratMedium', 
                color: widget.textColor, 
              ),
            ),
          ),
        ),
      ),
    );
  }
}
