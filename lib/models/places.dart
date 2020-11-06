import 'dart:convert';
Place airportFromJson(String str) => Place.fromJson(json.decode(str));
String airportToJson(Place data) => json.encode(data.toJson());
class Place {
  Place({
    this.placeId,
    this.placeName,
    this.countryId,
    this.regionId,
    this.cityId,
    this.countryName,
  });
  String placeId;
  String placeName;
  String countryId;
  String regionId;
  String cityId;
  String countryName;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        placeId: json["PlaceId"] == null ? null : json["PlaceId"],
        placeName: json["PlaceName"] == null ? null : json["PlaceName"],
        countryId: json["CountryId"] == null ? null : json["CountryId"],
        regionId: json["RegionId"] == null ? null : json["RegionId"],
        cityId: json["CityId"] == null ? null : json["CityId"],
        countryName: json["CountryName"] == null ? null : json["CountryName"],
      );

  Map<String, dynamic> toJson() => {
        "PlaceId": placeId == null ? null : placeId,
        "PlaceName": placeName == null ? null : placeName,
        "CountryId": countryId == null ? null : countryId,
        "RegionId": regionId == null ? null : regionId,
        "CityId": cityId == null ? null : cityId,
        "CountryName": countryName == null ? null : countryName,
      };
}
