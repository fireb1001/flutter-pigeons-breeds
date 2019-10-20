import 'package:flutter/material.dart';
import 'GradientAppBar.dart';
import 'HomePageBody.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: new Color(0xFF736AB7),
      body: new Column(
        children: <Widget>[
          new GradientAppBar("Pigeons"),
          new HomePageBody(),
        ],
      ),
    );
  }
}