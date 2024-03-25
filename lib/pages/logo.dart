import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});
  @override
  State<StatefulWidget> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(
              'Gama',
              style: GoogleFonts.plusJakartaSans(),
            ),
          )
        ],
      ),
    );
  }
}
