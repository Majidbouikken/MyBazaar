import 'package:flutter/material.dart';
import 'package:my_bazaar/ui/components/AnimatedNavBar.dart';
import 'package:my_bazaar/ui/components/AnimatedNavBarPage.dart';
import 'package:my_bazaar/ui/pages/HomePage.dart';
import 'package:my_bazaar/ui/pages/LoginPage.dart';
import 'package:my_bazaar/ui/pages/ProductPage.dart';
import 'ui/components/Deals.dart';
import 'ui/components/SearchBar.dart';
import 'ui/mybazaar_icons.dart';
import 'ui/theme.dart';

void main() {
  runApp(MyBazaarApp());
}

class MyBazaarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeChanger.lightTheme,
      home: MainScreen(),
      routes: {
        "/mainScreen": (context) => MainScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int i;
  bool page;

  @override
  void initState() {
    i = 0;
    page = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: AnimatedNavBar(
          color: Colors.white,
          iconColor: Color(0xFF0D1C2E),
          inactiveIconColor: Color(0xFF233B90),
          backgroundColor: Colors.blue,
          borderRadius: Radius.circular(24),
          shadow: false,
          textStyle: Theme.of(context).textTheme.headline4,
          pages: [
            AnimatedNavBarPage(
              title: "home",
              icon: Icons.home_filled,
              pageContent: HomePage(),
            ),
            AnimatedNavBarPage(
              title: "map",
              icon: Icons.map,
              inactiveIcon: Icons.map_outlined,
              pageContent: ProductPage(),
            ),
            AnimatedNavBarPage(
              title: "cart",
              icon: Icons.shopping_cart,
              pageContent: Container(
                height: 80,
                width: 80,
                color: Colors.greenAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
