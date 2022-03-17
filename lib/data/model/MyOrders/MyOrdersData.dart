// To parse this JSON data, do
//
//     final myOrdersData = myOrdersDataFromJson(jsonString);

import 'dart:convert';

MyOrdersData myOrdersDataFromJson(String str) => MyOrdersData.fromJson(json.decode(str));

String myOrdersDataToJson(MyOrdersData data) => json.encode(data.toJson());

class MyOrdersData {
  MyOrdersData({
    this.items,
    this.searchCriteria,
    this.totalCount,
  });

  List<MyOrdersDataItem>? items;
  SearchCriteria? searchCriteria;
  int? totalCount;

  factory MyOrdersData.fromJson(Map<String, dynamic> json) => MyOrdersData(
    items: List<MyOrdersDataItem>.from(json["items"].map((x) => MyOrdersDataItem.fromJson(x))),
    searchCriteria: SearchCriteria.fromJson(json["search_criteria"]),
    totalCount: json["total_count"],
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items!.map((x) => x.toJson())),
    "search_criteria": searchCriteria?.toJson(),
    "total_count": totalCount,
  };
}

class MyOrdersDataItem {
  MyOrdersDataItem({
    this.baseCurrencyCode,
    this.baseDiscountAmount,
    this.baseGrandTotal,
    this.baseShippingAmount,
    this.baseSubtotal,
    this.baseTaxAmount,
    this.baseTotalDue,
    this.billingAddressId,
    this.couponCode,
    this.createdAt,
    this.customerEmail,
    this.customerFirstname,
    this.customerGroupId,
    this.customerIsGuest,
    this.customerLastname,
    this.customerNoteNotify,
    this.discountAmount,
    this.discountDescription,
    this.emailSent,
    this.entityId,
    this.grandTotal,
    this.incrementId,
    this.isVirtual,
    this.orderCurrencyCode,
    this.protectCode,
    this.shippingAmount,
    this.shippingDescription,
    this.state,
    this.status,
    this.storeCurrencyCode,
    this.storeId,
    this.storeName,
    this.subtotal,
    this.subtotalInclTax,
    this.taxAmount,
    this.totalDue,
    this.totalItemCount,
    this.totalQtyOrdered,
    this.updatedAt,
    this.weight,
    this.items,
    this.billingAddress,
    this.payment,
    this.statusHistories,
    this.extensionAttributes,
    this.baseDiscountTaxCompensationAmount,
    this.baseShippingDiscountAmount,
    this.baseShippingDiscountTaxCompensationAmnt,
    this.baseShippingInclTax,
    this.baseShippingTaxAmount,
    this.baseSubtotalInclTax,
    this.baseToGlobalRate,
    this.baseToOrderRate,
    this.globalCurrencyCode,
    this.discountTaxCompensationAmount,
    this.quoteId,
    this.remoteIp,
    this.shippingDiscountAmount,
    this.shippingDiscountTaxCompensationAmount,
    this.shippingInclTax,
    this.shippingTaxAmount,
    this.storeToBaseRate,
    this.storeToOrderRate,
    this.xForwardedFor,
  });

  String? baseCurrencyCode;
  double? baseDiscountAmount;
  double? baseGrandTotal;
  int? baseShippingAmount;
  int? baseSubtotal;
  int? baseTaxAmount;
  double? baseTotalDue;
  int? billingAddressId;
  String? couponCode;
  DateTime? createdAt;
  String? customerEmail;
  String? customerFirstname;
  int? customerGroupId;
  int? customerIsGuest;
  String? customerLastname;
  int? customerNoteNotify;
  double? discountAmount;
  String? discountDescription;
  int? emailSent;
  int? entityId;
  double? grandTotal;
  String? incrementId;
  int? isVirtual;
  String? orderCurrencyCode;
  String? protectCode;
  int? shippingAmount;
  String? shippingDescription;
  String? state;
  String? status;
  String? storeCurrencyCode;
  int? storeId;
  String? storeName;
  int? subtotal;
  int? subtotalInclTax;
  int? taxAmount;
  double? totalDue;
  int? totalItemCount;
  int? totalQtyOrdered;
  DateTime? updatedAt;
  int? weight;
  List<ParentItemElement>? items;
  Address? billingAddress;
  Payment? payment;
  List<dynamic>? statusHistories;
  ItemExtensionAttributes? extensionAttributes;
  int? baseDiscountTaxCompensationAmount;
  int? baseShippingDiscountAmount;
  int? baseShippingDiscountTaxCompensationAmnt;
  int? baseShippingInclTax;
  int? baseShippingTaxAmount;
  int? baseSubtotalInclTax;
  int? baseToGlobalRate;
  double? baseToOrderRate;
  String? globalCurrencyCode;
  int? discountTaxCompensationAmount;
  int? quoteId;
  String? remoteIp;
  int? shippingDiscountAmount;
  int? shippingDiscountTaxCompensationAmount;
  int? shippingInclTax;
  int? shippingTaxAmount;
  int? storeToBaseRate;
  int? storeToOrderRate;
  String? xForwardedFor;

