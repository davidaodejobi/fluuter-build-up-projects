import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:note_app/constants/note_list.dart';

import '../../models/note.dart';
import '../../shared/edit_app_bar.dart';

class EditNote extends StatefulWidget {
  final Note note;

  const EditNote({Key? key, required this.note}) : super(key: key);

  @override
  EditNoteState createState() => EditNoteState();
}

class EditNoteState extends State<EditNote> {
  late TextEditingController _titleController;
  late TextEditingController _noteDetailController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note.title);
    _noteDetailController = TextEditingController(text: widget.note.noteDetail);
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
            log('Helloooooooooooo');
            // addNote(
            //   title: _titleController.text,
            //   noteDetail: _noteDetailController.text,
            //   color: generateRandomColor(),
            // );
            // print('noteList.length: ${noteList.length}');
            // Navigator.pop(context);
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
                    hintText: "",
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
                    hintText: "",
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
