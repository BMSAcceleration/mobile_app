import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/widgets/connection_status.dart';

class TotalVoltage extends StatefulWidget {
  const TotalVoltage({super.key});
  @override
  State<TotalVoltage> createState() => _TotalVoltageState();
}

class _TotalVoltageState extends State<TotalVoltage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(24, 26, 24, 0),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(236, 241, 243, 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const ConnectionStatus(),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromRGBO(221, 221, 221, 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(24, 24, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
