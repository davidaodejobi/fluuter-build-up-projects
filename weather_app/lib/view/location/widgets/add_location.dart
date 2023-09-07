import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/models/location_data.dart';

late String newCity;

class AddLocation extends StatelessWidget {
  const AddLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationData>(
      builder: (context, locationData, child) {
        return Container(
          color: const Color(0xFF757575),
          child: Container(
            padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "New City",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Colors.black),
                ),
                TextFormField(
                  onChanged: (value) {
                    newCity = value;
                  },
                  autofocus: true,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    locationData.addNewLocation(newCity, -10, "Light Drizzle");

                    Navigator.pop(context);
                  },
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(AppColors.kBackgroundColor),
                  ),
                  child: Text(
                    "Add",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                    // style: TextStyle(color: kSecondaryColor),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
