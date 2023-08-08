// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:note_app/shared/appbar_card.dart';
import 'package:note_app/views/add-note/widgets/note_alert.dart';

class CreateNote extends StatelessWidget {
  const CreateNote({
    Key? key,
  }) : super(key: key);

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
            icon: 'visibility',
            isFirst: true,
            onTap: () {},
          ),
          AppBarCard(
            icon: 'save',
            isFirst: false,
            onTap: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => const NoteAlert(
                titleText: "Save changes ?",
                firstButtonText: "Discard",
                secondButtonText: "Save",
                isTrue: true,
                isFalse: false,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
              ),
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Type something...',
              ),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
