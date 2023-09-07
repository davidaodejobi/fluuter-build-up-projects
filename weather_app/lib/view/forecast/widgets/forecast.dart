// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/theme_provider.dart';

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
    final themeData = Provider.of<ThemeProvider>(context);

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
                      style: themeData.themeMode
                          ? Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.black)
                          : Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SvgPicture.asset(
                      svgUrl,
                      colorFilter: themeData.themeMode
                          ? const ColorFilter.mode(
                              Colors.black, BlendMode.srcIn)
                          : const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn),
                    )
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
