import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nazeeh_beds/constants.dart';
import 'package:nazeeh_beds/screens/homepage.dart';
import 'package:nazeeh_beds/screens/login_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const String id = '/splash';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
        Navigator.pushReplacementNamed(context, AuthenticationWrapper.id);
    });
  }

  initScreen(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kmoreLighterPrimaryColor,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  kmoreLighterPrimaryColor,
                  klighterPrimaryColor,
                  klightPrimaryColor,
                  kprimaryColor,
                ],
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Spacer(),
              Stack(
                children: [
                  Image.asset(
                    "assets/nazeeh_beds_blue.png",
                    scale: 1.8,
                  ),
                  Positioned(
                    bottom: 25,
                    left: 60,
                    child: Text('nazeeh beds',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          fontSize: 24),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 5, bottom: 10),
                        child: Text(
                          '©Copyright 2021 Nazeeh Beds',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  static const String id = "auth_wrapper";
  const AuthenticationWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if(firebaseUser != null) {
      print("Already signed in");
      return HomePage();
    }
    else{
      print("Not signed in");
      return LoginScreen();
    }
  }
}
