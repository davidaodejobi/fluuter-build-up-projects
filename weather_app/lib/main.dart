import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/models/location_data.dart';
import 'package:weather_app/utils/app_theme.dart';
import 'package:weather_app/utils/theme_provider.dart';
import 'package:weather_app/view/details/details_screen.dart';
import 'package:weather_app/view/forecast/forecast_screen.dart';
import 'package:weather_app/view/home/home.dart';
import 'package:weather_app/view/home/home_screen.dart';
import 'package:weather_app/view/location/locations.dart';
import 'package:weather_app/view/settings/settings.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => LocationData(),
    ),
  ], child: const MainApp()));
  FlutterNativeSplash.remove();
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    loadThemeMode();
  }

  Future<void> loadThemeMode() async {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final prefs = await SharedPreferences.getInstance();
    final isLightMode = prefs.getBool('_isLightMode') ?? true;
    themeProvider.setThemeMode(isLightMode);
    print(isLightMode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightMode(),
      darkTheme: AppTheme.darkMode(),
      themeMode: Provider.of<ThemeProvider>(context).themeMode
          ? ThemeMode.light
          : ThemeMode.dark,

      // themeMode: Provider.of<ThemeProvider>(context).isLightMode
      //     ? ThemeMode.light
      //     : ThemeMode.dark,
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
