import 'package:flutter/material.dart';
import 'package:nazeeh_beds/constants.dart';

AppBar buildAppBar(String text, IconData icon1, IconData icon2, IconData icon3, BuildContext context, String button1, String button2, String button3) {
  return AppBar(
    brightness: Brightness.dark,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    toolbarHeight: 100,
    title: Text(text, style: TextStyle(fontSize: 24),),
    centerTitle: true,
    leading: icon1 == null?null :IconButton(icon: Icon(icon1), onPressed:button1 == null? null : () {
      Navigator.pushReplacementNamed(context, button1);
    }),
    actions: [
      if(icon2 != null) IconButton(icon: Icon(icon2), onPressed:button2 == null? null : () {
          Navigator.pushReplacementNamed(context, button2);
      }),
      if(icon3 != null) IconButton(icon: Icon(icon3), onPressed:button3 == null? null : () {
        Navigator.pushReplacementNamed(context, button3);
      }),
    ],
    flexibleSpace: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
          color: primaryColor,
      ),
    ),
  );
}