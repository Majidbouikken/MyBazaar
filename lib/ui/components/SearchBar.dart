import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_bazaar/ui/theme.dart';
import '../../main.dart';
import '../mybazaar_icons.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  FocusNode _focus = new FocusNode();
  bool _border;

  void _onFocusChange() {
    if (_focus.hasFocus == true)
      setState(() {
        _border = true;
      });
    else
      setState(() {
        _border = false;
      });
  }

  @override
  void initState() {
    _border = false;
    _focus.addListener(_onFocusChange);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(100),
        border: _border? Border.all(color: ThemeColors.primaryColor, width: 2) : Border.all(color: Theme.of(context).cardColor, width: 2)
      ),
      child: Center(
        child: TextField(
            focusNode: _focus,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
              fontFamily: 'Rubik',
              fontSize: 14,
              color: ThemeColors.textColor,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(left: 16, top: 0, bottom: 0, right: 0),
              isDense: true,
              border: InputBorder.none,
              hintText: 'Search product',
              hintStyle: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 14,
                color: ThemeColors.textColor,
                fontWeight: FontWeight.w300,
              ),
              prefixIcon: Icon(
                MyBazaarIcons.maximize,
                size: 21.6,
                color: ThemeColors.textColor,
              ),
            )),
      ),
    );
  }
}
