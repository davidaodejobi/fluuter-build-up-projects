import 'package:flutter/material.dart';
import 'package:note_app/models/note.dart';

import '../../../constants/note_list.dart';

List<Note> notes = List.from(noteList);

class EmptySearch extends StatelessWidget {
  const EmptySearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/empty-search.png',
            ),
            const SizedBox(height: 16),
            GestureDetector(
                onTap: () => {},
                child: notes.isEmpty
                    ? Text(
                        'Search through your notes to quickly.',
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    : Text(
                        'Result not found. Try searching again.',
                        style: Theme.of(context).textTheme.headlineSmall,
                      )),
          ],
        ),
      ),
    );
  }
}
