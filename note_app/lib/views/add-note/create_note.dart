// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:note_app/constants/note_list.dart';
import 'package:note_app/models/note.dart';

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

  void addNote({
    required String title,
    required String noteDetail,
    required String color,
  }) {
    setState(() {
      noteList.add(Note(
        noteID: generateNoteID(),
        title: title,
        noteDetail: noteDetail,
        color: color,
      ));
    });
  }

  //generate random id
  int generateNoteID() {
    var random = math.Random();
    return random.nextInt(999999);
  }

  //genrate random color for example "0xffA7F6A5"
  String generateRandomColor() {
    var random = math.Random();
    int r = random.nextInt(255);
    int g = random.nextInt(255);
    int b = random.nextInt(255);
    return "0xff$r$g$b";
  }

  @override
  Widget build(BuildContext context) {
    log('Edit note');
    return SafeArea(
      child: Scaffold(
        appBar: editAppBar(
          context,
          onSaveTap: () {
            addNote(
              title: _titleController.text,
              noteDetail: _noteDetailController.text,
              color: generateRandomColor(),
            );
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
