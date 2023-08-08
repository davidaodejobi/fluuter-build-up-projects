// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:note_app/views/note-details/detail_screen.dart';

import '../../constants/notes.dart';

class NoteDetails extends StatelessWidget {
  NoteDetails({
    Key? key,
  }) : super(key: key);

  final List<Note> noteList = [
    Note(
      noteID: 1,
      title: "UI concepts worth existing",
      noteDetail:
          "UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing",
      color: "0xffFFE6FF",
    ),
    Note(
      noteID: 2,
      title: "Book Review: The Design of Everyday Things by Don Norman",
      noteDetail:
          "UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing",
      color: "0xffFFD1D1",
    ),
    Note(
      noteID: 3,
      title: "Animes produced by Ufotable",
      noteDetail:
          "UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing",
      color: "0xffA7F6A5",
    ),
    Note(
      noteID: 4,
      title: "Mangas planned on reading the book",
      noteDetail:
          "UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing",
      color: "0xffFFFFB3",
    ),
    Note(
      noteID: 5,
      title: "Awesome tweets collection",
      noteDetail:
          "UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing",
      color: "0xffFFE6FF",
    ),
    Note(
      noteID: 6,
      title: "UI concepts worth existing",
      noteDetail:
          "UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing",
      color: "0xffFFD1D1",
    ),
    Note(
      noteID: 7,
      title: "List of free & open-source apps",
      noteDetail:
          "UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing",
      color: "0xffFFFFB3",
    ),
    Note(
      noteID: 8,
      title: "UI concepts worth existing",
      noteDetail:
          "UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing UI concepts worth existing",
      color: "0xffD1FFFF",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20.0),
      itemCount: noteList.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
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
    );
  }
}
