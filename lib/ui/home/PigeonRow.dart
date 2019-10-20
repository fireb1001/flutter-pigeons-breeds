import 'package:flutter/material.dart';
import 'package:pigeons_breeds/model/pigeon.dart';
import 'package:pigeons_breeds/ui/common/MyTextStyle.dart';
import 'package:pigeons_breeds/ui/common/Separator.dart';
import 'package:pigeons_breeds/ui/detail/DetailPage.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:transparent_image/transparent_image.dart';


final FirebaseDatabase fireInstance = FirebaseDatabase.instance;

class PigeonRow extends StatefulWidget {

  final Pigeon pigeon;
  final bool horizontal;

  PigeonRow.vertical(this.pigeon): horizontal = false;
  PigeonRow(this.pigeon, {this.horizontal = true});
  
  @override
  PigeonRowState createState() {
    return new PigeonRowState(pigeon,horizontal: horizontal);
  }
}

class PigeonRowState extends State<PigeonRow> {


  final Pigeon pigeon;
  final bool horizontal;

  PigeonRowState(this.pigeon, {this.horizontal = true});
  PigeonRowState.vertical(this.pigeon): horizontal = false;

  Container _getPlanetThumb() {  
      return  new Container(
      margin: new EdgeInsets.symmetric(
        vertical: 16.0
      ),
      alignment: FractionalOffset.centerLeft,
      child: new FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image : pigeon.thumb,
        height: 92.0,
        width: 92.0,
      ),
    );
  }

  Widget _planetValue({String value, String image}) {
    return new Row(
      children: <Widget>[
        new Image.asset(image, height: 12.0),
        new Container(width: 8.0),
        new Text(value, style: MyTextStyle.smallTextStyle),
      ]
    );
  }

  Container _getPigeonCardContent() {
    return new Container(
      margin: new EdgeInsets.fromLTRB(horizontal ? 66.0 : 24.0, horizontal ? 12.0 : 22.0, 12.0, 12.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(pigeon.name, style: MyTextStyle.headerTextStyle),
          new Container(height: 8.0),
          new Text("Domesticated", style: MyTextStyle.commonTextStyle),
          new Separator(),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Expanded(
                flex: horizontal ? 1 : 0,
                child: _planetValue(
                  value: pigeon.country,
                  image: 'assets/img/ic_distance.png')
              ),
              new Expanded(
                flex: horizontal ? 1 : 0,
                child: _planetValue(
                  value: pigeon.group,
                  image: 'assets/img/ic_gravity.png')
              )
            ],
          ),
        ],
      ),
    );
  } 

  Container _getPlanetCard(){
    return new Container(
      height: 124.0,
      margin: new EdgeInsets.only(left: 38.0),
      child: _getPigeonCardContent(),
      decoration: new BoxDecoration(
        color: new Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );
  } 
  
  @override
  Widget build(BuildContext context) {
    /*
    return new Container(
      child: new Stack(
        children: <Widget>[
          _getPlanetCard(),
          _getPlanetThumb(),
        ],
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 24.0,
      ),
    );
    */

    return new GestureDetector(
      onTap: horizontal ? () { Navigator.of(context).push(
            new PageRouteBuilder(
              pageBuilder: (_, __, ___) => new DetailPage(pigeon),
              transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                new FadeTransition(opacity: animation, child: child),
              ) ,
            );
            }
          : null,
      child: new Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[
          _getPlanetCard(),
          _getPlanetThumb(),
          ],
        )
      ),
    );
  }
}
