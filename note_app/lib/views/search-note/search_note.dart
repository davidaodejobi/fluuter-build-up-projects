import 'package:flutter/material.dart';
import 'package:note_app/constants/note_list.dart';
import 'package:note_app/models/note.dart';
import 'package:note_app/shared/appbar_card.dart';
import 'package:note_app/views/home/widgets/info_alert.dart';
import 'package:note_app/views/search-note/widgets/empty_search.dart';
import 'package:note_app/views/search-note/widgets/filtered_note.dart';

class SearchNote extends StatefulWidget {
  const SearchNote({
    super.key,
  });

  @override
  State<SearchNote> createState() => _SearchNoteState();
}

class _SearchNoteState extends State<SearchNote> {
  List<Note> filteredNotes = [];
  // List<Note> filteredNotesCopy = [];
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    filteredNotes = List.from(noteList);
    // filteredNotesCopy = List.from(noteList);
    //? For simplicity I woulh have used the following line of code
    //? filteredNotes = noteList;
  }

  searchNotes(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredNotes = List.from(noteList);
        // filteredNotes = [];
      } else {
        filteredNotes = noteList.where((note) {
          return note.title.toLowerCase().contains(query.toLowerCase()) ||
              note.noteDetail.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });

    /*   setState(() {
      filteredNotes = filteredNotesCopy.where((note) {
        return note.title.toLowerCase().contains(query.toLowerCase()) ||
            note.noteDetail.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarCard(
          icon: 'back-arrow',
          isFirst: true,
          onTap: () => {Navigator.pop(context)},
        ),
        actions: [
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
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 16.0,
              ),
              child: TextField(
                onChanged: (query) => searchNotes(query),
                controller: _searchController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 20.0),
                  filled: true,
                  border: const UnderlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Search by the keyword...',
                  hintStyle: Theme.of(context).textTheme.headlineSmall?.merge(
                        const TextStyle(
                          color: Color.fromRGBO(204, 204, 204, 1),
                        ),
                      ),
                ),
                style: Theme.of(context).textTheme.headlineSmall?.merge(
                      const TextStyle(
                        color: Color.fromRGBO(204, 204, 204, 1),
                      ),
                    ),
              ),
            ),
            Expanded(
              child: filteredNotes.isEmpty
                  ? const Center(
                      child: EmptySearch(),
                    )
                  : FilteredNotes(
                      filteredNotes: filteredNotes,
                    ),
            )
          ],
        ),
      ),
    );
  }
}