  factory MyOrdersDataItem.fromJson(Map<String, dynamic> json) => MyOrdersDataItem(
    baseCurrencyCode: json["base_currency_code"],
    baseDiscountAmount: json["base_discount_amount"].toDouble(),
    baseGrandTotal: json["base_grand_total"].toDouble(),
    baseShippingAmount: json["base_shipping_amount"],
    baseSubtotal: json["base_subtotal"],
    baseTaxAmount: json["base_tax_amount"],
    baseTotalDue: json["base_total_due"].toDouble(),
    billingAddressId: json["billing_address_id"],
    couponCode: json["coupon_code"] == null ? null : json["coupon_code"],
    createdAt: DateTime.parse(json["created_at"]),
    customerEmail: json["customer_email"],
    customerFirstname: json["customer_firstname"],
    customerGroupId: json["customer_group_id"],
    customerIsGuest: json["customer_is_guest"],
    customerLastname: json["customer_lastname"],
    customerNoteNotify: json["customer_note_notify"],
    discountAmount: json["discount_amount"].toDouble(),
    discountDescription: json["discount_description"] == null ? null : json["discount_description"],
    emailSent: json["email_sent"],
    entityId: json["entity_id"],
    grandTotal: json["grand_total"].toDouble(),
    incrementId: json["increment_id"],
    isVirtual: json["is_virtual"],
    orderCurrencyCode: json["order_currency_code"],
    protectCode: json["protect_code"],
    shippingAmount: json["shipping_amount"],
    shippingDescription: json["shipping_description"],
    state: json["state"],
    status: json["status"],
    storeCurrencyCode: json["store_currency_code"],
    storeId: json["store_id"],
    storeName: json["store_name"],
    subtotal: json["subtotal"],
    subtotalInclTax: json["subtotal_incl_tax"],
    taxAmount: json["tax_amount"],
    totalDue: json["total_due"].toDouble(),
    totalItemCount: json["total_item_count"],
    totalQtyOrdered: json["total_qty_ordered"],
    updatedAt: DateTime.parse(json["updated_at"]),
    weight: json["weight"],
    items: List<ParentItemElement>.from(json["items"].map((x) => ParentItemElement.fromJson(x))),
    billingAddress: Address.fromJson(json["billing_address"]),
    payment: Payment.fromJson(json["payment"]),
    statusHistories: List<dynamic>.from(json["status_histories"].map((x) => x)),
    extensionAttributes: ItemExtensionAttributes.fromJson(json["extension_attributes"]),
    baseDiscountTaxCompensationAmount: json["base_discount_tax_compensation_amount"] == null ? null : json["base_discount_tax_compensation_amount"],
    baseShippingDiscountAmount: json["base_shipping_discount_amount"] == null ? null : json["base_shipping_discount_amount"],
    baseShippingDiscountTaxCompensationAmnt: json["base_shipping_discount_tax_compensation_amnt"] == null ? null : json["base_shipping_discount_tax_compensation_amnt"],
    baseShippingInclTax: json["base_shipping_incl_tax"] == null ? null : json["base_shipping_incl_tax"],
    baseShippingTaxAmount: json["base_shipping_tax_amount"] == null ? null : json["base_shipping_tax_amount"],
    baseSubtotalInclTax: json["base_subtotal_incl_tax"] == null ? null : json["base_subtotal_incl_tax"],
    baseToGlobalRate: json["base_to_global_rate"] == null ? null : json["base_to_global_rate"],
    baseToOrderRate: json["base_to_order_rate"] == null ? null : json["base_to_order_rate"].toDouble(),
    globalCurrencyCode: json["global_currency_code"] == null ? null : json["global_currency_code"],
    discountTaxCompensationAmount: json["discount_tax_compensation_amount"] == null ? null : json["discount_tax_compensation_amount"],
    quoteId: json["quote_id"] == null ? null : json["quote_id"],
    remoteIp: json["remote_ip"] == null ? null : json["remote_ip"],
    shippingDiscountAmount: json["shipping_discount_amount"] == null ? null : json["shipping_discount_amount"],
    shippingDiscountTaxCompensationAmount: json["shipping_discount_tax_compensation_amount"] == null ? null : json["shipping_discount_tax_compensation_amount"],
    shippingInclTax: json["shipping_incl_tax"] == null ? null : json["shipping_incl_tax"],
    shippingTaxAmount: json["shipping_tax_amount"] == null ? null : json["shipping_tax_amount"],
    storeToBaseRate: json["store_to_base_rate"] == null ? null : json["store_to_base_rate"],
    storeToOrderRate: json["store_to_order_rate"] == null ? null : json["store_to_order_rate"],
    xForwardedFor: json["x_forwarded_for"] == null ? null : json["x_forwarded_for"],
  );

