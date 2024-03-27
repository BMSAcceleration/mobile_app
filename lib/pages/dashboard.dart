import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app/widgets/connection_status.dart';
import 'package:mobile_app/widgets/mini_map.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
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
              Text(
                'Last charge was 13 hours ago',
                style: GoogleFonts.plusJakartaSans(
                  color: const Color.fromRGBO(118, 133, 157, 1),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 19,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '71',
                    style: GoogleFonts.plusJakartaSans(
                      color: const Color.fromRGBO(66, 122, 20, 1),
                      fontSize: 64,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '%',
                    style: GoogleFonts.plusJakartaSans(
                      color: const Color.fromRGBO(66, 122, 20, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your battery health is:',
                style: GoogleFonts.plusJakartaSans(
                  color: const Color.fromRGBO(119, 119, 119, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'good',
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Temperature:',
                style: GoogleFonts.plusJakartaSans(
                  color: const Color.fromRGBO(119, 119, 119, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    '32\u2103',
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 4,
                      ),
                      backgroundColor: const Color.fromRGBO(238, 247, 255, 1),
                      side: const BorderSide(
                        color: Color.fromRGBO(89, 131, 208, 1),
                      ),
                    ),
                    child: Text(
                      'details',
                      style: GoogleFonts.plusJakartaSans(
                        color: const Color.fromRGBO(82, 125, 205, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Voltage:',
                style: GoogleFonts.plusJakartaSans(
                  color: const Color.fromRGBO(119, 119, 119, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    '72 V',
                    style: GoogleFonts.plusJakartaSans(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 4,
                      ),
                      backgroundColor: const Color.fromRGBO(238, 247, 255, 1),
                      side: const BorderSide(
                        color: Color.fromRGBO(89, 131, 208, 1),
                      ),
                    ),
                    child: Text(
                      'details',
                      style: GoogleFonts.plusJakartaSans(
                        color: const Color.fromRGBO(82, 125, 205, 1),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Current:',
                style: GoogleFonts.plusJakartaSans(
                  color: const Color.fromRGBO(119, 119, 119, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                '5 A',
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Location:',
                style: GoogleFonts.plusJakartaSans(
                  color: const Color.fromRGBO(119, 119, 119, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const MiniMap()
            ],
          ),
        )
      ],
    );
  }
}
