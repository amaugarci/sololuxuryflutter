import 'package:get/get.dart';

class ShippingInformationModel {
  List<PaymentMethods>? paymentMethods;
  Totals? totals;

  ShippingInformationModel({paymentMethods, totals});

  ShippingInformationModel.fromJson(Map<String, dynamic> json) {
    if (json['payment_methods'] != null) {
      paymentMethods = <PaymentMethods>[];
      json['payment_methods'].forEach((v) {
        paymentMethods!.add(PaymentMethods.fromJson(v));
      });
    }
    totals = json['totals'] != null ? Totals.fromJson(json['totals']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (paymentMethods != null) {
      data['payment_methods'] = paymentMethods!.map((v) => v.toJson()).toList();
    }
    if (totals != null) {
      data['totals'] = totals!.toJson();
    }
    return data;
  }
}

class PaymentMethods {
  String? code;
  String? title;

  PaymentMethods({code, title});

  PaymentMethods.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['title'] = title;
    return data;
  }
}

class Totals {
  dynamic grandTotal;
  dynamic baseGrandTotal;
  dynamic subtotal;
  dynamic baseSubtotal;
  dynamic discountAmount;
  dynamic baseDiscountAmount;
  dynamic subtotalWithDiscount;
  dynamic baseSubtotalWithDiscount;
  dynamic shippingAmount;
  dynamic baseShippingAmount;
  dynamic shippingDiscountAmount;
  dynamic baseShippingDiscountAmount;
  dynamic taxAmount;
  dynamic baseTaxAmount;
  dynamic weeeTaxAppliedAmount = 0;
  dynamic shippingTaxAmount;
  dynamic baseShippingTaxAmount;
  dynamic subtotalInclTax;
  dynamic shippingInclTax;
  dynamic baseShippingInclTax;
  String? baseCurrencyCode;
  String? quoteCurrencyCode;
  dynamic itemsQty;
  List<Items>? items;
  List<TotalSegments>? totalSegments;

  Totals(
      {grandTotal,
      baseGrandTotal,
      subtotal,
      baseSubtotal,
      discountAmount,
      baseDiscountAmount,
      subtotalWithDiscount,
      baseSubtotalWithDiscount,
      shippingAmount,
      baseShippingAmount,
      shippingDiscountAmount,
      baseShippingDiscountAmount,
      taxAmount,
      baseTaxAmount,
      weeeTaxAppliedAmount,
      shippingTaxAmount,
      baseShippingTaxAmount,
      subtotalInclTax,
      shippingInclTax,
      baseShippingInclTax,
      baseCurrencyCode,
      quoteCurrencyCode,
      itemsQty,
      items,
      totalSegments});

