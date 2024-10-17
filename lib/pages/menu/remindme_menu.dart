import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapps/controllers/reminder_controller.dart';
import 'package:myapps/models/reminder_model.dart';
import 'package:myapps/widget/mycolor.dart';
import 'package:myapps/widget/myfonts.dart';
import 'package:myapps/widget/mylogo.dart';

class ReminderMenu extends StatelessWidget {
  final ReminderController reminderController = Get.find<ReminderController>();

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
      body: Obx(() {
        if (reminderController.favoriteReminders.isEmpty) {
          return Center(
            child: CustomText(
              text: "Belum ada pengingat yang ditambahkan.",
              color: Colors.black,
            ),
          );
        }
        return ListView.builder(
          itemCount: reminderController.favoriteReminders.length,
          itemBuilder: (context, index) {
            final ReminderModel reminder =
                reminderController.favoriteReminders[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Card(
                elevation: 3, // Bayangan
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    // Gambar
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                      child: Image.asset(
                        reminder.imagePath,
                        width: 100,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12.0),

                    // Bagian judul dan tanggal
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Judul
                            Text(
                              reminder.title,
                              style: TextStyle(
                                fontFamily: 'MontserratBold',
                                fontSize: 16.0,
                                color: MyColor.backgroundColor2,
                              ),
                            ),
                            const SizedBox(height: 4.0),

                            // Tanggal
                            Text(
                              reminder.releaseDate,
                              style: TextStyle(
                                fontFamily: 'MontserratMedium',
                                fontSize: 12.0,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Tombol Hapus (ditempatkan di sebelah kanan)
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        Get.defaultDialog(
                          title: "Peringatan",
                          titleStyle: TextStyle(
                            fontFamily: 'MontserratBold',
                            fontSize: 18.0,
                            color: MyColor.backgroundColor2,
                          ),
                          middleText: "Kamu yakin ingin menghapus pengingat ini?",
                          middleTextStyle: TextStyle(
                            fontFamily: 'MontserratMedium',
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          textConfirm: "Iya",
                          textCancel: "Tidak",
                          onConfirm: () {
                            reminderController.removeReminder(reminder);
                            Get.back();
                          },
                          onCancel: () {
                            Get.back();
                          },
                          confirmTextColor: Colors.white,
                          cancelTextColor: MyColor.backgroundColor,
                          buttonColor: MyColor.backgroundColor,
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
