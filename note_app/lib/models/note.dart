import 'dart:convert';

class Note {
  final int noteID;
  String title;
  String noteDetail;
  final String color;
  Note({
    required this.noteID,
    required this.title,
    required this.noteDetail,
    required this.color,
  });

  factory Note.fromJsonString(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    return Note(
      noteID: json['noteID'],
      title: json['title'],
      noteDetail: json['noteDetail'],
      color: json['color'],
    );
  }

  String toJsonString() {
    return jsonEncode({
      'noteID': noteID,
      'title': title,
      'noteDetail': noteDetail,
      'color': color,
    });
  }
}
