import 'package:converter_cluster/converters/fahrenheit_to_celsius.dart';
import 'package:converter_cluster/converters/kg_to_lbs.dart';
import 'package:converter_cluster/converters/km_to_miles.dart';
import 'package:converter_cluster/converters/lbs_to_kg.dart';
import 'package:converter_cluster/converters/miles_to_km.dart';
import 'package:converter_cluster/screens/startup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'converters/celsius_to_fahrenheit.dart';

void main() => runApp(const ConverterCluster());

class ConverterCluster extends StatelessWidget {
  const ConverterCluster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      initialRoute: StartupView.id,
      routes: {
        CelsiusToFahrenheit.id: (context) => const CelsiusToFahrenheit(),
        FahrenheitToCelsius.id: (context) => const FahrenheitToCelsius(),
        KgToLbs.id: (context) => const KgToLbs(),
        LbsToKg.id: (context) => const LbsToKg(),
        KmToMiles.id: (context) => const KmToMiles(),
        MilesToKm.id: (context) => const MilesToKm(),
        StartupView.id: (context) => const StartupView()
      },
    );
  }
}
