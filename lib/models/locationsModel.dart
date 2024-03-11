import 'package:animated_pageview_builder/models/reviewsModel.dart';

class Location {
  String? name;
  String? images;
  String? latitude;
  String? longitude;
  String? addressLine1;
  String? addressLine2;
  int? starRating;
  List<Review>? reviews;

  Location(
      {this.name,
      this.images,
      this.latitude,
      this.longitude,
      this.addressLine1,
      this.addressLine2,
      this.starRating,
      this.reviews});
}
