// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Temperature extends StatelessWidget {
  const Temperature({
    Key? key,
    required this.firstUrl,
    required this.firstTemperature,
    required this.secondUrl,
    required this.secondTemperature,
  }) : super(key: key);

  final String firstUrl;
  final String firstTemperature;
  final String secondUrl;
  final String secondTemperature;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            SvgPicture.asset(
              firstUrl,
              width: 11,
              height: 11,
            ),
            Text(
              firstTemperature,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            SvgPicture.asset(
              secondUrl,
              width: 11,
              height: 11,
            ),
            Text(
              secondTemperature,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ],
    );
  }
}
