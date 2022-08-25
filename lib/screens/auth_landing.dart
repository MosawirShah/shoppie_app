import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shoppify_app/screens/login_screen.dart';
import 'package:shoppify_app/screens/register_screen.dart';

class AuthLanding extends StatefulWidget {
  const AuthLanding({Key? key}) : super(key: key);

  @override
  State<AuthLanding> createState() => _AuthLandingState();
}

class _AuthLandingState extends State<AuthLanding> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 1),
        () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(""),
          ),
          Align(alignment: Alignment.center, child: Text("Shopie App")),
        ],
      ),
    );
  }
}
