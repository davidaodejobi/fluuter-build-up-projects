// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  const Alert({
    Key? key,
    required this.deleteCityByID,
    required this.cityID,
  }) : super(key: key);

  final Function(int) deleteCityByID;
  final int cityID;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Are you sure?"),
      actions: [
        TextButton(
          onPressed: () {
            deleteCityByID(cityID);
          },
          child: const Text(
            "Yes",
            style: TextStyle(color: Colors.red),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            "No",
            style: TextStyle(color: Colors.green),
          ),
        ),
      ],
    );
  }
}
