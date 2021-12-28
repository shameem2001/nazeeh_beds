import 'package:flutter/material.dart';
import 'package:nazeeh_beds/components/custom_appbar.dart';

import 'homepage.dart';

class NotificationPage extends StatefulWidget {
  static const String id = "notification_page";
  const NotificationPage({Key key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
          return true;
        } else {
          Navigator.popAndPushNamed(context,HomePage.id);
          return false;
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar('Notification', null, null, Icons.close, context, null, null, HomePage.id),
          body: Container(),
        ),
      ),
    );
  }
}
