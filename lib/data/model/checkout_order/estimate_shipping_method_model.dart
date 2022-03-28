class EstimateShippingMethodModel {
  String? carrierCode;
  String? methodCode;
  String? carrierTitle;
  String? methodTitle;
  int? amount;
  int? baseAmount;
  bool? available;
  String? errorMessage;
  int? priceExclTax;
  int? priceInclTax;

  EstimateShippingMethodModel(
      {carrierCode,
        methodCode,
        carrierTitle,
        methodTitle,
        amount,
        baseAmount,
        available,
        errorMessage,
        priceExclTax,
        priceInclTax});

  EstimateShippingMethodModel.fromJson(Map<String, dynamic> json) {
    carrierCode = json['carrier_code'];
    methodCode = json['method_code'];
    carrierTitle = json['carrier_title'];
    methodTitle = json['method_title'];
    amount = json['amount'];
    baseAmount = json['base_amount'];
    available = json['available'];
    errorMessage = json['error_message'];
    priceExclTax = json['price_excl_tax'];
    priceInclTax = json['price_incl_tax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['carrier_code'] = carrierCode;
    data['method_code'] = methodCode;
    data['carrier_title'] = carrierTitle;
    data['method_title'] = methodTitle;
    data['amount'] = amount;
    data['base_amount'] = baseAmount;
    data['available'] = available;
    data['error_message'] = errorMessage;
    data['price_excl_tax'] = priceExclTax;
    data['price_incl_tax'] = priceInclTax;
    return data;
  }
}
