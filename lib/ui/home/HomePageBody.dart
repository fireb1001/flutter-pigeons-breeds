import 'package:flutter/material.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:pigeons_breeds/model/pigeon.dart';

import 'PigeonRow.dart';

import 'package:firebase_database/firebase_database.dart';

class HomePageBody extends StatefulWidget {

  @override
  HomePageBodyState createState() {
    return new HomePageBodyState();
  }
}

class HomePageBodyState extends State<HomePageBody> {

  DatabaseReference ref;

  @override
  void initState() {
    super.initState();
    final FirebaseDatabase database = FirebaseDatabase.instance;
    ref = database.reference().child("breeds");
  }

  @override
  Widget build(BuildContext context) {

    return new Flexible(
      child: new FirebaseAnimatedList(
        query: ref,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
              Pigeon pigeon = new Pigeon.fromSnapshot(snapshot);
              return new PigeonRow(pigeon);
            },
      ),

    );
  }
}

