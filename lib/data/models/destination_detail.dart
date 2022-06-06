import 'package:cloud_firestore/cloud_firestore.dart';

class DestinationDetail {
  final String? name;
  final String? description;
  final String? location;
  final String? rating;
  final String urlImage;

  DestinationDetail(
      {this.name,
      this.description,
      this.location,
      this.rating,
      required this.urlImage});

  factory DestinationDetail.fromMap(map) {
    return DestinationDetail(
        name: map["name"],
        description: map["description"],
        location: map["location"],
        rating: map["rating"].toString(),
        urlImage: map["urlImage"]);
  }
}

toDestination(DocumentSnapshot<Object?> map) {
  return DestinationDetail.fromMap(map);
}
