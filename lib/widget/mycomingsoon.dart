import 'package:flutter/material.dart';
import 'package:myapps/models/model_coming_soon.dart';
import 'package:myapps/widget/mycolor.dart';
import 'package:myapps/widget/myfonts.dart';


class ComingSoonItem extends StatelessWidget {
  final ComingSoonModel comingSoonModel;

  const ComingSoonItem({
    required this.comingSoonModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                comingSoonModel.title,
                style: TextStyle(
                  color: MyColor.backgroundColor2,
                  fontFamily: 'MontserratBold',
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(comingSoonModel.imagePath),
                  const SizedBox(height: 16),
                  Text(
                    comingSoonModel.description,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'MontserratMedium',
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const CustomText(text: 'Close'),
                ),
              ],
            );
          },
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            comingSoonModel.imagePath,
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 8),
          Text(
            comingSoonModel.releaseDate,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'MontserratMedium',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            comingSoonModel.title,
            style: TextStyle(
              color: MyColor.backgroundColor2,
              fontFamily: 'MontserratBold',
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
