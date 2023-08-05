// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:note_app/shared/appbar_card.dart';
import 'package:note_app/views/home/widgets/empty_note_placeholder.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
      body: false
          ? ListView(
              //TODO: code out the note UI
              children: const [
                ListTile(
                  title: Text('Note 1'),
                  subtitle: Text('This is a note'),
                  trailing: Icon(Icons.delete),
                ),
                ListTile(
                  title: Text('Note 2'),
                  subtitle: Text('This is a note'),
                  trailing: Icon(Icons.delete),
                ),
                ListTile(
                  title: Text('Note 3'),
                  subtitle: Text('This is a note'),
                  trailing: Icon(Icons.delete),
                ),
                ListTile(
                  title: Text('Note 4'),
                  subtitle: Text('This is a note'),
                  trailing: Icon(Icons.delete),
                ),
                ListTile(
                  title: Text('Note 5'),
                  subtitle: Text('This is a note'),
                  trailing: Icon(Icons.delete),
                ),
                ListTile(
                  title: Text('Note 6'),
                  subtitle: Text('This is a note'),
                  trailing: Icon(Icons.delete),
                ),
                ListTile(
                  title: Text('Note 7'),
                  subtitle: Text('This is a note'),
                  trailing: Icon(Icons.delete),
                ),
              ],
            )
          : const EmptyNotePlaceholder(),
    );
  }
}
