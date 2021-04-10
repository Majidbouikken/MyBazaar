import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final title;
  final Function onPressed;

  const LoginButton({Key key, this.title, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Material(
        borderRadius: BorderRadius.circular(24),
        elevation: 0,
        color: Theme.of(context).buttonColor,
        child: InkWell(
            onTap: this.onPressed,
            child: Container(
                height: 44,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Text(
                  this.title,
                  style: Theme.of(context).textTheme.headline3,
                ))),
      ),
    );
  }
}
