import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:myapps/models/reminder_model.dart';

class ReminderController extends GetxController {
  static Database? _db;
  var favoriteReminders = <ReminderModel>[].obs;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDB();
    }
    return _db;
  }

  Future<Database> initDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'reminder_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE reminders(
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            title TEXT, 
            imagePath TEXT, 
            releaseDate TEXT
          )
        ''');
      },
    );
  }

  @override
  void onInit() {
    super.onInit();
    loadReminders(); 
  }

  // untuk memasukan Reminder
  Future<int> addReminder(ReminderModel reminder) async {
    var dbClient = await db;
    int result = await dbClient!.insert('reminders', reminder.toMap());
    loadReminders();
    return result;
  }

  // untuk menerima Reminders
  Future<void> loadReminders() async {
    var dbClient = await db;
    List<Map<String, dynamic>> queryResult = await dbClient!.query('reminders');
    favoriteReminders.assignAll(queryResult.map((data) => ReminderModel.fromMap(data)).toList());
  }

  // untuk menghapus Reminder
  Future<void> removeReminder(ReminderModel reminder) async {
    var dbClient = await db;
    await dbClient!.delete('reminders', where: 'id = ?', whereArgs: [reminder.id]);
    loadReminders();
  }

  // ini buat cek apakah reminder sudah ada di simpen blm
  Future<bool> isAlreadyInReminder(String title) async {
    var dbClient = await db;
    List<Map<String, dynamic>> result = await dbClient!.query(
      'reminders',
      where: 'title = ?',
      whereArgs: [title],
    );
    return result.isNotEmpty;
  }
}

