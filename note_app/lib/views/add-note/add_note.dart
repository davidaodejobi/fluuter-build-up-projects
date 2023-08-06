// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:note_app/shared/appbar_card.dart';

class AddNote extends StatelessWidget {
  const AddNote({Key? key}) : super(key: key);

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
            onTap: () {},
          ),
          AppBarCard(
            icon: 'info',
            isFirst: false,
            onTap: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Container());
  }
}
