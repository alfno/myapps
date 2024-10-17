class ReminderModel {
  final int? id;
  final String title;
  final String imagePath;
  final String releaseDate;

  ReminderModel({this.id, required this.title, required this.imagePath, required this.releaseDate});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'imagePath': imagePath,
      'releaseDate': releaseDate,
    };
  }

  static ReminderModel fromMap(Map<String, dynamic> map) {
    return ReminderModel(
      id: map['id'],
      title: map['title'],
      imagePath: map['imagePath'],
      releaseDate: map['releaseDate'],
    );
  }
}
