import 'package:cloud_firestore/cloud_firestore.dart';

class DestinationDetail {
  final String? idDoc;
  final String? name;
  final String? description;
  final String? location;
  final String? rating;
  final String? urlImage;
  final String? urlWeb;
  final String? city;

  DestinationDetail(
      {this.idDoc,
      this.name,
      this.description,
      this.location,
      this.rating,
      this.urlImage,
      this.urlWeb,
      this.city});

  factory DestinationDetail.fromMap(map) {
    return DestinationDetail(
      idDoc: map["idDoc"],
      name: map["name"],
      description: map["description"],
      location: map["location"],
      rating: map["rating"].toString(),
      urlImage: map["urlImage"],
      urlWeb: map["urlWeb"],
      city: map["city"],
    );
  }
}

toDestination(DocumentSnapshot<Object?> map) {
  return DestinationDetail.fromMap(map);
}
