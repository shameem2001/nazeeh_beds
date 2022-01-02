import 'package:flutter/material.dart';

class ProductSpecs extends StatelessWidget {
  const ProductSpecs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          color: Colors.white,
          height: 400,
          child: Center(child: Text('Hello')),
        ),
      ),
    );
  }
}
