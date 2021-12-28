import 'package:flutter/material.dart';

class TrackOrderPage extends StatefulWidget {
  static const String id = "track_order_page";
  const TrackOrderPage({Key key}) : super(key: key);

  @override
  _TrackOrderPageState createState() => _TrackOrderPageState();
}

class _TrackOrderPageState extends State<TrackOrderPage> {
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