  Totals.fromJson(Map<String, dynamic> json) {
    grandTotal = json['grand_total'];
    baseGrandTotal = json['base_grand_total'];
    subtotal = json['subtotal'];
    baseSubtotal = json['base_subtotal'];
    discountAmount = json['discount_amount'];
    baseDiscountAmount = json['base_discount_amount'];
    subtotalWithDiscount = json['subtotal_with_discount'];
    baseSubtotalWithDiscount = json['base_subtotal_with_discount'];
    shippingAmount = json['shipping_amount'];
    baseShippingAmount = json['base_shipping_amount'];
    shippingDiscountAmount = json['shipping_discount_amount'];
    baseShippingDiscountAmount = json['base_shipping_discount_amount'];
    taxAmount = json['tax_amount'];
    baseTaxAmount = json['base_tax_amount'];
    weeeTaxAppliedAmount = json['weee_tax_applied_amount'];
    shippingTaxAmount = json['shipping_tax_amount'];
    baseShippingTaxAmount = json['base_shipping_tax_amount'];
    subtotalInclTax = json['subtotal_incl_tax'];
    shippingInclTax = json['shipping_incl_tax'];
    baseShippingInclTax = json['base_shipping_incl_tax'];
    baseCurrencyCode = json['base_currency_code'];
    quoteCurrencyCode = json['quote_currency_code'];
    itemsQty = json['items_qty'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    if (json['total_segments'] != null) {
      totalSegments = <TotalSegments>[];
      json['total_segments'].forEach((v) {
        totalSegments!.add(TotalSegments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['grand_total'] = grandTotal;
    data['base_grand_total'] = baseGrandTotal;
    data['subtotal'] = subtotal;
    data['base_subtotal'] = baseSubtotal;
    data['discount_amount'] = discountAmount;
    data['base_discount_amount'] = baseDiscountAmount;
    data['subtotal_with_discount'] = subtotalWithDiscount;
    data['base_subtotal_with_discount'] = baseSubtotalWithDiscount;
    data['shipping_amount'] = shippingAmount;
    data['base_shipping_amount'] = baseShippingAmount;
    data['shipping_discount_amount'] = shippingDiscountAmount;
    data['base_shipping_discount_amount'] = baseShippingDiscountAmount;
    data['tax_amount'] = taxAmount;
    data['base_tax_amount'] = baseTaxAmount;
    data['weee_tax_applied_amount'] = weeeTaxAppliedAmount;
    data['shipping_tax_amount'] = shippingTaxAmount;
    data['base_shipping_tax_amount'] = baseShippingTaxAmount;
    data['subtotal_incl_tax'] = subtotalInclTax;
    data['shipping_incl_tax'] = shippingInclTax;
    data['base_shipping_incl_tax'] = baseShippingInclTax;
    data['base_currency_code'] = baseCurrencyCode;
    data['quote_currency_code'] = quoteCurrencyCode;
    data['items_qty'] = itemsQty;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (totalSegments != null) {
      data['total_segments'] = totalSegments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  dynamic itemId;
  dynamic price;
  dynamic basePrice;
  dynamic qty;
  dynamic rowTotal;
  dynamic baseRowTotal;
  dynamic rowTotalWithDiscount;
  dynamic taxAmount;
  dynamic baseTaxAmount;
  dynamic taxPercent;
  dynamic discountAmount;
  dynamic baseDiscountAmount;
  dynamic discountPercent;
  dynamic priceInclTax;
  dynamic basePriceInclTax;
  dynamic rowTotalInclTax;
  dynamic baseRowTotalInclTax;
  String? options;
  Null? weeeTaxAppliedAmount;
  Null? weeeTaxApplied;
  String? name;

  Items(
      {itemId,
      price,
      basePrice,
      qty,
      rowTotal,
      baseRowTotal,
      rowTotalWithDiscount,
      taxAmount,
      baseTaxAmount,
      taxPercent,
      discountAmount,
      baseDiscountAmount,
      discountPercent,
      priceInclTax,
      basePriceInclTax,
      rowTotalInclTax,
      baseRowTotalInclTax,
      options,
      weeeTaxAppliedAmount,
      weeeTaxApplied,
      name});

  Items.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    price = json['price'];
    basePrice = json['base_price'];
    qty = json['qty'];
    rowTotal = json['row_total'];
    baseRowTotal = json['base_row_total'];
    rowTotalWithDiscount = json['row_total_with_discount'];
    taxAmount = json['tax_amount'];
    baseTaxAmount = json['base_tax_amount'];
    taxPercent = json['tax_percent'];
    discountAmount = json['discount_amount'];
    baseDiscountAmount = json['base_discount_amount'];
    discountPercent = json['discount_percent'];
    priceInclTax = json['price_incl_tax'];
    basePriceInclTax = json['base_price_incl_tax'];
    rowTotalInclTax = json['row_total_incl_tax'];
    baseRowTotalInclTax = json['base_row_total_incl_tax'];
    options = json['options'];
    weeeTaxAppliedAmount = json['weee_tax_applied_amount'];
    weeeTaxApplied = json['weee_tax_applied'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['item_id'] = itemId;
    data['price'] = price;
    data['base_price'] = basePrice;
    data['qty'] = qty;
    data['row_total'] = rowTotal;
    data['base_row_total'] = baseRowTotal;
    data['row_total_with_discount'] = rowTotalWithDiscount;
    data['tax_amount'] = taxAmount;
    data['base_tax_amount'] = baseTaxAmount;
    data['tax_percent'] = taxPercent;
    data['discount_amount'] = discountAmount;
    data['base_discount_amount'] = baseDiscountAmount;
    data['discount_percent'] = discountPercent;
    data['price_incl_tax'] = priceInclTax;
    data['base_price_incl_tax'] = basePriceInclTax;
    data['row_total_incl_tax'] = rowTotalInclTax;
    data['base_row_total_incl_tax'] = baseRowTotalInclTax;
    data['options'] = options;
    data['weee_tax_applied_amount'] = weeeTaxAppliedAmount;
    data['weee_tax_applied'] = weeeTaxApplied;
    data['name'] = name;
    return data;
  }
}

class TotalSegments {
  String? code;
  String? title;
  dynamic value;
  String? area;

  TotalSegments({code, title, value, area});

  TotalSegments.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    title = json['title'];
    value = json['value'];
    area = json['area'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['title'] = title;
    data['value'] = value;
    data['area'] = area;
    return data;
  }
}
