import 'package:flutter/material.dart';

import 'homepage.dart';

class ProductListPage extends StatefulWidget {
  static const String id = "product_list_page";
  const ProductListPage({Key key}) : super(key: key);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
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
          appBar: AppBar(),
          body: Container(),
        ),
      ),
    );
  }
}
