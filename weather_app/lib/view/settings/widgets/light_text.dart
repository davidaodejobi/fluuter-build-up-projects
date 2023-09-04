import 'package:flutter/material.dart';

class LightText extends StatelessWidget {
  const LightText({
    Key? key,
    required this.lightText,
    required this.lightSubText,
  }) : super(key: key);

  final String lightText;
  final String lightSubText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lightText,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 5.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              lightSubText,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
