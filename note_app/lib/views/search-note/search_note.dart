import 'package:flutter/material.dart';
import 'package:note_app/views/search-note/widgets/empty_search.dart';

import '../../constants/note_list.dart';
import '../../models/note.dart';
import '../../shared/appbar_card.dart';
import '../edit-note/edit_note.dart';
import '../home/widgets/info_alert.dart';

class SearchNote extends StatefulWidget {
  const SearchNote({
    super.key,
  });

  @override
  State<SearchNote> createState() => _SearchNoteState();
}

class _SearchNoteState extends State<SearchNote> {
  List<Note> filteredNotes = List.from(noteList);
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    filteredNotes = List.from(noteList);
  }

  searchNotes(String query) {
    print(filteredNotes);
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 27.0, vertical: 88.0),
              child: TextField(
                onChanged: (query) => searchNotes(query),
                controller: _searchController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 30.0),
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
            filteredNotes.isEmpty
                ? const EmptySearch()
                : Expanded(child: FilteredNotes(filteredNotes: filteredNotes))
          ],
        ),
      ),
    );
  }
}

class FilteredNotes extends StatelessWidget {
  const FilteredNotes({
    super.key,
    required this.filteredNotes,
  });

  final List<Note> filteredNotes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12.0),
      itemCount: filteredNotes.length,
      itemBuilder: (context, index) {
        final note = filteredNotes[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
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
                filteredNotes[index].title,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.merge(const TextStyle(color: Colors.black)),
              ),
              tileColor: Color(int.parse(filteredNotes[index].color)),
            ),
          ),
        );
      },
    );
  }
}
