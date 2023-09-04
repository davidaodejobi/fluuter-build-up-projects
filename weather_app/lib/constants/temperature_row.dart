import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TemperatureRow extends StatelessWidget {
  const TemperatureRow({
    super.key,
    required this.url,
    required this.temperature,
  });

  final String url;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          url,
          width: 11,
          height: 11,
        ),
        Text(
          temperature,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
