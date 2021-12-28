import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  static const String id = "checkout_page";
  const CheckoutPage({Key key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(),
      ),
    );
  }
}
