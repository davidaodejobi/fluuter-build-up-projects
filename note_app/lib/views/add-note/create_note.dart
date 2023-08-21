// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:note_app/constants/note_list.dart';
import 'package:note_app/models/note.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/edit_app_bar.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  late TextEditingController _titleController;
  late TextEditingController _noteDetailController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _noteDetailController = TextEditingController();
  }

  Future<void> addNote({
    required String title,
    required String noteDetail,
    required String color,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int noteID = generateNoteID();
    String noteKey = 'note_$noteID';
    Note note = Note(
      noteID: noteID,
      title: title,
      noteDetail: noteDetail,
      color: color,
    );

    // Serialize note object as a string and save to SharedPreferences
    prefs.setString(noteKey, note.toJson());

    // Update UI state with the new note
    setState(() {
      // widget.notes.add(note);
      noteList.add(note);
    });
  }

  //generate random id
  int generateNoteID() {
    var random = math.Random();
    return random.nextInt(999999);
  }

  //genrate random bright color for example "0xffA7F6A5"
  String generateRandomColor() {
    var random = math.Random();
    double hue = random.nextDouble(); // Random hue value between 0 and 1
    double saturation =
        random.nextDouble() * 0.5 + 0.5; // Saturation between 0.5 and 1
    double brightness =
        random.nextDouble() * 0.4 + 0.6; // Brightness between 0.6 and 1

    int r =
        HSVColor.fromAHSV(1.0, hue * 360, saturation, brightness).toColor().red;
    int g = HSVColor.fromAHSV(1.0, hue * 360, saturation, brightness)
        .toColor()
        .green;
    int b = HSVColor.fromAHSV(1.0, hue * 360, saturation, brightness)
        .toColor()
        .blue;

    return "0xff${r.toRadixString(16).padLeft(2, '0')}${g.toRadixString(16).padLeft(2, '0')}${b.toRadixString(16).padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    log('Edit note');
    return SafeArea(
      child: Scaffold(
        appBar: editAppBar(
          context,
          onSaveTap: () async {
            await addNote(
              title: _titleController.text,
              noteDetail: _noteDetailController.text,
              color: generateRandomColor(),
            );
            if (!mounted) return;
            Navigator.pop(context);
            _titleController.clear();
            _noteDetailController.clear();
          },
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150.0,
                child: TextField(
                  controller: _titleController,
                  style: Theme.of(context).textTheme.displaySmall,
                  maxLines: null, // Set this
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration.collapsed(
                    hintText: "Note title",
                  ),
                  autofocus: true,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _noteDetailController,
                  style: Theme.of(context).textTheme.headlineMedium?.merge(
                        const TextStyle(fontStyle: FontStyle.italic),
                      ),
                  maxLines: null, // Set this
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration.collapsed(
                    hintText: "Note detail",
                  ),
                  // keyboardType: TextInputType.multiline,
                  // maxLines: 600,
                ),
              ),
            ],
          ),
        ),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
