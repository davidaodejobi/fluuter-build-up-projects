import 'package:flutter/material.dart';

class NoteDetail extends StatelessWidget {
  const NoteDetail({
    super.key,
    required this.noteID,
    required this.title,
    required this.noteDetail,
    required this.color,
  });

  final int noteID;
  final String title;
  final String noteDetail;
  final String color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Stack(
        children: [
          Container(
            width: 365.0,
            padding: const EdgeInsets.fromLTRB(24, 16, 16, 16),
            margin: const EdgeInsets.only(
              bottom: 16,
            ),
            decoration: BoxDecoration(
              color: Color(int.parse(color)),
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.merge(const TextStyle(color: Colors.black)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
