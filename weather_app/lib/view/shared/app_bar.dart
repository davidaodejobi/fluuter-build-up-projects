import 'package:flutter/material.dart';
import 'package:weather_app/view/location/locations.dart';
import 'package:weather_app/view/settings/settings.dart';

//TODO:1 Try to make this a reusable app bar widget that you can use across the app.
/// stuffs like this sometime takes time to get and it depends on the context, design and approach
/// You can check out PrefferredSizeWidget (https://stackoverflow.com/questions/53294006/how-to-create-a-custom-appbar-widget)
/// And try to play around with that
///
/// If you're not able to make this work, just continue with the current
/// approach you have but make it reusable across board
///
/// Try to make both the text and back button clickable
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
            // Text('Mumbai',
            //     style: themeData.isLightMode
            //         ? Theme.of(context)
            //             .textTheme
            //             .titleLarge
            //             ?.copyWith(color: Colors.black)
            //         : Theme.of(context).textTheme.titleLarge),
            Text('Mumbai', style: Theme.of(context).textTheme.titleLarge),
            Text(
              'Current Location',
              style: Theme.of(context).textTheme.labelSmall,
            )
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(LocationsScreen.id);
              },
              // child: SvgPicture.asset("assets/svgs/location.svg"),
              child: const Icon(Icons.map_outlined),
            ),
            const SizedBox(
              width: 15.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(SettingsScreen.id);
              },
              // child: SvgPicture.asset("assets/svgs/settings.svg"),
              child: const Icon(Icons.settings),
            ),
          ],
        ),
      ],
    );
  }
}
