import 'dart:convert';

List<MyOrdersData> myOrdersDataFromJson(String str) => List<MyOrdersData>.from(
    json.decode(str).map((x) => MyOrdersData.fromJson(x)));

String myOrdersDataToJson(List<MyOrdersData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyOrdersData {
  MyOrdersData({
    required this.amountRefunded,
    required this.baseAmountRefunded,
    required this.baseDiscountAmount,
    required this.baseDiscountInvoiced,
    required this.baseDiscountTaxCompensationAmount,
    required this.baseDiscountTaxCompensationInvoiced,
    required this.baseOriginalPrice,
    required this.basePrice,
    required this.basePriceInclTax,
    required this.baseRowInvoiced,
    required this.baseRowTotal,
    required this.baseRowTotalInclTax,
    required this.baseTaxAmount,
    required this.baseTaxInvoiced,
    required this.createdAt,
    required this.discountAmount,
    required this.discountInvoiced,
    required this.discountPercent,
    required this.freeShipping,
    required this.discountTaxCompensationAmount,
    required this.discountTaxCompensationInvoiced,
    required this.isQtyDecimal,
    required this.isVirtual,
    required this.itemId,
    required this.name,
    required this.noDiscount,
    required this.orderId,
    required this.originalPrice,
    required this.price,
    required this.priceInclTax,
    required this.productId,
    required this.productType,
    required this.qtyCanceled,
    required this.qtyInvoiced,
    required this.qtyOrdered,
    required this.qtyRefunded,
    required this.qtyShipped,
    required this.quoteItemId,
    required this.rowInvoiced,
    required this.rowTotal,
    required this.rowTotalInclTax,
    required this.rowWeight,
    required this.sku,
    required this.storeId,
    required this.taxAmount,
    required this.taxInvoiced,
    required this.taxPercent,
    required this.updatedAt,
    required this.weeeTaxApplied,
    required this.weight,
  });

  int amountRefunded;
  int baseAmountRefunded;
  int baseDiscountAmount;
  int baseDiscountInvoiced;
  int baseDiscountTaxCompensationAmount;
  int baseDiscountTaxCompensationInvoiced;
  int baseOriginalPrice;
  int basePrice;
  int basePriceInclTax;
  int baseRowInvoiced;
  int baseRowTotal;
  int baseRowTotalInclTax;
  int baseTaxAmount;
  int baseTaxInvoiced;
  DateTime createdAt;
  int discountAmount;
  int discountInvoiced;
  int discountPercent;
  int freeShipping;
  int discountTaxCompensationAmount;
  int discountTaxCompensationInvoiced;
  int isQtyDecimal;
  int isVirtual;
  int itemId;
  String name;
  int noDiscount;
  int orderId;
  int originalPrice;
  int price;
  int priceInclTax;
  int productId;
  String productType;
  int qtyCanceled;
  int qtyInvoiced;
  int qtyOrdered;
  int qtyRefunded;
  int qtyShipped;
  int quoteItemId;
  int rowInvoiced;
  int rowTotal;
  int rowTotalInclTax;
  int rowWeight;
  String sku;
  int storeId;
  int taxAmount;
  int taxInvoiced;
  int taxPercent;
  DateTime updatedAt;
  String weeeTaxApplied;
  int weight;

  factory MyOrdersData.fromJson(Map<String, dynamic> json) => MyOrdersData(
        amountRefunded: json["amount_refunded"],
        baseAmountRefunded: json["base_amount_refunded"],
        baseDiscountAmount: json["base_discount_amount"],
        baseDiscountInvoiced: json["base_discount_invoiced"],
        baseDiscountTaxCompensationAmount:
            json["base_discount_tax_compensation_amount"],
        baseDiscountTaxCompensationInvoiced:
            json["base_discount_tax_compensation_invoiced"],
        baseOriginalPrice: json["base_original_price"],
        basePrice: json["base_price"],
        basePriceInclTax: json["base_price_incl_tax"],
        baseRowInvoiced: json["base_row_invoiced"],
        baseRowTotal: json["base_row_total"],
        baseRowTotalInclTax: json["base_row_total_incl_tax"],
        baseTaxAmount: json["base_tax_amount"],
        baseTaxInvoiced: json["base_tax_invoiced"],
        createdAt: DateTime.parse(json["created_at"]),
        discountAmount: json["discount_amount"],
        discountInvoiced: json["discount_invoiced"],
        discountPercent: json["discount_percent"],
        freeShipping: json["free_shipping"],
        discountTaxCompensationAmount: json["discount_tax_compensation_amount"],
        discountTaxCompensationInvoiced:
            json["discount_tax_compensation_invoiced"],
        isQtyDecimal: json["is_qty_decimal"],
        isVirtual: json["is_virtual"],
        itemId: json["item_id"],
        name: json["name"],
        noDiscount: json["no_discount"],
        orderId: json["order_id"],
        originalPrice: json["original_price"],
        price: json["price"],
        priceInclTax: json["price_incl_tax"],
        productId: json["product_id"],
        productType: json["product_type"],
        qtyCanceled: json["qty_canceled"],
        qtyInvoiced: json["qty_invoiced"],
        qtyOrdered: json["qty_ordered"],
        qtyRefunded: json["qty_refunded"],
        qtyShipped: json["qty_shipped"],
        quoteItemId: json["quote_item_id"],
        rowInvoiced: json["row_invoiced"],
        rowTotal: json["row_total"],
        rowTotalInclTax: json["row_total_incl_tax"],
        rowWeight: json["row_weight"],
        sku: json["sku"],
        storeId: json["store_id"],
        taxAmount: json["tax_amount"],
        taxInvoiced: json["tax_invoiced"],
        taxPercent: json["tax_percent"],
        updatedAt: DateTime.parse(json["updated_at"]),
        weeeTaxApplied: json["weee_tax_applied"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "amount_refunded": amountRefunded,
        "base_amount_refunded": baseAmountRefunded,
        "base_discount_amount": baseDiscountAmount,
        "base_discount_invoiced": baseDiscountInvoiced,
        "base_discount_tax_compensation_amount":
            baseDiscountTaxCompensationAmount,
        "base_discount_tax_compensation_invoiced":
            baseDiscountTaxCompensationInvoiced,
        "base_original_price": baseOriginalPrice,
        "base_price": basePrice,
        "base_price_incl_tax": basePriceInclTax,
        "base_row_invoiced": baseRowInvoiced,
        "base_row_total": baseRowTotal,
        "base_row_total_incl_tax": baseRowTotalInclTax,
        "base_tax_amount": baseTaxAmount,
        "base_tax_invoiced": baseTaxInvoiced,
        "created_at": createdAt.toIso8601String(),
        "discount_amount": discountAmount,
        "discount_invoiced": discountInvoiced,
        "discount_percent": discountPercent,
        "free_shipping": freeShipping,
        "discount_tax_compensation_amount": discountTaxCompensationAmount,
        "discount_tax_compensation_invoiced": discountTaxCompensationInvoiced,
        "is_qty_decimal": isQtyDecimal,
        "is_virtual": isVirtual,
        "item_id": itemId,
        "name": name,
        "no_discount": noDiscount,
        "order_id": orderId,
        "original_price": originalPrice,
        "price": price,
        "price_incl_tax": priceInclTax,
        "product_id": productId,
        "product_type": productType,
        "qty_canceled": qtyCanceled,
        "qty_invoiced": qtyInvoiced,
        "qty_ordered": qtyOrdered,
        "qty_refunded": qtyRefunded,
        "qty_shipped": qtyShipped,
        "quote_item_id": quoteItemId,
        "row_invoiced": rowInvoiced,
        "row_total": rowTotal,
        "row_total_incl_tax": rowTotalInclTax,
        "row_weight": rowWeight,
        "sku": sku,
        "store_id": storeId,
        "tax_amount": taxAmount,
        "tax_invoiced": taxInvoiced,
        "tax_percent": taxPercent,
        "updated_at": updatedAt.toIso8601String(),
        "weee_tax_applied": weeeTaxApplied,
        "weight": weight,
      };
}
