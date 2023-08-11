// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:note_app/constants/alert.dart';

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
      icon: Icon(
        Icons.info,
        color: alert.iconColor,
      ),
      title: Text(
        alert.titleText,
        style: alert.titleTextStyle,
      ),
      actions: <Widget>[
        SizedBox(
          width: 112.0,
          height: 39.0,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                alert.firstButtonColor,
              ),
            ),
            onPressed: () => {
              if (alert.secondButtonText == "Save")
                {
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => alertButton(
                          alert.firstButtonColor,
                          alert.secondButtonText,
                          alert.titleTextStyle,
                          context)),
                }
              else
                {
                  //second discard function
                }
            },
            child: Text(
              alert.firstButtonText,
              style: alert.firstTextStyle,
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
                alert.secondButtonColor,
              ),
            ),
            onPressed: () => {
              //Keep button function
            },
            child: Text(
              alert.secondButtonText,
              style: alert.secondTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}

NoteAlert alertButton(
    Color color, String text, TextStyle? style, BuildContext context) {
  return NoteAlert(
    alert: Alert(
      titleText: "Are you sure you want to discard your changes ?",
      titleTextStyle: Theme.of(context).textTheme.headlineMedium,
      firstButtonText: "Discard",
      secondButtonText: "Keep",
      iconColor: AppColors.alertIconColor,
      isTrue: true,
      isFalse: false,
      firstTextStyle: Theme.of(context).textTheme.titleLarge,
      secondTextStyle: Theme.of(context).textTheme.titleLarge,
      firstButtonColor: AppColors.errorColor,
      secondButtonColor: AppColors.successColor,
    ),
  );
}
