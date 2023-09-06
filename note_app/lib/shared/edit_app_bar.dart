import 'package:flutter/material.dart';

import 'appbar_card.dart';

AppBar editAppBar(
  BuildContext context, {
  required VoidCallback onSaveTap,
}) {
  return AppBar(
    leading: AppBarCard(
      icon: 'back-arrow',
      isFirst: true,
      onTap: () => {Navigator.pop(context)},
    ),
    actions: [
      AppBarCard(
        icon: 'save',
        isFirst: false,
        onTap: onSaveTap,
      ),
    ],
  );
}
