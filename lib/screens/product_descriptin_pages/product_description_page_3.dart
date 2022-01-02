import 'package:flutter/material.dart';

class ProductReviews extends StatelessWidget {
  const ProductReviews({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}
