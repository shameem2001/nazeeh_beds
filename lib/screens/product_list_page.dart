import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  static const String id = "product_list_page";
  const ProductListPage({Key key}) : super(key: key);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
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
