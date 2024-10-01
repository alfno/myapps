import 'package:flutter/material.dart';
import 'package:myapps/data/iklan_data.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyIklan extends StatelessWidget {
  const MyIklan({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 180,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        enlargeCenterPage: true,
        viewportFraction: 0.6,
      ),
      items: IklanData.imageList.map((IklanModel) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  IklanModel.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
