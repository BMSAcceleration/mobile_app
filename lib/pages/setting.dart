import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/connection_status.dart';

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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        )
      ],
    );
  }
}
