import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationAppBar extends StatelessWidget {
  const LocationAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mumbai',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.black,
                  ),
            ),
            Text(
              'Current Location',
              style: Theme.of(context).textTheme.labelSmall,
            )
          ],
        ),
        Row(
          children: [
            SvgPicture.asset("assets/svgs/location.svg"),
            const SizedBox(
              width: 15.0,
            ),
            SvgPicture.asset("assets/svgs/settings.svg"),
          ],
        ),
      ],
    );
  }
}
