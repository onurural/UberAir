import 'bound_leg.dart';

class Quote {
    Quote({
        this.quoteId,
        this.minPrice,
        this.direct,
        this.outboundLeg,
        this.inboundLeg,
        this.quoteDateTime, 
    });

    int quoteId;
    int minPrice;
    bool direct;
    BoundLeg outboundLeg;
    BoundLeg inboundLeg;
    DateTime quoteDateTime;

    factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        
        quoteId: json["QuoteId"],
        minPrice: json["MinPrice"],
        direct: json["Direct"],
        outboundLeg: BoundLeg.fromJson(json["OutboundLeg"]),
        inboundLeg: BoundLeg.fromJson(json["InboundLeg"]),
        quoteDateTime: DateTime.parse(json["QuoteDateTime"]),
    );

    Map<String, dynamic> toJson() => {
        "QuoteId": quoteId,
        "MinPrice": minPrice,
        "Direct": direct,
        "OutboundLeg": outboundLeg.toJson(),
        "InboundLeg": inboundLeg.toJson(),
        "QuoteDateTime": quoteDateTime.toIso8601String(),
    };
}