import 'package:flutter/material.dart';
import 'package:pigeons_breeds/model/pigeon.dart';
import 'package:pigeons_breeds/ui/home/PigeonRow.dart';
import 'package:pigeons_breeds/ui/common/MyTextStyle.dart';
import 'package:pigeons_breeds/ui/common/Separator.dart';

import 'package:firebase_database/firebase_database.dart';
final FirebaseDatabase fireInstance = FirebaseDatabase.instance;

class DetailPage extends StatefulWidget {
  final Pigeon pigeon;
  DetailPage(this.pigeon);
  @override
  _DetailPageState createState() => new _DetailPageState(pigeon);
}

class _DetailPageState extends State<DetailPage> {

  final Pigeon pigeon;
  _DetailPageState(this.pigeon);

  @override
  Widget build(BuildContext context) {
    /*
    fireInstance.reference().child("planets").child(this.planet.name.toLowerCase()).once().then((DataSnapshot val){
      setState(() {
        this.firein = val.value.toString();
      });
    });
    */

    return new Scaffold(
      body: new Container(
        color: const Color(0xFF736AB7),
        //constraints: new BoxConstraints.expand(),
        child: new Stack (
          children: <Widget>[
            _getBackground(),
            _getGradient(),
            _getContent(),
            _getToolbar(context),
          ],
        ),
        /*
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(planet.name),
            new Hero(tag: "planet-hero-${planet.id}",
              child: new Image.asset(
                  planet.image,
                  width: 96.0,
                  height: 96.0,
              ),
            )
          ],
        ),
        */
      ),
    );
  }

  Container _getBackground() {
    return new Container(
      child: new Image.network(pigeon.image,
        fit: BoxFit.cover,
        height: 300.0,
      ),
      constraints: new BoxConstraints.expand(height: 295.0),
    );
  }

  Container _getGradient() {
    return new Container(
      margin: new EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: <Color>[
            new Color(0x00736AB7),
            new Color(0xFF736AB7)
          ],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Container _getContent() {
    final _overviewTitle = "Overview".toUpperCase();
    return new Container(
      child: new ListView(
        padding: new EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
        children: <Widget>[
          new PigeonRow(pigeon,
            horizontal: false,
          ),
          new Container(
            padding: new EdgeInsets.symmetric(horizontal: 32.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(_overviewTitle,
                  style: MyTextStyle.headerTextStyle,),
                new Separator(),
                //new Text(firein),
                new Text(
                    pigeon.description, style: MyTextStyle.commonTextStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(
          top: MediaQuery
              .of(context)
              .padding
              .top),
      child: new BackButton(color: Colors.white),
    );
  }
}

