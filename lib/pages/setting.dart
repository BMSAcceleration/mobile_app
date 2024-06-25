import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/widgets/connection_status.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 50, 24, 0),
      children: [
        Column(
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
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            shape: const BeveledRectangleBorder(),
          ),
          child: const Text('Profile 1'),
        ),
        Container(
          height: 155,
          width: 312,
          alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(12, 21, 12, 21),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(247, 247, 248, 1),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Max discharge current (A)',
                style: GoogleFonts.plusJakartaSans(
                  color: const Color.fromRGBO(87, 87, 87, 1),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 0.6,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '30',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SfLinearGauge(
                    axisTrackStyle: const LinearAxisTrackStyle(
                      edgeStyle: LinearEdgeStyle.bothCurve,
                      color: Color.fromRGBO(216, 225, 236, 1),
                      thickness: 13,
                    ),
                    showTicks: false,
                    showLabels: false,
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
