import 'package:flutter/material.dart';
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
      home: LoginPage(),
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
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              // TabView
              Container(
                height: MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-44-16,
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24))),
                child: (() {
                  switch (i) {
                    case 0:
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            page=!page;
                          });
                        },
                          child: page? ProductPage() : HomePage());
                    case 1:
                      return Container(
                        color: Colors.white,
                        child: Text('Two'),
                      );
                    case 2:
                      return Container(
                        color: Colors.white,
                        child: Text('Three'),
                      );
                    case 3:
                      return Container(
                        color: Colors.white,
                        child: Text('Four'),
                      );
                    default:
                      return Container(
                        color: Colors.white,
                        child: Text('One'),
                      );
                  }
                }()),
              ),

              // TabButtons
              Container(
                height: 44,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        flex: (i == 0) ? 2 : 1,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: (i == 0) ? Colors.white: ThemeColors.primaryColor,
                          ),
                            onPressed: () => setState(() => i = 0),
                            child: Icon(
                              MyBazaarIcons.home,
                              color: (i == 0) ? ThemeColors.primaryColor: ThemeColors.backgroundColor,
                            ))),
                    Expanded(
                        flex: (i == 1) ? 2 : 1,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: (i == 1) ? Colors.white: ThemeColors.primaryColor,
                            ),
                            onPressed: () => setState(() => i = 1),
                            child: Icon(
                              MyBazaarIcons.compass,
                              color: (i == 1) ? ThemeColors.primaryColor: ThemeColors.backgroundColor,
                            ))),
                    Expanded(
                        flex: (i == 2) ? 2 : 1,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: (i == 2) ? Colors.white: ThemeColors.primaryColor,
                            ),
                            onPressed: () => setState(() => i = 2),
                            child: Icon(
                              MyBazaarIcons.cart,
                              color: (i == 2) ? ThemeColors.primaryColor: ThemeColors.backgroundColor,
                            ))),
                    Expanded(
                        flex: (i == 3) ? 2 : 1,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: (i == 3) ? Colors.white: ThemeColors.primaryColor,
                            ),
                            onPressed: () => setState(() => i = 3),
                            child: Icon(
                              MyBazaarIcons.person,
                              color: (i == 3) ? ThemeColors.primaryColor: ThemeColors.backgroundColor,
                            ))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
