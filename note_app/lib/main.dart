import 'package:flutter/material.dart';
import 'package:note_app/models/note.dart';
import 'package:note_app/utils/app_theme.dart';
import 'package:note_app/views/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/note_list.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<Note> savedNotes = [];

  for (String key in prefs.getKeys()) {
    if (key.startsWith('note_')) {
      String jsonString = prefs.getString(key) ?? '';
      Note note = Note.fromJson(jsonString);
      savedNotes.add(note);
    }
  }

  noteList = savedNotes;

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkMode(),
      home: const Home(),
    );
  }
}
