// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:note_app/constants/app_colors.dart';
import 'package:note_app/constants/note_list.dart';
import 'package:note_app/models/note.dart';
import 'package:note_app/views/edit-note/edit_note.dart';
import 'package:note_app/views/note-details/widgets/delete_slide.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/alert.dart';
import '../add-note/widgets/note_alert.dart';

class NoteLists extends StatefulWidget {
  final List<Note> notes = noteList;

  NoteLists({
    Key? key,
  }) : super(key: key);

  @override
  NoteListsState createState() => NoteListsState();
}

class NoteListsState extends State<NoteLists> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12.0),
      itemCount: widget.notes.length,
      itemBuilder: (context, index) {
        final note = widget.notes[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Dismissible(
            key: Key(note.noteID.toString()),
            background: deleteSlide(),
            secondaryBackground: deleteSlide(),
            onDismissed: (direction) {
              final currentContext = context;

              SharedPreferences.getInstance().then(
                (prefs) {
                  setState(() {
                    widget.notes.removeAt(index);
                  });

                  ScaffoldMessenger.of(currentContext).showSnackBar(
                    const SnackBar(content: Text('Note Deleted')),
                  );

                  prefs.remove('note_${note.noteID}');
                },
              );
            },
            confirmDismiss: (DismissDirection direction) async {
              return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return NoteAlert(
                    alert: Alert(
                      titleText:
                          "Are you sure you want to discard your changes ?",
                      titleTextStyle:
                          Theme.of(context).textTheme.headlineMedium,
                      firstButtonText: "Discard",
                      secondButtonText: "Keep",
                      iconColor: AppColors.alertIconColor,
                      isTrue: true,
                      isFalse: false,
                      firstTextStyle: Theme.of(context).textTheme.titleLarge,
                      secondTextStyle: Theme.of(context).textTheme.titleLarge,
                      firstButtonColor: AppColors.errorColor,
                      secondButtonColor: AppColors.successColor,
                      firstbuttonAction: () {
                        final currentContext = context;

                        SharedPreferences.getInstance().then(
                          (prefs) {
                            setState(() {
                              widget.notes.removeAt(index);
                            });

                            ScaffoldMessenger.of(currentContext).showSnackBar(
                              const SnackBar(content: Text('Note Deleted')),
                            );

                            prefs.remove('note_${note.noteID}');
                          },
                        );

                        Navigator.of(context).pop(true);
                      },
                      secondButtonAction: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                  );
                },
              );
            },
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
                  note.title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.merge(const TextStyle(color: Colors.black)),
                ),
                tileColor: Color(int.parse(note.color)),
              ),
            ),
          ),
        );
      },
    );
  }
}
