class Dates {
    Dates({
        this.outboundDates,
    });

    List<OutboundDate> outboundDates;

    factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        outboundDates: List<OutboundDate>.from(json["OutboundDates"].map((x) => OutboundDate.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "OutboundDates": List<dynamic>.from(outboundDates.map((x) => x.toJson())),
    };
}

class OutboundDate {
    OutboundDate({
        this.partialDate,
        this.quoteDateTime,
        this.price,
        this.quoteIds,
    });

    DateTime partialDate;
    DateTime quoteDateTime;
    int price;
    List<int> quoteIds;

    factory OutboundDate.fromJson(Map<String, dynamic> json) => OutboundDate(
        partialDate: DateTime.parse(json["PartialDate"]),
        quoteDateTime: DateTime.parse(json["QuoteDateTime"]),
        price: json["Price"],
        quoteIds: List<int>.from(json["QuoteIds"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "PartialDate": "${partialDate.year.toString().padLeft(4, '0')}-${partialDate.month.toString().padLeft(2, '0')}-${partialDate.day.toString().padLeft(2, '0')}",
        "QuoteDateTime": quoteDateTime.toIso8601String(),
        "Price": price,
        "QuoteIds": List<dynamic>.from(quoteIds.map((x) => x)),
    };
}