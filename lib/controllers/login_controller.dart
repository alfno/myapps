import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var username = "admin";
  var password = "admin";

  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var isLoggedIn = false.obs; 

  void login() {
    if (usernameController.text.trim() == username && passwordController.text.trim() == password) {
    isLoggedIn.value = true;

    Get.snackbar(
        'Success',
        'Login berhasil! Selamat datang!',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );

      
      Future.delayed(Duration(seconds: 2), () {
        Get.toNamed('/dashboard');
      });
    } else {
      Get.snackbar('Error', 'Username atau password salah', snackPosition: SnackPosition.BOTTOM);
    }
  }
}
