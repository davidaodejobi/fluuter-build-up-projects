// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class InfoAlert extends StatelessWidget {
  final String infoText;

  const InfoAlert({
    Key? key,
    required this.infoText,
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
      content: Text(
        infoText,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
