// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:note_app/views/note-details/note_details.dart';

class NoteDetails extends StatelessWidget {
  NoteDetails({
    Key? key,
  }) : super(key: key);

  final noteList = [
    const NoteDetail(
        noteID: 1,
        title: "UI concepts worth exsisting",
        noteDetail:
            "UI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsisting",
        color: "0xffFD99FF"),
    const NoteDetail(
        noteID: 2,
        title: "Book Review : The Design of Everyday Things by Don Norman",
        noteDetail:
            "UI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsisting",
        color: "0xffFF9E9E"),
    const NoteDetail(
        noteID: 3,
        title: "Animes produced by Ufotable",
        noteDetail:
            "UI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsisting",
        color: "0xff91F48F"),
    const NoteDetail(
        noteID: 4,
        title: "Mangas planned on reading the book",
        noteDetail:
            "UI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsisting",
        color: "0xffFFF599"),
    const NoteDetail(
        noteID: 5,
        title: "Awesome tweets collection",
        noteDetail:
            "UI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsisting",
        color: "0xffFD99FF"),
    const NoteDetail(
        noteID: 6,
        title: "UI concepts worth exsisting",
        noteDetail:
            "UI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsisting",
        color: "0xffFF9E9E"),
    const NoteDetail(
        noteID: 7,
        title: "List of free & open source apps",
        noteDetail:
            "UI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsisting",
        color: "0xffFFF599"),
    const NoteDetail(
        noteID: 8,
        title: "UI concepts worth exsisting",
        noteDetail:
            "UI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsistingUI concepts worth exsisting",
        color: "0xff9EFFFF"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 16.0,
      ),
      children: [...noteList],
    );
  }
}
