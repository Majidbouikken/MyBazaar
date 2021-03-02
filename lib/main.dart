import 'package:flutter/material.dart';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int i;

  @override
  void initState() {
    i = 0;
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
              (() {
                switch (i) {
                  case 0:
                    return Column(
                      children: [
                        // title
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          color: ThemeColors.backgroundColor,
                          child: Row(
                            children: [
                              Icon(
                                MyBazaarIcons.logo,
                                color: ThemeColors.textColor,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'MyBazaar',
                                style: TextStyle(color: ThemeColors.textColor),
                              )
                            ],
                          ),
                        )
                        // search

                        // deals

                        // products
                      ],
                    );
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
              // TabButtons
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      flex: (i == 0) ? 2 : 1,
                      child: FlatButton(
                          onPressed: () => setState(() => i = 0),
                          child: Icon(
                            MyBazaarIcons.home,
                            color: ThemeColors.backgroundColor,
                          ))),
                  Expanded(
                      flex: (i == 1) ? 2 : 1,
                      child: FlatButton(
                          onPressed: () => setState(() => i = 1),
                          child: Icon(
                            MyBazaarIcons.compass,
                            color: ThemeColors.backgroundColor,
                          ))),
                  Expanded(
                      flex: (i == 2) ? 2 : 1,
                      child: FlatButton(
                          onPressed: () => setState(() => i = 2),
                          child: Icon(
                            MyBazaarIcons.cart,
                            color: ThemeColors.backgroundColor,
                          ))),
                  Expanded(
                      flex: (i == 3) ? 2 : 1,
                      child: FlatButton(
                          onPressed: () => setState(() => i = 3),
                          child: Icon(
                            MyBazaarIcons.person,
                            color: ThemeColors.backgroundColor,
                          ))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
