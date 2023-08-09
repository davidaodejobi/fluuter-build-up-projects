// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:note_app/views/add-note/widgets/second_note_alert.dart.dart';

import '../../../constants/alert.dart';
import '../../../constants/app_colors.dart';

class NoteAlert extends StatelessWidget {
  final Alert alert;

  const NoteAlert({
    Key? key,
    required this.alert,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.only(
        bottom: 20.0,
      ),
      elevation: 50,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      icon: const Icon(
        Icons.info,
        color: AppColors.alertIconColor,
      ),
      title: Text(
        alert.titleText,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      actions: <Widget>[
        SizedBox(
          width: 112.0,
          height: 39.0,
          child: ElevatedButton(
            onPressed: () => {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => SecondNoteAlert(
                  alert: Alert(
                      titleText:
                          "Are your sure you want discard your changes ?",
                      firstButtonText: "Discard",
                      secondButtonText: "Keep",
                      isTrue: true,
                      isFalse: false),
                ),
              ),
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                AppColors.errorColor,
              ),
            ),
            child: Text(
              alert.firstButtonText,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        SizedBox(
          width: 112.0,
          height: 39.0,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                AppColors.successColor,
              ),
            ),
            onPressed: () => {},
            child: Text(
              alert.secondButtonText,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ],
    );
  }
}
