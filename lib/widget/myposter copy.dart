import 'package:flutter/material.dart';


class MyPoster extends StatelessWidget {
  final String image;
  final String title;
  final String rating; 

  const MyPoster({
    Key? key,
    required this.image,
    required this.title,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          image,
          width: 180,
          height: 230,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'MontserratBold',
          ),
        ),
        const SizedBox(height: 2),
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
              size: 16,
            ),
            const SizedBox(width: 2),
            Text(
              rating,
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'MontserratMedium',
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
