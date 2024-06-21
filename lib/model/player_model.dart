import 'package:cloud_firestore/cloud_firestore.dart';

class Player {
  final String name;
  final String nationality;
  final String position;
  final String imageUrl;

  Player(
      {required this.name,
      required this.nationality,
      required this.position,
      required this.imageUrl});

  factory Player.fromDocument(DocumentSnapshot doc) {
    return Player(
      name: doc['name'],
      nationality: doc['nationality'],
      position: doc['position'],
      imageUrl: doc['image_url'],
    );
  }
}
