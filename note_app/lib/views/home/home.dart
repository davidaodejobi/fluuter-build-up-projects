// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:note_app/shared/appbar_card.dart';
import 'package:note_app/shared/info_alert.dart';
import 'package:note_app/views/home/widgets/empty_note_placeholder.dart';
import 'package:note_app/views/note-details/note_details.dart';

import '../../shared/navigate_ to_create_page.dart';
//import '../add-note/add_note.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final noteDetail = NoteDetails();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Note',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        actions: [
          AppBarCard(
            icon: 'searchy',
            isFirst: true,
            onTap: () {},
          ),
          AppBarCard(
            icon: 'info',
            isFirst: false,
            onTap: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => const InfoAlert(
                      infoText:
                          "This note application is designed to help its users capture and organize their thoughts, ideas and information.",
                    )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNotePage(context);
        },
        child: const Icon(Icons.add),
      ),
      body: noteDetail.noteList.isEmpty
          ? const EmptyNotePlaceholder()
          : NoteDetails(),
    );
  }
}
