import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nazeeh_beds/components/custom_app_drawer.dart';
import 'package:nazeeh_beds/components/custom_appbar.dart';
import 'package:nazeeh_beds/components/custom_bottom_navigation_bar.dart';

import 'chatbox_page.dart';
import 'notification_page.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
          return true;
        } else {
          return false;
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(
              'Nazeeh Beds',
              null,
              FontAwesomeIcons.comments,
              Icons.notifications,
              context,
              null,
              ChatboxPage.id,
              NotificationPage.id,
          ),
          drawer: CustomDrawer(),
          body: Container(),
          bottomNavigationBar: CustomBottomNavigationBar(),
            ),
          ),
    );
  }
}

