class Currency {
    Currency({
        this.code,
        this.symbol,
        this.thousandsSeparator,
        this.decimalSeparator,
        this.symbolOnLeft,
        this.spaceBetweenAmountAndSymbol,
        this.roundingCoefficient,
        this.decimalDigits,
    });

    String code;
    String symbol;
    String thousandsSeparator;
    String decimalSeparator;
    bool symbolOnLeft;
    bool spaceBetweenAmountAndSymbol;
    int roundingCoefficient;
    int decimalDigits;

    factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        code: json["Code"],
        symbol: json["Symbol"],
        thousandsSeparator: json["ThousandsSeparator"],
        decimalSeparator: json["DecimalSeparator"],
        symbolOnLeft: json["SymbolOnLeft"],
        spaceBetweenAmountAndSymbol: json["SpaceBetweenAmountAndSymbol"],
        roundingCoefficient: json["RoundingCoefficient"],
        decimalDigits: json["DecimalDigits"],
    );

    Map<String, dynamic> toJson() => {
        "Code": code,
        "Symbol": symbol,
        "ThousandsSeparator": thousandsSeparator,
        "DecimalSeparator": decimalSeparator,
        "SymbolOnLeft": symbolOnLeft,
        "SpaceBetweenAmountAndSymbol": spaceBetweenAmountAndSymbol,
        "RoundingCoefficient": roundingCoefficient,
        "DecimalDigits": decimalDigits,
    };
}
