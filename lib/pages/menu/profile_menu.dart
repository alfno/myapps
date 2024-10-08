import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapps/widget/mycolor.dart';
import 'package:myapps/widget/myfonts.dart';
import 'package:myapps/widget/myjudul.dart';
import 'package:myapps/widget/mylogo.dart';


class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/pp.jpg'), 
              ),
            ),
            SizedBox(height: 16),

            
            Center(
              child: CustomTextH1(
                text: "Admin", 
                
              ),
            ),
            SizedBox(height: 8),

            
            ListTile(
              leading: Icon(Icons.person),
              title: CustomText(text: "Edit Profil"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: CustomText(text: "Notifikasi"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: CustomText(text: "Keamanan"),
              onTap: () {},
            ),
            SizedBox(height: 20),

            
            Center(
              child: ElevatedButton(
                onPressed: () {
                  
                  Get.snackbar(
                    'Log Out', 
                    'Tunggu 2 detik, Log out nih.', 
                    snackPosition: SnackPosition.BOTTOM,
                    colorText: Colors.black,
                    duration: Duration(seconds: 2),
                  );

                  Future.delayed(Duration(seconds: 2), () {
                    Get.toNamed('/');
                  });
                },
                child: CustomText(text: "Log Out"), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
