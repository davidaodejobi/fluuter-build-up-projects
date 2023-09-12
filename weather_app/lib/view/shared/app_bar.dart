// ignore_for_file: public_member_api_docs, sort_constructors_first
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
class LocationAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LocationAppBar(
      {Key? key,
      required this.city,
      required this.location,
      required this.isArrowVisible})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;
  final String city;
  final String location;
  final bool isArrowVisible;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: isArrowVisible
          ? GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                size: 20.0,
              ),
            )
          : null,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(city, style: Theme.of(context).textTheme.titleLarge),
          Text(
            location,
            style: Theme.of(context).textTheme.labelSmall,
          )
        ],
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(LocationsScreen.id);
          },
          child: const Icon(Icons.map_outlined),
        ),
        const SizedBox(
          width: 15.0,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(SettingsScreen.id);
          },
          child: const Icon(Icons.settings),
        ),
        const SizedBox(
          width: 20.0,
        ),
      ],
    );
  }
}
