// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:note_app/constants/note_list.dart';
import 'package:note_app/models/note.dart';
import 'package:note_app/views/edit-note/edit_note.dart';
import 'package:note_app/views/note-details/widgets/delete_slide.dart';

class NoteLists extends StatefulWidget {
  final List<Note> noteListy;
  const NoteLists({
    Key? key,
    required this.noteListy,
  }) : super(key: key);

  @override
  NoteListsState createState() => NoteListsState();
}

class NoteListsState extends State<NoteLists> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12.0),
      itemCount: widget.noteListy.length,
      itemBuilder: (context, index) {
        final note = widget.noteListy[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Dismissible(
            key: Key(note.noteID.toString()),
            background: deleteSlide(),
            secondaryBackground: deleteSlide(),
            onDismissed: (direction) {
              setState(() {
                noteList.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Note Deleted')),
              );
            },
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditNote(
                    note: note,
                  ),
                ),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                title: Text(
                  note.title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.merge(const TextStyle(color: Colors.black)),
                ),
                tileColor: Color(int.parse(note.color)),
              ),
            ),
          ),
        );
      },
    );
  }
}
