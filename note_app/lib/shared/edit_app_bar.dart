import 'package:flutter/material.dart';
import 'package:note_app/constants/alert.dart';
import 'package:note_app/constants/app_colors.dart';
import 'package:note_app/views/add-note/widgets/note_alert.dart';

import 'appbar_card.dart';

AppBar editAppBar(BuildContext context) {
  return AppBar(
    leading: AppBarCard(
      icon: 'back-arrow',
      isFirst: true,
      onTap: () => {Navigator.pop(context)},
    ),
    actions: [
      AppBarCard(
        icon: 'visibility',
        isFirst: true,
        onTap: () {},
      ),
      AppBarCard(
        icon: 'save',
        isFirst: false,
        onTap: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => NoteAlert(
            alert: Alert(
              titleText: "Save changes ?",
              titleTextStyle: Theme.of(context).textTheme.headlineMedium,
              firstButtonText: "Discard",
              secondButtonText: "Save",
              iconColor: AppColors.alertIconColor,
              isTrue: true,
              isFalse: false,
              firstTextStyle: Theme.of(context).textTheme.titleLarge,
              secondTextStyle: Theme.of(context).textTheme.titleLarge,
              firstButtonColor: AppColors.errorColor,
              secondButtonColor: AppColors.successColor,
            ),
          ),
        ),
      ),
    ],
  );
}
