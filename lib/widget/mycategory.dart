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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,  // Mengatur tinggi button
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.backgroundColor, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), 
          ),
          padding: EdgeInsets.symmetric(horizontal: 4), 
          // Mengurangi padding untuk memperkecil tombol
        ),
        onPressed: widget.onPressed, 
        child: Text(
          widget.label,
          style: TextStyle(
            fontSize: 10, // Mengecilkan ukuran font
            fontFamily: 'MontserratMedium', 
            color: widget.textColor, 
          ),
        ),
      ),
    );
  }
}
