class Carrier {
    Carrier({
        this.carrierId,
        this.name,
    });

    int carrierId;
    String name;

    factory Carrier.fromJson(Map<String, dynamic> json) => Carrier(
        carrierId: json["CarrierId"],
        name: json["Name"],
    );

    Map<String, dynamic> toJson() => {
        "CarrierId": carrierId,
        "Name": name,
    };
}