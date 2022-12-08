import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:orders/pages/charts/charts_screen.dart';
import 'package:orders/pages/list_product/list_product_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        children: const <Widget>[
          ListProductScreen(),
          ChartsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        containerHeight: 55.0,
        backgroundColor: Colors.red.shade900,
        selectedIndex: _currentIndex,
        itemCornerRadius: 24,
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeIn);
        }),
        items: [
          BottomNavyBarItem(
            inactiveColor: Colors.black54,
            icon: const Icon(
              Icons.apps,
              color: Colors.white,
            ),
            title: Text(
                Localizations.localeOf(context).languageCode == "th"
                    ? "รายการสินค้า"
                    : "ListProduct",
              style: const TextStyle(color: Colors.white),
            ),
            activeColor: Colors.white,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            inactiveColor: Colors.black54,
            icon: const Icon(
              Icons.bar_chart,
              color: Colors.white,
            ),
            title: Text(
                Localizations.localeOf(context).languageCode == "th"
                    ? "กราฟข้อมูล"
                    : "Charts",
              style: const TextStyle(color: Colors.white),
            ),
            activeColor: Colors.white,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
