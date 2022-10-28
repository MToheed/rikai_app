import 'package:flutter/material.dart';

class MyDesignation extends StatelessWidget {
  const MyDesignation(
      {Key? key, required this.designation, required this.mPadding})
      : super(key: key);

  final String designation;
  final double mPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.deepPurple, borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: EdgeInsets.all(mPadding),
        child: Text(
          " $designation ",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
