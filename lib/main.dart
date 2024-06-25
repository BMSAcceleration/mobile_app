import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:mobile_app/pages/main.dart';
import 'package:mobile_app/pages/splash.dart';
import 'package:mobile_app/pages/bluetooth_state_observer.dart';

void main() {
  FlutterBluePlus.setLogLevel(LogLevel.verbose, color: true);
  runApp(const GamaBMS());
}

class GamaBMS extends StatelessWidget {
  const GamaBMS({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
