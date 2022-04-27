import 'package:converter_cluster/converters/fahrenheit_to_celsius.dart';
import 'package:converter_cluster/converters/kg_to_lbs.dart';
import 'package:converter_cluster/converters/km_to_miles.dart';
import 'package:converter_cluster/converters/lbs_to_kg.dart';
import 'package:converter_cluster/converters/miles_to_km.dart';
import 'package:flutter/material.dart';

import '../converters/celsius_to_fahrenheit.dart';

class ConverterDrawer extends StatelessWidget {
  const ConverterDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Center(
              child: Text(
                'LIST OF CONVERTERS',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, CelsiusToFahrenheit.id, (route) => false);
            },
            title: const Text(
              'CELSIUS -> FAHRENHEIT',
            ),
          ),
          ListTile(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, FahrenheitToCelsius.id, (route) => false);
              },
              title: const Text('FAHRENHEIT -> CELSIUS')),
          ListTile(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, KgToLbs.id, (route) => false);
              },
              title: const Text('KG -> LBS')),
          ListTile(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, LbsToKg.id, (route) => false);
            },
            title: const Text('LBS -> KG'),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, KmToMiles.id, (route) => false);
            },
            title: const Text('KM -> MILES'),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, MilesToKm.id, (route) => false);
            },
            title: const Text('MILES -> KM'),
          ),
        ],
      ),
    );
  }
}
