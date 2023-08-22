// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:note_app/constants/note_list.dart';
import 'package:note_app/models/note.dart';
import 'package:note_app/shared/appbar_card.dart';
import 'package:note_app/views/add-note/create_note.dart';
import 'package:note_app/views/home/widgets/empty_note_placeholder.dart';
import 'package:note_app/views/home/widgets/info_alert.dart';
import 'package:note_app/views/note-details/note_lists.dart';
import 'package:note_app/views/search-note/search_note.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Note> notes = noteList;
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchNote(),
                ),
              );
            },
          ),
          AppBarCard(
            icon: 'info',
            isFirst: false,
            onTap: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => const InfoAlert(
                infoText:
                    "This note application is designed to help its users capture and organize their thoughts, ideas and information.",
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateNote(),
            ),
          ).then((value) {
            setState(() {
              notes = noteList;
            });
          });
        },
        child: const Icon(Icons.add),
      ),
      body: noteList.isEmpty ? const EmptyNotePlaceholder() : const NoteLists(),
    );
  }
}
