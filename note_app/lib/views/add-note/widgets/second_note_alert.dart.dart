// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class SecondNoteAlert extends StatelessWidget {
  final String titleText;
  final String firstButtonText;
  final String secondButtonText;
  final bool isTrue;
  final bool isFalse;

  const SecondNoteAlert({
    Key? key,
    required this.titleText,
    required this.firstButtonText,
    required this.secondButtonText,
    required this.isTrue,
    required this.isFalse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.only(bottom: 20.0),
      elevation: 50,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      icon: const Icon(
        Icons.info,
        color: AppColors.alertIconColor,
      ),
      title: Text(
        titleText,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      actions: <Widget>[
        SizedBox(
          width: 112.0,
          height: 39.0,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                AppColors.errorColor,
              ),
            ),
            onPressed: () => {
              print("Hello"),
            },
            child: Text(
              firstButtonText,
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
              secondButtonText,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ],
    );
  }
}
