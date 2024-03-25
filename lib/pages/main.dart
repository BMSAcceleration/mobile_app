import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/pages/history.dart';
import 'package:mobile_app/pages/home.dart';
import 'package:mobile_app/pages/setting.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _pages = [
    const ConnectPage(),
    const HistoryPage(),
    const SettingPage(),
  ];

  var _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final cActiveButton = const Color.fromRGBO(47, 63, 137, 1);
    final cUnactiveButton = const Color.fromRGBO(209, 223, 248, 1);
    return Scaffold(
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
