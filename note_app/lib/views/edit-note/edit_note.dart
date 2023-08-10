import 'package:flutter/material.dart';

import '../../constants/note.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: editAppBar(context),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _titleController,
                  style: Theme.of(context).textTheme.displaySmall,
                  maxLines: 4,
                  decoration: const InputDecoration.collapsed(
                    hintText: "",
                  ),
                  keyboardType: TextInputType.multiline,
                  autofocus: true,
                ),
                const SizedBox(
                  height: 37.0,
                ),
                TextField(
                  controller: _noteDetailController,
                  style: Theme.of(context).textTheme.headlineMedium?.merge(
                        const TextStyle(fontStyle: FontStyle.italic),
                      ),
                  decoration: const InputDecoration.collapsed(
                    hintText: "",
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 600,
                ),
              ],
            ),
          ),
        ),
        resizeToAvoidBottomInset: true,
      ),
    );
  }
}
