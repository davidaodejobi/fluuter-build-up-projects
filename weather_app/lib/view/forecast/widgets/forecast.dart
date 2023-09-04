// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget({
    Key? key,
    required this.time,
    required this.svgUrl,
  }) : super(key: key);

  final String time;
  final String svgUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      time,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SvgPicture.asset(svgUrl)
                  ],
                ),
                const SizedBox(
                  width: 30.0,
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
