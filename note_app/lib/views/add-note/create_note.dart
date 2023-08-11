// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../shared/edit_app_bar.dart';

class CreateNote extends StatelessWidget {
  const CreateNote({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('Create note');
    return Scaffold(
      appBar: editAppBar(
        context,
        onSaveTap: () {
          log('Helllooooo');
        },
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
