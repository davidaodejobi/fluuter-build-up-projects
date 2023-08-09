import 'package:flutter/material.dart';
import 'package:note_app/constants/alert.dart';

import '../views/add-note/widgets/note_alert.dart';
import 'appbar_card.dart';

AppBar saveAppBar(BuildContext context) {
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
                firstButtonText: "Discard",
                secondButtonText: "Save",
                isTrue: true,
                isFalse: false),
            // titleText: "Save changes ?",
            // firstButtonText: "Discard",
            // secondButtonText: "Save",
            // isTrue: true,
            // isFalse: false,
          ),
        ),
      ),
    ],
  );
}
