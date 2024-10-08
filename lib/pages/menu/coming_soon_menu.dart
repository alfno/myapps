import 'package:flutter/material.dart';
import 'package:myapps/data/coming_soon_data.dart';
import 'package:myapps/widget/mycolor.dart';
import 'package:myapps/widget/mycomingsoon.dart';
import 'package:myapps/widget/myfonts.dart';
import 'package:myapps/widget/myiklan.dart';
import 'package:myapps/widget/myjudul.dart';
import 'package:myapps/widget/mylogo.dart';


class ComingSoonMenu extends StatelessWidget {
  const ComingSoonMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColor.backgroundColor,
        title: Row(
          children: [
            MyLogo(
              imagePath: 'assets/logo.png',
              width: 30.0,
              height: 30.0,
            ),
            const SizedBox(width: 8),
            CustomText(
              text: "MyMovies",
              fontSize: 16.0,
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0),
            child: CustomTextH1(
              text: "Coming Soon",
              color: MyColor.backgroundColor2,
            ),
          ),
          SizedBox(height: 16),

          MyIklan(),

          SizedBox(height: 16),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0),
            child: CustomTextH1(
              text: "Film-film yang akan tayang",
              fontSize: 20,

            ),
          ),
          const SizedBox(height: 16),

          ...ComingSoonData.comingSoonList.map(
            (comingSoon) => ComingSoonItem(
              comingSoonModel: comingSoon,
            ),
          ),
        ],
      ),
    );
  }
}
