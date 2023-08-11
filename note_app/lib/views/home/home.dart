// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:note_app/shared/appbar_card.dart';
import 'package:note_app/views/home/widgets/empty_note_placeholder.dart';
import 'package:note_app/views/home/widgets/info_alert.dart';
import 'package:note_app/views/note-details/note_lists.dart';
import 'package:note_app/views/search-note/search_note.dart';

import '../../shared/navigate_ to_create_page.dart';
import '../../utils/note_list.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
          createNotePage(context);
        },
        child: const Icon(Icons.add),
      ),
      body: noteList.isEmpty ? const EmptyNotePlaceholder() : const NoteLists(),
    );
  }
}
