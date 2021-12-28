import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nazeeh_beds/screens/homepage.dart';
import 'package:nazeeh_beds/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = '/splash';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = true;
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    var duration = Duration(
      seconds: 3,
    );
    Timer(duration, () async {
      if(isLoggedIn){
        Navigator.pushReplacementNamed(context, HomePage.id);
      }
      else{
        Navigator.pushReplacementNamed(context, LoginScreen.id);
      }
    });
  }

  initScreen(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(),
            Image.asset(
              "assets/organic.png",
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        'Nazeeh Beds',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Color(0XFFA6BCD0),
                            fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

