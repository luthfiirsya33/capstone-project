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
  final String? urlMap;
  final String? imgPath;
  final String? category;

  DestinationDetail(
      {this.idDoc,
      this.name,
      this.description,
      this.location,
      this.rating,
      this.urlImage,
      this.urlWeb,
      this.city,
      this.urlMap,
      this.imgPath,
      this.category});

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
        urlMap: map["urlMap"],
        imgPath: map["imgPath"],
        category: map["category"]);
  }
}

toDestination(DocumentSnapshot<Object?> map) {
  return DestinationDetail.fromMap(map);
}