  Map<String, dynamic> toJson() => {
    "base_currency_code": baseCurrencyCode,
    "base_discount_amount": baseDiscountAmount,
    "base_grand_total": baseGrandTotal,
    "base_shipping_amount": baseShippingAmount,
    "base_subtotal": baseSubtotal,
    "base_tax_amount": baseTaxAmount,
    "base_total_due": baseTotalDue,
    "billing_address_id": billingAddressId,
    "coupon_code": couponCode == null ? null : couponCode,
    "created_at": createdAt?.toIso8601String(),
    "customer_email": customerEmail,
    "customer_firstname": customerFirstname,
    "customer_group_id": customerGroupId,
    "customer_is_guest": customerIsGuest,
    "customer_lastname": customerLastname,
    "customer_note_notify": customerNoteNotify,
    "discount_amount": discountAmount,
    "discount_description": discountDescription == null ? null : discountDescription,
    "email_sent": emailSent,
    "entity_id": entityId,
    "grand_total": grandTotal,
    "increment_id": incrementId,
    "is_virtual": isVirtual,
    "order_currency_code": orderCurrencyCode,
    "protect_code": protectCode,
    "shipping_amount": shippingAmount,
    "shipping_description": shippingDescription,
    "state": state,
    "status": status,
    "store_currency_code": storeCurrencyCode,
    "store_id": storeId,
    "store_name": storeName,
    "subtotal": subtotal,
    "subtotal_incl_tax": subtotalInclTax,
    "tax_amount": taxAmount,
    "total_due": totalDue,
    "total_item_count": totalItemCount,
    "total_qty_ordered": totalQtyOrdered,
    "updated_at": updatedAt?.toIso8601String(),
    "weight": weight,
    "items": List<dynamic>.from(items!.map((x) => x.toJson())),
    "billing_address": billingAddress?.toJson(),
    "payment": payment?.toJson(),
    "status_histories": List<dynamic>.from(statusHistories!.map((x) => x)),
    "extension_attributes": extensionAttributes?.toJson(),
    "base_discount_tax_compensation_amount": baseDiscountTaxCompensationAmount == null ? null : baseDiscountTaxCompensationAmount,
    "base_shipping_discount_amount": baseShippingDiscountAmount == null ? null : baseShippingDiscountAmount,
    "base_shipping_discount_tax_compensation_amnt": baseShippingDiscountTaxCompensationAmnt == null ? null : baseShippingDiscountTaxCompensationAmnt,
    "base_shipping_incl_tax": baseShippingInclTax == null ? null : baseShippingInclTax,
    "base_shipping_tax_amount": baseShippingTaxAmount == null ? null : baseShippingTaxAmount,
    "base_subtotal_incl_tax": baseSubtotalInclTax == null ? null : baseSubtotalInclTax,
    "base_to_global_rate": baseToGlobalRate == null ? null : baseToGlobalRate,
    "base_to_order_rate": baseToOrderRate == null ? null : baseToOrderRate,
    "global_currency_code": globalCurrencyCode == null ? null : globalCurrencyCode,
    "discount_tax_compensation_amount": discountTaxCompensationAmount == null ? null : discountTaxCompensationAmount,
    "quote_id": quoteId == null ? null : quoteId,
    "remote_ip": remoteIp == null ? null : remoteIp,
    "shipping_discount_amount": shippingDiscountAmount == null ? null : shippingDiscountAmount,
    "shipping_discount_tax_compensation_amount": shippingDiscountTaxCompensationAmount == null ? null : shippingDiscountTaxCompensationAmount,
    "shipping_incl_tax": shippingInclTax == null ? null : shippingInclTax,
    "shipping_tax_amount": shippingTaxAmount == null ? null : shippingTaxAmount,
    "store_to_base_rate": storeToBaseRate == null ? null : storeToBaseRate,
    "store_to_order_rate": storeToOrderRate == null ? null : storeToOrderRate,
    "x_forwarded_for": xForwardedFor == null ? null : xForwardedFor,
  };
}

