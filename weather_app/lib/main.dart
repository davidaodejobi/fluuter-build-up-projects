import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:weather_app/utils/app_theme.dart';
import 'package:weather_app/view/details/details_screen.dart';
import 'package:weather_app/view/forecast/forecast_screen.dart';
import 'package:weather_app/view/home/home.dart';
import 'package:weather_app/view/home/home_screen.dart';
import 'package:weather_app/view/location/locations.dart';
import 'package:weather_app/view/settings/settings.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MainApp());
  FlutterNativeSplash.remove();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return ChangeNotifierProvider(
  //     create: (context) => HomeViewModel(),
  //     child: const MaterialApp(
  //       home: Home(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightMode(),
      // home: const HomeScreen(),
      // home: const SettingsScreen(),
      initialRoute: Home.id,
      routes: {
        Home.id: (context) => const HomeScreen(),
        DetailsScreen.id: (context) => const DetailsScreen(),
        ForecastScreen.id: (context) => const ForecastScreen(),
        LocationsScreen.id: (context) => const LocationsScreen(),
        SettingsScreen.id: (context) => const SettingsScreen(),
      },
    );
  }
}
