import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapps/controllers/login_controller.dart';
import 'package:myapps/widget/mycategory.dart';
import 'package:myapps/widget/mycolor.dart';
import 'package:myapps/widget/myjudul.dart';
import 'package:myapps/widget/mylogo.dart';
import 'package:myapps/widget/mytextfield.dart';




class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController controller = Get.put(LoginController()); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, 
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            const SizedBox(height: 50),
            MyLogo(imagePath: 'assets/logo2.jpg', 
            width: 135,
            height: 135,),

            CustomTextH1(text: "MyMovies", ),

            SizedBox(height: 50,),

            MyTextField(
              labelText: "Username",
              prefixIcon: Icons.person,
              controller: controller.usernameController, 
            ),
            const SizedBox(height: 25),
            MyTextField(
              labelText: "Password",
              prefixIcon: Icons.lock,
              controller: controller.passwordController, 
              obscureText: true, 
            ),

            SizedBox(height: 40,),

            Container(
              width: 180, 
              height: 30, 
              child: MyCategory(
                label: "Login",
                onPressed: () {
                  controller.login();
                },
                backgroundColor: Colors.white,
                textColor: MyColor.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
