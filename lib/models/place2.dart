class Places {
    Places({
        this.name,
        this.type,
        this.placeId,
        this.iataCode,
        this.skyscannerCode,
        this.cityName,
        this.cityId,
        this.countryName,
    });

    String name;
    String type;
    int placeId;
    String iataCode;
    String skyscannerCode;
    String cityName;
    String cityId;
    String countryName;

    factory Places.fromJson(Map<String, dynamic> json) => Places(
        name: json["Name"],
        type: json["Type"],
        placeId: json["PlaceId"],
        iataCode: json["IataCode"] == null ? null : json["IataCode"],
        skyscannerCode: json["SkyscannerCode"],
        cityName: json["CityName"] == null ? null : json["CityName"],
        cityId: json["CityId"],
        countryName: json["CountryName"],
    );

    Map<String, dynamic> toJson() => {
        "Name": name,
        "Type": type,
        "PlaceId": placeId,
        "IataCode": iataCode == null ? null : iataCode,
        "SkyscannerCode": skyscannerCode,
        "CityName": cityName == null ? null : cityName,
        "CityId": cityId,
        "CountryName": countryName,
    };
}