import 'package:flutter/material.dart';
import 'package:my_bazaar/ui/components/DashedDivider.dart';
import 'package:my_bazaar/ui/components/EditText.dart';
import 'package:my_bazaar/ui/components/LoginButton.dart';
import 'package:my_bazaar/ui/mybazaar_icons.dart';

import '../../main.dart';
import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "English (United States)",
                        style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                        size: 20,
                      )
                    ],
                  ),
                ),
                // todo: login forms
                Column(
                  children: [
                    Icon(
                      MyBazaarIcons.logo,
                      size: 80,
                      color: Colors.white,
                    ),
                    SizedBox(height: 20,),
                    EditText(
                      hintText: "email",
                      textInputType: TextInputType.emailAddress,
                    ),
                    EditText(
                      hintText: "password",
                      textInputType: TextInputType.visiblePassword,
                      isPassword: true,
                    ),
                    LoginButton(
                        title: "Log in",
                        onPressed: () {
                          Navigator.pushReplacement (context, MaterialPageRoute(builder: (BuildContext context) => MainScreen()));
                          //context.read<AuthenticationController>().signIn("ha_bouikken_bahi_amar@esi.dz", "123456789");
                        }),
                  ],
                ),
                // todo: don't have an account
                Column(
                  children: [
                    Divider(
                      height: 16,
                      thickness: 1,
                      color: Colors.white,
                    ),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Forgot your login details? ",
                              style: Theme.of(context).textTheme.headline4),
                          TextSpan(
                              text: "Get help logging in.",
                              style: Theme.of(context).textTheme.headline3),
                        ])),
                    SizedBox(
                      height: 8,
                    )
                  ],
                )
              ]),
        ));
  }
}
