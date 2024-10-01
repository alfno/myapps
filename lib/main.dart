import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapps/bindings/bindings.dart';
import 'package:myapps/pages/dashboard.dart';
import 'package:myapps/pages/loginPage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        //list all pages here
        GetPage(
           name: '/', 
           page: () => LoginPage(),

           ),

        GetPage(
           name: '/dashboard',
           page: () => DashboardPage(),
           binding: MyBindings()

           )
      ],
    );
  }
}


