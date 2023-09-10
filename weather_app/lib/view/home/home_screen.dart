import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/utils/theme_provider.dart';
import 'package:weather_app/view/shared/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 0.0,
              left: 16.0,
              right: 16.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const LocationAppBar(),
                Text(
                  "in sync",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  "Friday, 25 December 2020",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '22',
                        style: themeData.themeMode
                            ? Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(color: Colors.black)
                            : Theme.of(context).textTheme.displayLarge,
                      ),
                      TextSpan(
                        text: '°C',
                        style: themeData.themeMode
                            ? Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(color: Colors.black)
                            : Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        // SvgPicture.asset("assets/svgs/down_arrow.svg"),
                        const Icon(
                          Icons.south,
                          size: 20,
                        ),
                        Text(
                          "16°C",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 25.0,
                    ),
                    Row(
                      children: [
                        // SvgPicture.asset("assets/svgs/up_arrow.svg"),
                        const Icon(
                          Icons.north,
                          size: 20,
                        ),
                        Text(
                          "26°C",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    SvgPicture.asset(
                      "assets/images/drizzle_white.svg",
                      colorFilter: themeData.themeMode
                          ? const ColorFilter.mode(
                              Colors.black, BlendMode.srcIn)
                          : const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn),
                    ),
                    // SvgPicture.asset(
                    //   "assets/images/drizzle_white.svg",
                    // ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Light Drizzle",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/svgs/sunrise.svg",
                          colorFilter: themeData.themeMode
                              ? const ColorFilter.mode(
                                  Colors.black, BlendMode.srcIn)
                              : const ColorFilter.mode(
                                  Colors.white, BlendMode.srcIn),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "09:18 AM",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 25.0,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/svgs/sunrise.svg",
                          colorFilter: themeData.themeMode
                              ? const ColorFilter.mode(
                                  Colors.black, BlendMode.srcIn)
                              : const ColorFilter.mode(
                                  Colors.white, BlendMode.srcIn),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "06:32 PM",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
