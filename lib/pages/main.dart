import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/pages/dashboard.dart';
import 'package:mobile_app/pages/total_voltage.dart';
import 'package:mobile_app/pages/setting.dart';

class MainPage extends StatefulWidget {
  final BluetoothDevice device;

  const MainPage({Key? key, required this.device}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late List<Widget> _pages;
  @override
  void initState() {
    super.initState();
    _pages = [
      // const ConnectPage(),
      DashboardPage(
        device: widget.device,
      ),
      const TotalVoltage(),
      const SettingPage(),
    ];
  }

  var _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    const cActiveButton = Color.fromRGBO(47, 63, 137, 1);
    const cUnactiveButton = Color.fromRGBO(209, 223, 248, 1);
    return Scaffold(
      // body: _pages[_pageIndex],
      body: _pages[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _pageIndex,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: SvgPicture.asset(
              'assets/images/home_icon.svg',
              color: _pageIndex == 0 ? cActiveButton : cUnactiveButton,
            ),
          ),
          BottomNavigationBarItem(
            label: 'History',
            icon: SvgPicture.asset(
              'assets/images/chart_icon.svg',
              color: _pageIndex == 1 ? cActiveButton : cUnactiveButton,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Setting',
            icon: SvgPicture.asset(
              'assets/images/setting_icon.svg',
              color: _pageIndex == 2 ? cActiveButton : cUnactiveButton,
            ),
          )
        ],
      ),
    );
  }
}
