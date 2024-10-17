import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapps/models/model_coming_soon.dart';
import 'package:myapps/models/reminder_model.dart';
import 'package:myapps/widget/mycategory.dart';
import 'package:myapps/widget/mycolor.dart';
import 'package:myapps/widget/myfonts.dart';
import 'package:myapps/controllers/reminder_controller.dart';

class ComingSoonItem extends StatelessWidget {
  final ComingSoonModel comingSoonModel;
  final ReminderController reminderController = Get.put(ReminderController());

  ComingSoonItem({
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(comingSoonModel.imagePath),
                  ),
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
                // Ini reminder button nya
                TextButton(
                  onPressed: () async {
                    // ini buat cek udah ada apa blom 
                    bool isAlreadyAdded = await reminderController
                        .isAlreadyInReminder(comingSoonModel.title);
                    if (isAlreadyAdded) {
                      Get.snackbar(
                        'Item Sudah Ada',
                        'Item ini sudah ada di tambahkan',
                        snackPosition: SnackPosition.TOP,
                      );
                    } else {
                      ReminderModel reminder = ReminderModel(
                        title: comingSoonModel.title,
                        imagePath: comingSoonModel.imagePath,
                        releaseDate: comingSoonModel.releaseDate,
                      );
                      await reminderController.addReminder(reminder);
                      Get.snackbar(
                        'Pengingat Ditambahkan',
                        'Item berhasil ditambahkan ke reminder list.',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    }
                    Navigator.of(context).pop();
                  },
                  child: const CustomText(
                    text: 'Ingatkan aku !!',
                    color: MyColor.backgroundColor2,
                  ),
                ),
                // Ini untuk close nya
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

      // ini bagian card
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: const EdgeInsets.all(6.0),
        child: Padding(
          padding:
              const EdgeInsets.only(bottom: 4, left: 16, right: 16, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // gambar
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  comingSoonModel.imagePath,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),

              // Row untuk tanggal dan kategori nya
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Kategori
                  Row(
                    children: comingSoonModel.categories.map((category) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: MyCategory(
                          label: category,
                          onPressed: () {},
                        ),
                      );
                    }).toList(),
                  ),
                  // Tanggal
                  Text(
                    comingSoonModel.releaseDate,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'MontserratMedium',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),

              // tittle
              Text(
                comingSoonModel.title,
                style: TextStyle(
                  color: MyColor.backgroundColor2,
                  fontFamily: 'MontserratBold',
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
