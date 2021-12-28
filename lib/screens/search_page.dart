import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nazeeh_beds/components/custom_appbar.dart';
import 'package:nazeeh_beds/components/custom_bottom_navigation_bar.dart';
import 'package:nazeeh_beds/screens/homepage.dart';

import 'chatbox_page.dart';
import 'notification_page.dart';

class SearchScreen extends StatefulWidget {
  static const String id = "search_page";
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(
          'Nazeeh Beds',
          Icons.arrow_back_ios,
          FontAwesomeIcons.comments,
          Icons.notifications,
          context,
          HomePage.id,
          ChatboxPage.id,
          NotificationPage.id,
        ),
        body: Container(),
        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }
}
