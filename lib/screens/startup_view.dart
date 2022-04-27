import 'package:converter_cluster/converters/celsius_to_fahrenheit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StartupView extends StatefulWidget {
  const StartupView({Key? key}) : super(key: key);
  static const String id = 'StartupView';

  @override
  State<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('lib/assets/lottie/loading.json',
            controller: _controller, onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..forward().whenComplete(() => Navigator.pushNamedAndRemoveUntil(
                context, CelsiusToFahrenheit.id, (route) => false));
        }),
      ),
    );
  }
}
