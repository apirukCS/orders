import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:orders/pages/charts/charts_screen.dart';
import 'package:orders/pages/list_product/list_product_screen.dart';
import 'package:orders/pages/profile/profile_screen.dart';
import 'package:orders/translations/locale_keys.g.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _currentIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ListProductScreen(),
    ChartsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Theme.of(context).primaryColor,
            iconSize: 20.0,
            selectedIconTheme: const IconThemeData(size: 24.0),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white54,
            selectedFontSize: 14.0,
            unselectedFontSize: 12,
            currentIndex: _currentIndex,
            onTap: _onItemTapped,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: LocaleKeys.home.tr(),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.bar_chart),
                label: LocaleKeys.chart.tr(),
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: "${LocaleKeys.profile.tr()} ",
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
