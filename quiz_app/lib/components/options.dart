import 'package:flutter/material.dart';

Widget options() {
  return Center(
    child: Padding(
      padding: EdgeInsets.only(top: 40),
      child: FlatButton(
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 80, right: 80),
        ),
        color: Colors.blue[200],
        splashColor: Colors.white24,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    ),
  );
}