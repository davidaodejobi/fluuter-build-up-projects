// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:note_app/utils/note_list.dart';
import 'package:note_app/views/note-details/detail_screen.dart';

class NoteDetails extends StatefulWidget {
  const NoteDetails({
    Key? key,
  }) : super(key: key);

  @override
  NoteDetailsState createState() => NoteDetailsState();
}

void _deleteNote(int index) {
  print("Delete note $index");
}

class NoteDetailsState extends State<NoteDetails> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20.0),
      itemCount: noteList.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            _deleteNote(index);
          },
          child: GestureDetector(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    note: noteList[index],
                  ),
                ),
              )
            },
            child: ListTile(
              contentPadding: const EdgeInsets.all(30.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: Text(
                noteList[index].title,
                style: Theme.of(context).textTheme.headlineMedium?.merge(
                      const TextStyle(color: Colors.black),
                    ),
              ),
              tileColor: Color(int.parse(noteList[index].color)),
            ),
          ),
        ),
      ),
    );
  }
}
