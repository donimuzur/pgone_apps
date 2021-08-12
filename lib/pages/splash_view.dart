import 'dart:async';

import 'package:flutter/material.dart';
import '../shared/theme.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.pushNamedAndRemoveUntil(
          context, '/GetStarted', (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackgroundColor,
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              child: Image.asset("assets/images/logo.png"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "PG",
                  style: mainTextStyle.copyWith(
                      fontSize: 45,
                      color: kLogoColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "One",
                  style: mainTextStyle.copyWith(
                      fontSize: 45,
                      color: Colors.black38,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