class Address {
  Address({
    this.addressType,
    this.city,
    this.company,
    this.countryId,
    this.email,
    this.entityId,
    this.firstname,
    this.lastname,
    this.parentId,
    this.postcode,
    this.region,
    this.regionCode,
    this.regionId,
    this.street,
    this.telephone,
  });

  String? addressType;
  String? city;
  String? company;
  String? countryId;
  String? email;
  int? entityId;
  String? firstname;
  String? lastname;
  int? parentId;
  String? postcode;
  String? region;
  String? regionCode;
  int? regionId;
  List<String>? street;
  String? telephone;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    addressType: json["address_type"],
    city: json["city"],
    company: json["company"] == null ? null : json["company"],
    countryId: json["country_id"],
    email: json["email"],
    entityId: json["entity_id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    parentId: json["parent_id"],
    postcode: json["postcode"],
    region: json["region"],
    regionCode: json["region_code"],
    regionId: json["region_id"],
    street: List<String>.from(json["street"].map((x) => x)),
    telephone: json["telephone"],
  );

  Map<String, dynamic> toJson() => {
    "address_type": addressType,
    "city": city,
    "company": company == null ? null : company,
    "country_id": countryId,
    "email": email,
    "entity_id": entityId,
    "firstname": firstname,
    "lastname": lastname,
    "parent_id": parentId,
    "postcode": postcode,
    "region": region,
    "region_code": regionCode,
    "region_id": regionId,
    "street": List<dynamic>.from(street!.map((x) => x)),
    "telephone": telephone,
  };
}

class ItemExtensionAttributes {
  ItemExtensionAttributes({
    this.shippingAssignments,
    this.paymentAdditionalInfo,
    this.appliedTaxes,
    this.itemAppliedTaxes,
    this.paymentMethod,
    this.credits,
  });

  List<ShippingAssignment>? shippingAssignments;
  List<PaymentAdditionalInfo>? paymentAdditionalInfo;
  List<dynamic>? appliedTaxes;
  List<dynamic>? itemAppliedTaxes;
  String? paymentMethod;
  Map<String, int>? credits;

  factory ItemExtensionAttributes.fromJson(Map<String, dynamic> json) => ItemExtensionAttributes(
    shippingAssignments: List<ShippingAssignment>.from(json["shipping_assignments"].map((x) => ShippingAssignment.fromJson(x))),
    paymentAdditionalInfo: List<PaymentAdditionalInfo>.from(json["payment_additional_info"].map((x) => PaymentAdditionalInfo.fromJson(x))),
    appliedTaxes: List<dynamic>.from(json["applied_taxes"].map((x) => x)),
    itemAppliedTaxes: List<dynamic>.from(json["item_applied_taxes"].map((x) => x)),
    paymentMethod: json["payment_method"],
    credits: Map.from(json["credits"]).map((k, v) => MapEntry<String, int>(k, v == null ? null : v)),
  );

  Map<String, dynamic> toJson() => {
    "shipping_assignments": List<dynamic>.from(shippingAssignments!.map((x) => x.toJson())),
    "payment_additional_info": List<dynamic>.from(paymentAdditionalInfo!.map((x) => x.toJson())),
    "applied_taxes": List<dynamic>.from(appliedTaxes!.map((x) => x)),
    "item_applied_taxes": List<dynamic>.from(itemAppliedTaxes!.map((x) => x)),
    "payment_method": paymentMethod,
    "credits": Map.from(credits!).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)),
  };
}

class PaymentAdditionalInfo {
  PaymentAdditionalInfo({
    this.key,
    this.value,
  });

  String? key;
  String? value;

  factory PaymentAdditionalInfo.fromJson(Map<String, dynamic> json) => PaymentAdditionalInfo(
    key: json["key"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "value": value,
  };
}

class ShippingAssignment {
  ShippingAssignment({
    this.shipping,
    this.items,
  });

