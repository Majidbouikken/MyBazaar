import 'package:flutter/material.dart';
import 'package:my_bazaar/ui/components/Deals.dart';
import 'package:my_bazaar/ui/components/SearchBar.dart';

import '../mybazaar_icons.dart';
import '../theme.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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
  }
}