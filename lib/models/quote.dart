import 'outboundleg.dart';

class Quote {
    Quote({
        this.quoteId,
        this.minPrice,
        this.direct,
        this.outboundLeg,
        this.quoteDateTime,
    });

    int quoteId;
    int minPrice;
    bool direct;
    OutboundLeg outboundLeg;
    DateTime quoteDateTime;

    factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        quoteId: json["QuoteId"],
        minPrice: json["MinPrice"],
        direct: json["Direct"],
        outboundLeg: OutboundLeg.fromJson(json["OutboundLeg"]),
        quoteDateTime: DateTime.parse(json["QuoteDateTime"]),
    );

    Map<String, dynamic> toJson() => {
        "QuoteId": quoteId,
        "MinPrice": minPrice,
        "Direct": direct,
        "OutboundLeg": outboundLeg.toJson(),
        "QuoteDateTime": quoteDateTime.toIso8601String(),
    };
}