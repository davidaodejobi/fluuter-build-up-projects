import 'package:flutter/material.dart';
import 'package:note_app/constants/notes.dart';
import 'package:note_app/shared/appbar_card.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.note});

  final Note note;

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
            icon: 'edit',
            isFirst: true,
            onTap: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            left: 27.0,
            top: 42.0,
            right: 27.0,
          ),
          child: Column(
            children: [
              Text(
                note.title,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(
                height: 37.0,
              ),
              Text(
                note.noteDetail,
                style: Theme.of(context).textTheme.headlineMedium?.merge(
                      const TextStyle(fontStyle: FontStyle.italic),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
