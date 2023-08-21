// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/note_list.dart';
import '../../models/note.dart';
import '../../shared/edit_app_bar.dart';
import '../home/home.dart';

class EditNote extends StatefulWidget {
  final Note note;

  const EditNote({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  EditNoteState createState() => EditNoteState();
}

class EditNoteState extends State<EditNote> {
  late TextEditingController _titleController;
  late TextEditingController _noteDetailController;
  late int _noteID;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _isEditing = true;
    _titleController = TextEditingController(text: widget.note.title);
    _noteDetailController = TextEditingController(text: widget.note.noteDetail);
    _noteID = widget.note.noteID;
  }

  @override
  Widget build(BuildContext context) {
    log('Edit note');
    return SafeArea(
      child: Scaffold(
        appBar: editAppBar(
          context,
          onSaveTap: () async {
            String title = _titleController.text;
            String noteDetail = _noteDetailController.text;

            // Edits an existing note
            Note note = widget.note;
            note.title = title;
            note.noteDetail = noteDetail;

            int index = noteList.indexWhere((note) => note.noteID == _noteID);

            if (_isEditing) {
              setState(() {
                // Updates the note in the noteList
                noteList[index] = note;
              });
            }

            SharedPreferences prefs = await SharedPreferences.getInstance();
            String noteKey = 'note_$_noteID';
            prefs.setString(noteKey, note.toJson());

            if (!mounted) return;

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
            );
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
