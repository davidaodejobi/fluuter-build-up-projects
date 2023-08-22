// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:note_app/constants/alert.dart';
import 'package:note_app/constants/app_colors.dart';
import 'package:note_app/constants/note_list.dart';
import 'package:note_app/models/note.dart';
import 'package:note_app/views/add-note/widgets/note_alert.dart';
import 'package:note_app/views/edit-note/edit_note.dart';
import 'package:note_app/views/home/widgets/empty_note_placeholder.dart';
import 'package:note_app/views/note-details/widgets/delete_slide.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteLists extends StatefulWidget {
  final List<Note> notes;
  const NoteLists({
    Key? key,
    required this.notes,
  }) : super(key: key);

  @override
  NoteListsState createState() => NoteListsState();
}

class NoteListsState extends State<NoteLists> {
  Note dNote = Note(
    noteID: 0,
    title: "title",
    noteDetail: "noteDetail",
    color: "color",
  );
  int deletedIndex = 0;
  bool isUndo = false;

  @override
  Widget build(BuildContext context) {
    return noteList.isEmpty && noteList.isEmpty
        ? const EmptyNotePlaceholder()
        : ListView.builder(
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
                    setState(() {
                      dNote = note;
                      deletedIndex = index;
                      isUndo = false;
                      widget.notes.removeAt(index);
                    });
                    Future.delayed(const Duration(seconds: 5), () {});
                  },
                  confirmDismiss: (DismissDirection direction) async {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return NoteAlert(
                          alert: Alert(
                            titleText:
                                "Are you sure you want to delete your note ?",
                            titleTextStyle:
                                Theme.of(context).textTheme.headlineMedium,
                            firstButtonText: "Delete",
                            secondButtonText: "Keep",
                            iconColor: AppColors.alertIconColor,
                            isTrue: true,
                            isFalse: false,
                            firstTextStyle:
                                Theme.of(context).textTheme.titleLarge,
                            secondTextStyle:
                                Theme.of(context).textTheme.titleLarge,
                            firstButtonColor: AppColors.errorColor,
                            secondButtonColor: AppColors.successColor,
                            firstbuttonAction: () {
                              final currentContext = context;

                              ScaffoldMessenger.of(currentContext)
                                  .showSnackBar(
                                    SnackBar(
                                      duration: const Duration(seconds: 5),
                                      content: const Text('Note Deleted'),
                                      action: SnackBarAction(
                                        label: 'Undo',
                                        textColor: Colors.red,
                                        onPressed: () {
                                          setState(() {
                                            isUndo = true;
                                            widget.notes
                                                .insert(deletedIndex, dNote);
                                          });
                                        },
                                      ),
                                    ),
                                  )
                                  .closed
                                  .then((value) {
                                if (!isUndo) {
                                  SharedPreferences.getInstance().then((prefs) {
                                    prefs.remove('note_${note.noteID}');
                                  });
                                }
                              });

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
