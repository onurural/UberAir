class OutboundLeg {
    OutboundLeg({
        this.carrierIds,
        this.originId,
        this.destinationId,
        this.departureDate,
    });

    List<int> carrierIds;
    int originId;
    int destinationId;
    DateTime departureDate;

    factory OutboundLeg.fromJson(Map<String, dynamic> json) => OutboundLeg(
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