  Shipping? shipping;
  List<ParentItemElement>? items;

  factory ShippingAssignment.fromJson(Map<String, dynamic> json) => ShippingAssignment(
    shipping: Shipping.fromJson(json["shipping"]),
    items: List<ParentItemElement>.from(json["items"].map((x) => ParentItemElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "shipping": shipping?.toJson(),
    "items": List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class ParentItemElement {
  ParentItemElement({
    this.amountRefunded,
    this.baseAmountRefunded,
    this.baseCost,
    this.baseDiscountAmount,
    this.baseDiscountInvoiced,
    this.baseOriginalPrice,
    this.basePrice,
    this.basePriceInclTax,
    this.baseRowInvoiced,
    this.baseRowTotal,
    this.baseTaxAmount,
    this.baseTaxInvoiced,
    this.createdAt,
    this.discountAmount,
    this.discountInvoiced,
    this.discountPercent,
    this.freeShipping,
    this.isVirtual,
    this.itemId,
    this.name,
    this.noDiscount,
    this.orderId,
    this.originalPrice,
    this.price,
    this.priceInclTax,
    this.productId,
    this.productType,
    this.qtyBackordered,
    this.qtyCanceled,
    this.qtyInvoiced,
    this.qtyOrdered,
    this.qtyRefunded,
    this.qtyShipped,
    this.rowInvoiced,
    this.rowTotal,
    this.rowTotalInclTax,
    this.rowWeight,
    this.sku,
    this.storeId,
    this.taxAmount,
    this.taxInvoiced,
    this.taxPercent,
    this.updatedAt,
    this.weight,
    this.baseRowTotalInclTax,
    this.baseDiscountTaxCompensationAmount,
    this.discountTaxCompensationAmount,
    this.isQtyDecimal,
    this.quoteItemId,
    this.productOption,
    this.parentItemId,
    this.parentItem,
  });

  int? amountRefunded;
  int? baseAmountRefunded;
  int? baseCost;
  double? baseDiscountAmount;
  int? baseDiscountInvoiced;
  int? baseOriginalPrice;
  int? basePrice;
  int? basePriceInclTax;
  int? baseRowInvoiced;
  double? baseRowTotal;
  int? baseTaxAmount;
  int? baseTaxInvoiced;
  DateTime? createdAt;
  double? discountAmount;
  int? discountInvoiced;
  int? discountPercent;
  int? freeShipping;
  int? isVirtual;
  int? itemId;
  String? name;
  int? noDiscount;
  int? orderId;
  int? originalPrice;
  int? price;
  int? priceInclTax;
  int? productId;
  String? productType;
  int? qtyBackordered;
  int? qtyCanceled;
  int? qtyInvoiced;
  int? qtyOrdered;
  int? qtyRefunded;
  int? qtyShipped;
  int? rowInvoiced;
  double? rowTotal;
  double? rowTotalInclTax;
  int? rowWeight;
  String? sku;
  int? storeId;
  int? taxAmount;
  int? taxInvoiced;
  int? taxPercent;
  DateTime? updatedAt;
  int? weight;
  double? baseRowTotalInclTax;
  int? baseDiscountTaxCompensationAmount;
  int? discountTaxCompensationAmount;
  int? isQtyDecimal;
  int? quoteItemId;
  ProductOption? productOption;
  int? parentItemId;
  ParentItemElement? parentItem;

  factory ParentItemElement.fromJson(Map<String, dynamic> json) => ParentItemElement(
    amountRefunded: json["amount_refunded"],
    baseAmountRefunded: json["base_amount_refunded"],
    baseCost: json["base_cost"] == null ? null : json["base_cost"],
    baseDiscountAmount: json["base_discount_amount"].toDouble(),
    baseDiscountInvoiced: json["base_discount_invoiced"],
    baseOriginalPrice: json["base_original_price"] == null ? null : json["base_original_price"],
    basePrice: json["base_price"],
    basePriceInclTax: json["base_price_incl_tax"] == null ? null : json["base_price_incl_tax"],
    baseRowInvoiced: json["base_row_invoiced"],
    baseRowTotal: json["base_row_total"].toDouble(),
    baseTaxAmount: json["base_tax_amount"],
    baseTaxInvoiced: json["base_tax_invoiced"],
    createdAt: DateTime.parse(json["created_at"]),
    discountAmount: json["discount_amount"].toDouble(),
    discountInvoiced: json["discount_invoiced"],
    discountPercent: json["discount_percent"],
    freeShipping: json["free_shipping"],
    isVirtual: json["is_virtual"],
    itemId: json["item_id"],
    name: json["name"],
    noDiscount: json["no_discount"],
    orderId: json["order_id"],
    originalPrice: json["original_price"],
    price: json["price"],
    priceInclTax: json["price_incl_tax"] == null ? null : json["price_incl_tax"],
    productId: json["product_id"],
    productType: json["product_type"],
    qtyBackordered: json["qty_backordered"] == null ? null : json["qty_backordered"],
    qtyCanceled: json["qty_canceled"],
    qtyInvoiced: json["qty_invoiced"],
    qtyOrdered: json["qty_ordered"],
    qtyRefunded: json["qty_refunded"],
    qtyShipped: json["qty_shipped"],
    rowInvoiced: json["row_invoiced"],
    rowTotal: json["row_total"].toDouble(),
    rowTotalInclTax: json["row_total_incl_tax"].toDouble(),
    rowWeight: json["row_weight"],
    sku: json["sku"],
    storeId: json["store_id"],
    taxAmount: json["tax_amount"],
    taxInvoiced: json["tax_invoiced"],
    taxPercent: json["tax_percent"],
    updatedAt: DateTime.parse(json["updated_at"]),
    weight: json["weight"],
    baseRowTotalInclTax: json["base_row_total_incl_tax"].toDouble(),
    baseDiscountTaxCompensationAmount: json["base_discount_tax_compensation_amount"] == null ? null : json["base_discount_tax_compensation_amount"],
    discountTaxCompensationAmount: json["discount_tax_compensation_amount"] == null ? null : json["discount_tax_compensation_amount"],
    isQtyDecimal: json["is_qty_decimal"] == null ? null : json["is_qty_decimal"],
    quoteItemId: json["quote_item_id"] == null ? null : json["quote_item_id"],
    productOption: json["product_option"] == null ? null : ProductOption.fromJson(json["product_option"]),
    parentItemId: json["parent_item_id"] == null ? null : json["parent_item_id"],
    parentItem: json["parent_item"] == null ? null : ParentItemElement.fromJson(json["parent_item"]),
  );

  Map<String, dynamic> toJson() => {
    "amount_refunded": amountRefunded,
    "base_amount_refunded": baseAmountRefunded,
    "base_cost": baseCost == null ? null : baseCost,
    "base_discount_amount": baseDiscountAmount,
    "base_discount_invoiced": baseDiscountInvoiced,
    "base_original_price": baseOriginalPrice == null ? null : baseOriginalPrice,
    "base_price": basePrice,
    "base_price_incl_tax": basePriceInclTax == null ? null : basePriceInclTax,
    "base_row_invoiced": baseRowInvoiced,
    "base_row_total": baseRowTotal,
    "base_tax_amount": baseTaxAmount,
    "base_tax_invoiced": baseTaxInvoiced,
    "created_at": createdAt?.toIso8601String(),
    "discount_amount": discountAmount,
    "discount_invoiced": discountInvoiced,
    "discount_percent": discountPercent,
    "free_shipping": freeShipping,
    "is_virtual": isVirtual,
    "item_id": itemId,
    "name": name,
    "no_discount": noDiscount,
    "order_id": orderId,
    "original_price": originalPrice,
    "price": price,
    "price_incl_tax": priceInclTax == null ? null : priceInclTax,
    "product_id": productId,
    "product_type": productType,
    "qty_backordered": qtyBackordered == null ? null : qtyBackordered,
    "qty_canceled": qtyCanceled,
    "qty_invoiced": qtyInvoiced,
    "qty_ordered": qtyOrdered,
    "qty_refunded": qtyRefunded,
    "qty_shipped": qtyShipped,
    "row_invoiced": rowInvoiced,
    "row_total": rowTotal,
    "row_total_incl_tax": rowTotalInclTax,
    "row_weight": rowWeight,
    "sku": sku,
    "store_id": storeId,
    "tax_amount": taxAmount,
    "tax_invoiced": taxInvoiced,
    "tax_percent": taxPercent,
    "updated_at": updatedAt?.toIso8601String(),
    "weight": weight,
    "base_row_total_incl_tax": baseRowTotalInclTax,
    "base_discount_tax_compensation_amount": baseDiscountTaxCompensationAmount == null ? null : baseDiscountTaxCompensationAmount,
    "discount_tax_compensation_amount": discountTaxCompensationAmount == null ? null : discountTaxCompensationAmount,
    "is_qty_decimal": isQtyDecimal == null ? null : isQtyDecimal,
    "quote_item_id": quoteItemId == null ? null : quoteItemId,
    "product_option": productOption == null ? null : productOption?.toJson(),
    "parent_item_id": parentItemId == null ? null : parentItemId,
    "parent_item": parentItem == null ? null : parentItem?.toJson(),
  };
}

class ProductOption {
  ProductOption({
    this.extensionAttributes,
  });

  ProductOptionExtensionAttributes? extensionAttributes;

  factory ProductOption.fromJson(Map<String, dynamic> json) => ProductOption(
    extensionAttributes: ProductOptionExtensionAttributes.fromJson(json["extension_attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "extension_attributes": extensionAttributes?.toJson(),
  };
}

class ProductOptionExtensionAttributes {
  ProductOptionExtensionAttributes({
    this.configurableItemOptions,
  });

  List<ConfigurableItemOption>? configurableItemOptions;

  factory ProductOptionExtensionAttributes.fromJson(Map<String, dynamic> json) => ProductOptionExtensionAttributes(
    configurableItemOptions: List<ConfigurableItemOption>.from(json["configurable_item_options"].map((x) => ConfigurableItemOption.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "configurable_item_options": List<dynamic>.from(configurableItemOptions!.map((x) => x.toJson())),
  };
}

class ConfigurableItemOption {
  ConfigurableItemOption({
    this.optionId,
    this.optionValue,
  });

  String? optionId;
  int? optionValue;

  factory ConfigurableItemOption.fromJson(Map<String, dynamic> json) => ConfigurableItemOption(
    optionId: json["option_id"],
    optionValue: json["option_value"],
  );

  Map<String, dynamic> toJson() => {
    "option_id": optionId,
    "option_value": optionValue,
  };
}

class Shipping {
  Shipping({
    this.address,
    this.method,
    this.total,
  });

  Address? address;
  String? method;
  Total? total;

  factory Shipping.fromJson(Map<String, dynamic> json) => Shipping(
    address: Address.fromJson(json["address"]),
    method: json["method"],
    total: Total.fromJson(json["total"]),
  );

  Map<String, dynamic> toJson() => {
    "address": address?.toJson(),
    "method": method,
    "total": total?.toJson(),
  };
}

class Total {
  Total({
    this.baseShippingAmount,
    this.shippingAmount,
    this.baseShippingDiscountAmount,
    this.baseShippingDiscountTaxCompensationAmnt,
    this.baseShippingInclTax,
    this.baseShippingTaxAmount,
    this.shippingDiscountAmount,
    this.shippingDiscountTaxCompensationAmount,
    this.shippingInclTax,
    this.shippingTaxAmount,
  });

  int? baseShippingAmount;
  int? shippingAmount;
  int? baseShippingDiscountAmount;
  int? baseShippingDiscountTaxCompensationAmnt;
  int? baseShippingInclTax;
  int? baseShippingTaxAmount;
  int? shippingDiscountAmount;
  int? shippingDiscountTaxCompensationAmount;
  int? shippingInclTax;
  int? shippingTaxAmount;

  factory Total.fromJson(Map<String, dynamic> json) => Total(
    baseShippingAmount: json["base_shipping_amount"],
    shippingAmount: json["shipping_amount"],
    baseShippingDiscountAmount: json["base_shipping_discount_amount"] == null ? null : json["base_shipping_discount_amount"],
    baseShippingDiscountTaxCompensationAmnt: json["base_shipping_discount_tax_compensation_amnt"] == null ? null : json["base_shipping_discount_tax_compensation_amnt"],
    baseShippingInclTax: json["base_shipping_incl_tax"] == null ? null : json["base_shipping_incl_tax"],
    baseShippingTaxAmount: json["base_shipping_tax_amount"] == null ? null : json["base_shipping_tax_amount"],
    shippingDiscountAmount: json["shipping_discount_amount"] == null ? null : json["shipping_discount_amount"],
    shippingDiscountTaxCompensationAmount: json["shipping_discount_tax_compensation_amount"] == null ? null : json["shipping_discount_tax_compensation_amount"],
    shippingInclTax: json["shipping_incl_tax"] == null ? null : json["shipping_incl_tax"],
    shippingTaxAmount: json["shipping_tax_amount"] == null ? null : json["shipping_tax_amount"],
  );

  Map<String, dynamic> toJson() => {
    "base_shipping_amount": baseShippingAmount,
    "shipping_amount": shippingAmount,
    "base_shipping_discount_amount": baseShippingDiscountAmount == null ? null : baseShippingDiscountAmount,
    "base_shipping_discount_tax_compensation_amnt": baseShippingDiscountTaxCompensationAmnt == null ? null : baseShippingDiscountTaxCompensationAmnt,
    "base_shipping_incl_tax": baseShippingInclTax == null ? null : baseShippingInclTax,
    "base_shipping_tax_amount": baseShippingTaxAmount == null ? null : baseShippingTaxAmount,
    "shipping_discount_amount": shippingDiscountAmount == null ? null : shippingDiscountAmount,
    "shipping_discount_tax_compensation_amount": shippingDiscountTaxCompensationAmount == null ? null : shippingDiscountTaxCompensationAmount,
    "shipping_incl_tax": shippingInclTax == null ? null : shippingInclTax,
    "shipping_tax_amount": shippingTaxAmount == null ? null : shippingTaxAmount,
  };
}

class Payment {
  Payment({
    this.accountStatus,
    this.additionalData,
    this.additionalInformation,
    this.ccLast4,
    this.entityId,
    this.method,
    this.parentId,
    this.amountOrdered,
    this.baseAmountOrdered,
    this.baseShippingAmount,
    this.shippingAmount,
  });

  dynamic? accountStatus;
  String? additionalData;
  List<String>? additionalInformation;
  dynamic? ccLast4;
  int? entityId;
  String? method;
  int? parentId;
  int? amountOrdered;
  int? baseAmountOrdered;
  int? baseShippingAmount;
  int? shippingAmount;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    accountStatus: json["account_status"],
    additionalData: json["additional_data"] == null ? null : json["additional_data"],
    additionalInformation: List<String>.from(json["additional_information"].map((x) => x)),
    ccLast4: json["cc_last4"],
    entityId: json["entity_id"],
    method: json["method"],
    parentId: json["parent_id"],
    amountOrdered: json["amount_ordered"] == null ? null : json["amount_ordered"],
    baseAmountOrdered: json["base_amount_ordered"] == null ? null : json["base_amount_ordered"],
    baseShippingAmount: json["base_shipping_amount"] == null ? null : json["base_shipping_amount"],
    shippingAmount: json["shipping_amount"] == null ? null : json["shipping_amount"],
  );

  Map<String, dynamic> toJson() => {
    "account_status": accountStatus,
    "additional_data": additionalData == null ? null : additionalData,
    "additional_information": List<dynamic?>.from(additionalInformation!.map((x) => x)),
    "cc_last4": ccLast4,
    "entity_id": entityId,
    "method": method,
    "parent_id": parentId,
    "amount_ordered": amountOrdered == null ? null : amountOrdered,
    "base_amount_ordered": baseAmountOrdered == null ? null : baseAmountOrdered,
    "base_shipping_amount": baseShippingAmount == null ? null : baseShippingAmount,
    "shipping_amount": shippingAmount == null ? null : shippingAmount,
  };
}

class SearchCriteria {
  SearchCriteria({
    this.filterGroups,
  });

  List<FilterGroup>? filterGroups;

  factory SearchCriteria.fromJson(Map<String, dynamic> json) => SearchCriteria(
    filterGroups: List<FilterGroup>.from(json["filter_groups"].map((x) => FilterGroup.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "filter_groups": List<dynamic>.from(filterGroups!.map((x) => x.toJson())),
  };
}

class FilterGroup {
  FilterGroup({
    this.filters,
  });

  List<Filter>? filters;

  factory FilterGroup.fromJson(Map<String, dynamic> json) => FilterGroup(
    filters: List<Filter>.from(json["filters"].map((x) => Filter.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "filters": List<dynamic>.from(filters!.map((x) => x.toJson())),
  };
}

class Filter {
  Filter({
    this.field,
    this.value,
    this.conditionType,
  });

  String? field;
  String? value;
  String? conditionType;

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
    field: json["field"],
    value: json["value"],
    conditionType: json["condition_type"],
  );

  Map<String, dynamic> toJson() => {
    "field": field,
    "value": value,
    "condition_type": conditionType,
  };
}
