import 'package:flutter/material.dart';

class EditText extends StatefulWidget {
  final String hintText;
  final TextInputType textInputType;
  final bool isPassword;

  const EditText({Key key, this.hintText, this.textInputType, this.isPassword = false})
      : super(key: key);

  @override
  _EditTextState createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  final _focusNode = FocusNode();
  bool _isFocused;

  @override
  void initState() {
    _isFocused = false;
    _focusNode.addListener(() {
      if (_focusNode.hasFocus)
        setState(() {
          _isFocused = true;
        });
      else
        setState(() {
          _isFocused = false;
        });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border.all(
              color: _isFocused
                  ? Theme.of(context).primaryColor
                  : Colors.transparent,
              width: 1),
          borderRadius: BorderRadius.circular(24)),
      child: TextField(
        obscureText: widget.isPassword ? true : false,
        enableSuggestions: widget.isPassword ? false : true,
        autocorrect: widget.isPassword ? false : true,
        focusNode: _focusNode,
        keyboardType: widget.textInputType,
        style: Theme.of(context).textTheme.headline3,
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,

            hintText: this.widget.hintText,
            hintStyle: Theme.of(context).textTheme.headline4
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
