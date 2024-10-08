import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapps/controllers/movie_controllers.dart';
import 'package:myapps/widget/mycategory.dart';
import 'package:myapps/widget/mycolor.dart';
import 'package:myapps/widget/myfonts.dart';
import 'package:myapps/widget/myimage.dart';
import 'package:myapps/widget/myjudul.dart';
import 'package:myapps/widget/mylogo.dart';
import 'package:myapps/widget/myposter.dart';


class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  final MovieController movieController = Get.put(MovieController()); 

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
            SizedBox(width: 8), 
            CustomText(
              text: "MyMovies",
              fontSize: 16.0,
              color: Colors.white,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextH1(
                text: 'Home',
                color: MyColor.backgroundColor2,
              ),

              SizedBox(height: 20),

              CustomTextH1(
                text: 'Trending Now',
              ),
              
              SizedBox(
                height: 300,
                child: Obx(() {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemCount: movieController.movieList.length, //Ambil datanya dari controller
                    itemBuilder: (context, index) {
                      final movie = movieController.movieList[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {},
                          child: MyPoster(
                            image: movie.image,
                            title: movie.title,
                            rating: movie.rating,
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),

              SizedBox(height: 20),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextH1(text: "Now playing"),
                  MyCategory(label: "Action", onPressed: () {}),
                  MyCategory(label: "Drama", onPressed: () {}),
                  MyCategory(label: "Cartoon", onPressed: () {}),
                  MyCategory(label: "Romance", onPressed: () {}),
                ],
              ),
              SizedBox(height: 20),

              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  //untuk mengatur layout image nya
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.0, //kolom
                  mainAxisSpacing: 10.0, //baris
                  childAspectRatio: 0.8,
                ),
                itemCount: 33,  
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyImage(
                          imagePath: 'assets/poster${index + 1}.jpg', 
                        ),
                        SizedBox(height: 4.0),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
