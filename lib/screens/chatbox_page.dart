import 'package:flutter/material.dart';
import 'package:nazeeh_beds/components/custom_appbar.dart';

import 'homepage.dart';

class ChatboxPage extends StatefulWidget {
  static const String id = "chatbox_page";
  const ChatboxPage({Key key}) : super(key: key);

  @override
  _ChatboxPageState createState() => _ChatboxPageState();
}

class _ChatboxPageState extends State<ChatboxPage> {
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
          appBar: buildAppBar(null, null, null, Icons.close, context, null, null, HomePage.id),
          body: Container(),
        ),
      ),
    );
  }
}
