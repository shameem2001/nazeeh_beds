import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
