class BoundLeg {
    BoundLeg({
        this.carrierIds,
        this.originId,
        this.destinationId,
        this.departureDate,
    });

    List<int> carrierIds;
    int originId;
    int destinationId;
    DateTime departureDate;

    factory BoundLeg.fromJson(Map<String, dynamic> json) => BoundLeg(
        carrierIds: List<int>.from(json["CarrierIds"].map((x) => x)),
        originId: json["OriginId"],
        destinationId: json["DestinationId"],
        departureDate: DateTime.parse(json["DepartureDate"]),
    );

    Map<String, dynamic> toJson() => {
        "CarrierIds": List<dynamic>.from(carrierIds.map((x) => x)),
        "OriginId": originId,
        "DestinationId": destinationId,
        "DepartureDate": departureDate.toIso8601String(),
    };
}