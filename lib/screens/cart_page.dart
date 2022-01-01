import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nazeeh_beds/components/custom_appbar.dart';
import 'chatbox_page.dart';
import 'homepage.dart';
import 'notification_page.dart';

class CartPage extends StatefulWidget {
  static const String id = "cart_page";
  const CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
          return true;
        } else {
          Navigator.popAndPushNamed(context, HomePage.id);
          return false;
        }
      },
      child: SafeArea(
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
        ),
      ),
    );
  }
}
