import 'package:firebase_database/firebase_database.dart';

class Pigeon {
  String id;
  String name;
  String description;
  String image;
  String thumb;
  String country;
  String group;

  Pigeon({this.id,
   this.name,
   this.description,
   this.image,
   this.thumb,
   this.country,
   this.group
  });

  Pigeon.fromSnapshot(DataSnapshot sn):
    id = sn.key,
    name = sn.value["name"],
    description = sn.value["description"],
    image = sn.value["image"],
    thumb = sn.value["thumb"],
    country = sn.value["country"],
    group = sn.value["group"];

  toJSON(){
    return {
      "name":name,
      "description":description,
      "image":image,
      "thumb":thumb,
      "country": country,
      "group": group,
    };
  }
}