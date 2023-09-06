import 'package:flutter/material.dart';
import 'package:note_app/models/note.dart';
import 'package:note_app/views/edit-note/edit_note.dart';

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
                style: Theme.of(context).textTheme.headlineMedium?.merge(
                      const TextStyle(
                        color: Colors.black,
                      ),
                    ),
              ),
              tileColor: Color(
                int.parse(
                  filteredNotes[index].color,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
