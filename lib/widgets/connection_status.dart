import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConnectionStatus extends StatelessWidget {
  const ConnectionStatus({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Connected to:',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'GESITS X218 20aH',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            backgroundColor: const Color.fromRGBO(238, 247, 255, 1),
            side: const BorderSide(
              color: Color.fromRGBO(89, 131, 208, 1),
            ),
          ),
          child: Text(
            'Disconnect',
            style: GoogleFonts.plusJakartaSans(
              color: const Color.fromRGBO(82, 125, 205, 1),
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        )
      ],
    );
  }
}
