import 'package:flutter/material.dart';
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
      home: HomePage(),
      debugShowCheckedModeBanner: false,
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
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24))),
                child: (() {
                  switch (i) {
                    case 0:
                      return Container(
                        child: Column(
                          children: [
                            // title
                            Container(
                              padding: const EdgeInsets.all(16.0),
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
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  )
                                ],
                              ),
                            ),
                            // search
                            SearchBar(),
                            // deals
                            Deals(),

                            // products
                          ],
                        ),
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
              ),

              // TabButtons
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      flex: (i == 0) ? 2 : 1,
                      child: FlatButton(
                          color: (i == 0) ? Colors.white: ThemeColors.primaryColor,
                          onPressed: () => setState(() => i = 0),
                          child: Icon(
                            MyBazaarIcons.home,
                            color: (i == 0) ? ThemeColors.primaryColor: ThemeColors.backgroundColor,
                          ))),
                  Expanded(
                      flex: (i == 1) ? 2 : 1,
                      child: FlatButton(
                          color: (i == 1) ? Colors.white: ThemeColors.primaryColor,
                          onPressed: () => setState(() => i = 1),
                          child: Icon(
                            MyBazaarIcons.compass,
                            color: (i == 1) ? ThemeColors.primaryColor: ThemeColors.backgroundColor,
                          ))),
                  Expanded(
                      flex: (i == 2) ? 2 : 1,
                      child: FlatButton(
                          color: (i == 2) ? Colors.white: ThemeColors.primaryColor,
                          onPressed: () => setState(() => i = 2),
                          child: Icon(
                            MyBazaarIcons.cart,
                            color: (i == 2) ? ThemeColors.primaryColor: ThemeColors.backgroundColor,
                          ))),
                  Expanded(
                      flex: (i == 3) ? 2 : 1,
                      child: FlatButton(
                          color: (i == 3) ? Colors.white: ThemeColors.primaryColor,
                          onPressed: () => setState(() => i = 3),
                          child: Icon(
                            MyBazaarIcons.person,
                            color: (i == 3) ? ThemeColors.primaryColor: ThemeColors.backgroundColor,
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
