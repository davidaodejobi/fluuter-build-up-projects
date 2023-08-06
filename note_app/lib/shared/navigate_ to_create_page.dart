import 'package:flutter/material.dart';
import '../views/add-note/add_note.dart';

void createNotePage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNote()));
  }