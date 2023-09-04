// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_bar.dart';
import 'package:weather_app/view/details/widgets/detail.dart';

class DetailsScreen extends StatelessWidget {
  static const String id = "details_screen";

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30.0,
              left: 25.0,
              right: 25.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LocationAppBar(),
                Text(
                  "Details",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Details(detail: "Precipitation", value: "0.0 mm"),
                const Details(detail: "SE Wind", value: "10.23 km/h"),
                const Details(detail: "Humidity", value: "56%"),
                const Details(detail: "Visibility", value: "14.83 km"),
                const Details(detail: "UV", value: "Lowest"),
                const Details(detail: "Pressure", value: "1012 hPa"),
                const SizedBox(
                  height: 60.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
