import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectDevicePage extends StatefulWidget {
  const SelectDevicePage({super.key});
  @override
  State<SelectDevicePage> createState() => _SelectDevicePageState();
}

class _SelectDevicePageState extends State<SelectDevicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SvgPicture.asset('assets/images/back_icon.svg'),
        ),
        title: Text(
          'Pilih Perangkat',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: ListView(
        children: [Text('data')],
      ),
    );
  }
}
