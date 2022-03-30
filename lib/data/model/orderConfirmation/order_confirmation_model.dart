import 'dart:convert';

class OrderConfirmationModel {
  final String? baseCurrencyCode;
  final int? baseDiscountAmount;
  final int? baseGrandTotal;
  final int? baseDiscountTaxCompensationAmount;
  final int? baseShippingAmount;
  final int? baseShippingDiscountAmount;
  final int? baseShippingDiscountTaxCompensationAmnt;
  final int? baseShippingInclTax;
  final int? baseShippingTaxAmount;
  final int? baseSubtotal;
  final int? baseSubtotalInclTax;
  final int? baseTaxAmount;
  final int? baseTotalDue;
  final int? baseToGlobalRate;
  final int? baseToOrderRate;
  final int? billingAddressId;
  final String? createdAt;
  final String? customerDob;
  final String? customerEmail;
  final String? customerFirstname;
  final int? customerGroupId;
  final int? customerIsGuest;
  final String? customerLastname;
  final int? customerNoteNotify;
  final int? discountAmount;
  final int? emailSent;
  final int? entityId;
  final String? globalCurrencyCode;
  final int? grandTotal;
  final int? discountTaxCompensationAmount;
  final String? incrementId;
  final int? isVirtual;
  final String? orderCurrencyCode;
  final String? protectCode;
  final int? quoteId;
  final String? remoteIp;
  final int? shippingAmount;
  final int? shippingDiscountAmount;
  final int? shippingDiscountTaxCompensationAmount;
  final int? shippingInclTax;
  final int? shippingTaxAmount;
  final String? state;
  final String? status;
  final String? storeCurrencyCode;
  final int? storeId;
  final String? storeName;
  final int? storeToBaseRate;
  final int? storeToOrderRate;
  final int? subtotal;
  final int? subtotalInclTax;
  final int? taxAmount;
  final int? totalDue;
  final int? totalItemCount;
  final int? totalQtyOrdered;
  final String? updatedAt;
  final int? weight;
  final String? xForwardedFor;
  final List<Items>? items;
  final BillingAddress? billingAddress;
  final Payment? payment;
  final List<dynamic>? statusHistories;
  final ExtensionAttributes? extensionAttributes;

  OrderConfirmationModel({
    this.baseCurrencyCode,
    this.baseDiscountAmount,
    this.baseGrandTotal,
    this.baseDiscountTaxCompensationAmount,
    this.baseShippingAmount,
    this.baseShippingDiscountAmount,
    this.baseShippingDiscountTaxCompensationAmnt,
    this.baseShippingInclTax,
    this.baseShippingTaxAmount,
    this.baseSubtotal,
    this.baseSubtotalInclTax,
    this.baseTaxAmount,
    this.baseTotalDue,
    this.baseToGlobalRate,
    this.baseToOrderRate,
    this.billingAddressId,
    this.createdAt,
    this.customerDob,
    this.customerEmail,
    this.customerFirstname,
    this.customerGroupId,
    this.customerIsGuest,
    this.customerLastname,
    this.customerNoteNotify,
    this.discountAmount,
    this.emailSent,
    this.entityId,
    this.globalCurrencyCode,
    this.grandTotal,
    this.discountTaxCompensationAmount,
    this.incrementId,
    this.isVirtual,
    this.orderCurrencyCode,
    this.protectCode,
    this.quoteId,
    this.remoteIp,
    this.shippingAmount,
    this.shippingDiscountAmount,
    this.shippingDiscountTaxCompensationAmount,
    this.shippingInclTax,
    this.shippingTaxAmount,
    this.state,
    this.status,
    this.storeCurrencyCode,
    this.storeId,
    this.storeName,
    this.storeToBaseRate,
    this.storeToOrderRate,
    this.subtotal,
    this.subtotalInclTax,
    this.taxAmount,
    this.totalDue,
    this.totalItemCount,
    this.totalQtyOrdered,
    this.updatedAt,
    this.weight,
    this.xForwardedFor,
    this.items,
    this.billingAddress,
    this.payment,
    this.statusHistories,
    this.extensionAttributes,
  });

  OrderConfirmationModel.fromJson(Map<String, dynamic> json)
      : baseCurrencyCode = json['base_currency_code'] as String?,
        baseDiscountAmount = json['base_discount_amount'] as int?,
        baseGrandTotal = json['base_grand_total'] as int?,
        baseDiscountTaxCompensationAmount =
            json['base_discount_tax_compensation_amount'] as int?,
        baseShippingAmount = json['base_shipping_amount'] as int?,
        baseShippingDiscountAmount =
            json['base_shipping_discount_amount'] as int?,
        baseShippingDiscountTaxCompensationAmnt =
            json['base_shipping_discount_tax_compensation_amnt'] as int?,
        baseShippingInclTax = json['base_shipping_incl_tax'] as int?,
        baseShippingTaxAmount = json['base_shipping_tax_amount'] as int?,
        baseSubtotal = json['base_subtotal'] as int?,
        baseSubtotalInclTax = json['base_subtotal_incl_tax'] as int?,
        baseTaxAmount = json['base_tax_amount'] as int?,
        baseTotalDue = json['base_total_due'] as int?,
        baseToGlobalRate = json['base_to_global_rate'] as int?,
        baseToOrderRate = json['base_to_order_rate'] as int?,
        billingAddressId = json['billing_address_id'] as int?,
        createdAt = json['created_at'] as String?,
        customerDob = json['customer_dob'] as String?,
        customerEmail = json['customer_email'] as String?,
        customerFirstname = json['customer_firstname'] as String?,
        customerGroupId = json['customer_group_id'] as int?,
        customerIsGuest = json['customer_is_guest'] as int?,
        customerLastname = json['customer_lastname'] as String?,
        customerNoteNotify = json['customer_note_notify'] as int?,
        discountAmount = json['discount_amount'] as int?,
        emailSent = json['email_sent'] as int?,
        entityId = json['entity_id'] as int?,
        globalCurrencyCode = json['global_currency_code'] as String?,
        grandTotal = json['grand_total'] as int?,
        discountTaxCompensationAmount =
            json['discount_tax_compensation_amount'] as int?,
        incrementId = json['increment_id'] as String?,
        isVirtual = json['is_virtual'] as int?,
        orderCurrencyCode = json['order_currency_code'] as String?,
        protectCode = json['protect_code'] as String?,
        quoteId = json['quote_id'] as int?,
        remoteIp = json['remote_ip'] as String?,
        shippingAmount = json['shipping_amount'] as int?,
        shippingDiscountAmount = json['shipping_discount_amount'] as int?,
        shippingDiscountTaxCompensationAmount =
            json['shipping_discount_tax_compensation_amount'] as int?,
        shippingInclTax = json['shipping_incl_tax'] as int?,
        shippingTaxAmount = json['shipping_tax_amount'] as int?,
        state = json['state'] as String?,
        status = json['status'] as String?,
        storeCurrencyCode = json['store_currency_code'] as String?,
        storeId = json['store_id'] as int?,
        storeName = json['store_name'] as String?,
        storeToBaseRate = json['store_to_base_rate'] as int?,
        storeToOrderRate = json['store_to_order_rate'] as int?,
        subtotal = json['subtotal'] as int?,
        subtotalInclTax = json['subtotal_incl_tax'] as int?,
        taxAmount = json['tax_amount'] as int?,
        totalDue = json['total_due'] as int?,
        totalItemCount = json['total_item_count'] as int?,
        totalQtyOrdered = json['total_qty_ordered'] as int?,
        updatedAt = json['updated_at'] as String?,
        weight = json['weight'] as int?,
        xForwardedFor = json['x_forwarded_for'] as String?,
        items = (json['items'] as List?)
            ?.map((dynamic e) => Items.fromJson(e as Map<String, dynamic>))
            .toList(),
        billingAddress =
            (json['billing_address'] as Map<String, dynamic>?) != null
                ? BillingAddress.fromJson(
                    json['billing_address'] as Map<String, dynamic>)
                : null,
        payment = (json['payment'] as Map<String, dynamic>?) != null
            ? Payment.fromJson(json['payment'] as Map<String, dynamic>)
            : null,
        statusHistories = json['status_histories'] as List?,
        extensionAttributes =
            (json['extension_attributes'] as Map<String, dynamic>?) != null
                ? ExtensionAttributes.fromJson(
                    json['extension_attributes'] as Map<String, dynamic>)
                : null;

  Map<String, dynamic> toJson() => {
        'base_currency_code': baseCurrencyCode,
        'base_discount_amount': baseDiscountAmount,
        'base_grand_total': baseGrandTotal,
        'base_discount_tax_compensation_amount':
            baseDiscountTaxCompensationAmount,
        'base_shipping_amount': baseShippingAmount,
        'base_shipping_discount_amount': baseShippingDiscountAmount,
        'base_shipping_discount_tax_compensation_amnt':
            baseShippingDiscountTaxCompensationAmnt,
        'base_shipping_incl_tax': baseShippingInclTax,
        'base_shipping_tax_amount': baseShippingTaxAmount,
        'base_subtotal': baseSubtotal,
        'base_subtotal_incl_tax': baseSubtotalInclTax,
        'base_tax_amount': baseTaxAmount,
        'base_total_due': baseTotalDue,
        'base_to_global_rate': baseToGlobalRate,
        'base_to_order_rate': baseToOrderRate,
        'billing_address_id': billingAddressId,
        'created_at': createdAt,
        'customer_dob': customerDob,
        'customer_email': customerEmail,
        'customer_firstname': customerFirstname,
        'customer_group_id': customerGroupId,
        'customer_is_guest': customerIsGuest,
        'customer_lastname': customerLastname,
        'customer_note_notify': customerNoteNotify,
        'discount_amount': discountAmount,
        'email_sent': emailSent,
        'entity_id': entityId,
        'global_currency_code': globalCurrencyCode,
        'grand_total': grandTotal,
        'discount_tax_compensation_amount': discountTaxCompensationAmount,
        'increment_id': incrementId,
        'is_virtual': isVirtual,
        'order_currency_code': orderCurrencyCode,
        'protect_code': protectCode,
        'quote_id': quoteId,
        'remote_ip': remoteIp,
        'shipping_amount': shippingAmount,
        'shipping_discount_amount': shippingDiscountAmount,
        'shipping_discount_tax_compensation_amount':
            shippingDiscountTaxCompensationAmount,
        'shipping_incl_tax': shippingInclTax,
        'shipping_tax_amount': shippingTaxAmount,
        'state': state,
        'status': status,
        'store_currency_code': storeCurrencyCode,
        'store_id': storeId,
        'store_name': storeName,
        'store_to_base_rate': storeToBaseRate,
        'store_to_order_rate': storeToOrderRate,
        'subtotal': subtotal,
        'subtotal_incl_tax': subtotalInclTax,
        'tax_amount': taxAmount,
        'total_due': totalDue,
        'total_item_count': totalItemCount,
        'total_qty_ordered': totalQtyOrdered,
        'updated_at': updatedAt,
        'weight': weight,
        'x_forwarded_for': xForwardedFor,
        'items': items?.map((e) => e.toJson()).toList(),
        'billing_address': billingAddress?.toJson(),
        'payment': payment?.toJson(),
        'status_histories': statusHistories,
        'extension_attributes': extensionAttributes?.toJson()
      };
}

class Items {
  final int? amountRefunded;
  final int? baseAmountRefunded;
  final int? baseDiscountAmount;
  final int? baseDiscountInvoiced;
  final int? baseDiscountTaxCompensationAmount;
  final int? baseOriginalPrice;
  final int? basePrice;
  final int? basePriceInclTax;
  final int? baseRowInvoiced;
  final int? baseRowTotal;
  final int? baseRowTotalInclTax;
  final int? baseTaxAmount;
  final int? baseTaxInvoiced;
  final String? createdAt;
  final int? discountAmount;
  final int? discountInvoiced;
  final int? discountPercent;
  final int? freeShipping;
  final int? discountTaxCompensationAmount;
  final int? isQtyDecimal;
  final int? isVirtual;
  final int? itemId;
  final String? name;
  final int? noDiscount;
  final int? orderId;
  final int? originalPrice;
  final int? price;
  final int? priceInclTax;
  final int? productId;
  final String? productType;
  final int? qtyCanceled;
  final int? qtyInvoiced;
  final int? qtyOrdered;
  final int? qtyRefunded;
  final int? qtyShipped;
  final int? quoteItemId;
  final int? rowInvoiced;
  final int? rowTotal;
  final int? rowTotalInclTax;
  final int? rowWeight;
  final String? sku;
  final int? storeId;
  final int? taxAmount;
  final int? taxInvoiced;
  final int? taxPercent;
  final String? updatedAt;
  final ProductOption? productOption;

  Items({
    this.amountRefunded,
    this.baseAmountRefunded,
    this.baseDiscountAmount,
    this.baseDiscountInvoiced,
    this.baseDiscountTaxCompensationAmount,
    this.baseOriginalPrice,
    this.basePrice,
    this.basePriceInclTax,
    this.baseRowInvoiced,
    this.baseRowTotal,
    this.baseRowTotalInclTax,
    this.baseTaxAmount,
    this.baseTaxInvoiced,
    this.createdAt,
    this.discountAmount,
    this.discountInvoiced,
    this.discountPercent,
    this.freeShipping,
    this.discountTaxCompensationAmount,
    this.isQtyDecimal,
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
    this.qtyCanceled,
    this.qtyInvoiced,
    this.qtyOrdered,
    this.qtyRefunded,
    this.qtyShipped,
    this.quoteItemId,
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
    this.productOption,
  });

  Items.fromJson(Map<String, dynamic> json)
      : amountRefunded = json['amount_refunded'] as int?,
        baseAmountRefunded = json['base_amount_refunded'] as int?,
        baseDiscountAmount = json['base_discount_amount'] as int?,
        baseDiscountInvoiced = json['base_discount_invoiced'] as int?,
        baseDiscountTaxCompensationAmount =
            json['base_discount_tax_compensation_amount'] as int?,
        baseOriginalPrice = json['base_original_price'] as int?,
        basePrice = json['base_price'] as int?,
        basePriceInclTax = json['base_price_incl_tax'] as int?,
        baseRowInvoiced = json['base_row_invoiced'] as int?,
        baseRowTotal = json['base_row_total'] as int?,
        baseRowTotalInclTax = json['base_row_total_incl_tax'] as int?,
        baseTaxAmount = json['base_tax_amount'] as int?,
        baseTaxInvoiced = json['base_tax_invoiced'] as int?,
        createdAt = json['created_at'] as String?,
        discountAmount = json['discount_amount'] as int?,
        discountInvoiced = json['discount_invoiced'] as int?,
        discountPercent = json['discount_percent'] as int?,
        freeShipping = json['free_shipping'] as int?,
        discountTaxCompensationAmount =
            json['discount_tax_compensation_amount'] as int?,
        isQtyDecimal = json['is_qty_decimal'] as int?,
        isVirtual = json['is_virtual'] as int?,
        itemId = json['item_id'] as int?,
        name = json['name'] as String?,
        noDiscount = json['no_discount'] as int?,
        orderId = json['order_id'] as int?,
        originalPrice = json['original_price'] as int?,
        price = json['price'] as int?,
        priceInclTax = json['price_incl_tax'] as int?,
        productId = json['product_id'] as int?,
        productType = json['product_type'] as String?,
        qtyCanceled = json['qty_canceled'] as int?,
        qtyInvoiced = json['qty_invoiced'] as int?,
        qtyOrdered = json['qty_ordered'] as int?,
        qtyRefunded = json['qty_refunded'] as int?,
        qtyShipped = json['qty_shipped'] as int?,
        quoteItemId = json['quote_item_id'] as int?,
        rowInvoiced = json['row_invoiced'] as int?,
        rowTotal = json['row_total'] as int?,
        rowTotalInclTax = json['row_total_incl_tax'] as int?,
        rowWeight = json['row_weight'] as int?,
        sku = json['sku'] as String?,
        storeId = json['store_id'] as int?,
        taxAmount = json['tax_amount'] as int?,
        taxInvoiced = json['tax_invoiced'] as int?,
        taxPercent = json['tax_percent'] as int?,
        updatedAt = json['updated_at'] as String?,
        productOption =
            (json['product_option'] as Map<String, dynamic>?) != null
                ? ProductOption.fromJson(
                    json['product_option'] as Map<String, dynamic>)
                : null;

  Map<String, dynamic> toJson() => {
        'amount_refunded': amountRefunded,
        'base_amount_refunded': baseAmountRefunded,
        'base_discount_amount': baseDiscountAmount,
        'base_discount_invoiced': baseDiscountInvoiced,
        'base_discount_tax_compensation_amount':
            baseDiscountTaxCompensationAmount,
        'base_original_price': baseOriginalPrice,
        'base_price': basePrice,
        'base_price_incl_tax': basePriceInclTax,
        'base_row_invoiced': baseRowInvoiced,
        'base_row_total': baseRowTotal,
        'base_row_total_incl_tax': baseRowTotalInclTax,
        'base_tax_amount': baseTaxAmount,
        'base_tax_invoiced': baseTaxInvoiced,
        'created_at': createdAt,
        'discount_amount': discountAmount,
        'discount_invoiced': discountInvoiced,
        'discount_percent': discountPercent,
        'free_shipping': freeShipping,
        'discount_tax_compensation_amount': discountTaxCompensationAmount,
        'is_qty_decimal': isQtyDecimal,
        'is_virtual': isVirtual,
        'item_id': itemId,
        'name': name,
        'no_discount': noDiscount,
        'order_id': orderId,
        'original_price': originalPrice,
        'price': price,
        'price_incl_tax': priceInclTax,
        'product_id': productId,
        'product_type': productType,
        'qty_canceled': qtyCanceled,
        'qty_invoiced': qtyInvoiced,
        'qty_ordered': qtyOrdered,
        'qty_refunded': qtyRefunded,
        'qty_shipped': qtyShipped,
        'quote_item_id': quoteItemId,
        'row_invoiced': rowInvoiced,
        'row_total': rowTotal,
        'row_total_incl_tax': rowTotalInclTax,
        'row_weight': rowWeight,
        'sku': sku,
        'store_id': storeId,
        'tax_amount': taxAmount,
        'tax_invoiced': taxInvoiced,
        'tax_percent': taxPercent,
        'updated_at': updatedAt,
        'product_option': productOption?.toJson()
      };
}

class ProductOption {
  final ExtensionAttributes? extensionAttributes;

  ProductOption({
    this.extensionAttributes,
  });

  ProductOption.fromJson(Map<String, dynamic> json)
      : extensionAttributes =
            (json['extension_attributes'] as Map<String, dynamic>?) != null
                ? ExtensionAttributes.fromJson(
                    json['extension_attributes'] as Map<String, dynamic>)
                : null;

  Map<String, dynamic> toJson() =>
      {'extension_attributes': extensionAttributes?.toJson()};
}

class ExtensionAttributes {
  final List<ConfigurableItemOptions>? configurableItemOptions;

  ExtensionAttributes({
    this.configurableItemOptions,
  });

  ExtensionAttributes.fromJson(Map<String, dynamic> json)
      : configurableItemOptions = (json['configurable_item_options'] as List?)
            ?.map((dynamic e) =>
                ConfigurableItemOptions.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'configurable_item_options':
            configurableItemOptions?.map((e) => e.toJson()).toList()
      };
}

class ConfigurableItemOptions {
  final String? optionId;
  final int? optionValue;

  ConfigurableItemOptions({
    this.optionId,
    this.optionValue,
  });

  ConfigurableItemOptions.fromJson(Map<String, dynamic> json)
      : optionId = json['option_id'] as String?,
        optionValue = json['option_value'] as int?;

  Map<String, dynamic> toJson() =>
      {'option_id': optionId, 'option_value': optionValue};
}

class BillingAddress {
  final String? addressType;
  final String? city;
  final String? countryId;
  final int? customerAddressId;
  final String? email;
  final int? entityId;
  final String? firstname;
  final String? lastname;
  final int? parentId;
  final String? postcode;
  final List<String>? street;
  final String? telephone;

  BillingAddress({
    this.addressType,
    this.city,
    this.countryId,
    this.customerAddressId,
    this.email,
    this.entityId,
    this.firstname,
    this.lastname,
    this.parentId,
    this.postcode,
    this.street,
    this.telephone,
  });

  BillingAddress.fromJson(Map<String, dynamic> json)
      : addressType = json['address_type'] as String?,
        city = json['city'] as String?,
        countryId = json['country_id'] as String?,
        customerAddressId = json['customer_address_id'] as int?,
        email = json['email'] as String?,
        entityId = json['entity_id'] as int?,
        firstname = json['firstname'] as String?,
        lastname = json['lastname'] as String?,
        parentId = json['parent_id'] as int?,
        postcode = json['postcode'] as String?,
        street =
            (json['street'] as List?)?.map((dynamic e) => e as String).toList(),
        telephone = json['telephone'] as String?;

  Map<String, dynamic> toJson() => {
        'address_type': addressType,
        'city': city,
        'country_id': countryId,
        'customer_address_id': customerAddressId,
        'email': email,
        'entity_id': entityId,
        'firstname': firstname,
        'lastname': lastname,
        'parent_id': parentId,
        'postcode': postcode,
        'street': street,
        'telephone': telephone
      };
}

class Payment {
  final dynamic accountStatus;
  final List<String>? additionalInformation;
  final int? amountOrdered;
  final int? baseAmountOrdered;
  final int? baseShippingAmount;
  final dynamic ccLast4;
  final int? entityId;
  final String? method;
  final int? parentId;
  final int? shippingAmount;

  Payment({
    this.accountStatus,
    this.additionalInformation,
    this.amountOrdered,
    this.baseAmountOrdered,
    this.baseShippingAmount,
    this.ccLast4,
    this.entityId,
    this.method,
    this.parentId,
    this.shippingAmount,
  });

  Payment.fromJson(Map<String, dynamic> json)
      : accountStatus = json['account_status'],
        additionalInformation = (json['additional_information'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        amountOrdered = json['amount_ordered'] as int?,
        baseAmountOrdered = json['base_amount_ordered'] as int?,
        baseShippingAmount = json['base_shipping_amount'] as int?,
        ccLast4 = json['cc_last4'],
        entityId = json['entity_id'] as int?,
        method = json['method'] as String?,
        parentId = json['parent_id'] as int?,
        shippingAmount = json['shipping_amount'] as int?;

  Map<String, dynamic> toJson() => {
        'account_status': accountStatus,
        'additional_information': additionalInformation,
        'amount_ordered': amountOrdered,
        'base_amount_ordered': baseAmountOrdered,
        'base_shipping_amount': baseShippingAmount,
        'cc_last4': ccLast4,
        'entity_id': entityId,
        'method': method,
        'parent_id': parentId,
        'shipping_amount': shippingAmount
      };
}

class ExtensionAttribute {
  final List<ShippingAssignments>? shippingAssignments;
  final List<PaymentAdditionalInfo>? paymentAdditionalInfo;
  final List<dynamic>? appliedTaxes;
  final List<dynamic>? itemAppliedTaxes;
  final Credits? credits;

  ExtensionAttribute({
    this.shippingAssignments,
    this.paymentAdditionalInfo,
    this.appliedTaxes,
    this.itemAppliedTaxes,
    this.credits,
  });

  ExtensionAttribute.fromJson(Map<String, dynamic> json)
      : shippingAssignments = (json['shipping_assignments'] as List?)
            ?.map((dynamic e) =>
                ShippingAssignments.fromJson(e as Map<String, dynamic>))
            .toList(),
        paymentAdditionalInfo = (json['payment_additional_info'] as List?)
            ?.map((dynamic e) =>
                PaymentAdditionalInfo.fromJson(e as Map<String, dynamic>))
            .toList(),
        appliedTaxes = json['applied_taxes'] as List?,
        itemAppliedTaxes = json['item_applied_taxes'] as List?,
        credits = (json['credits'] as Map<String, dynamic>?) != null
            ? Credits.fromJson(json['credits'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'shipping_assignments':
            shippingAssignments?.map((e) => e.toJson()).toList(),
        'payment_additional_info':
            paymentAdditionalInfo?.map((e) => e.toJson()).toList(),
        'applied_taxes': appliedTaxes,
        'item_applied_taxes': itemAppliedTaxes,
        'credits': credits?.toJson()
      };
}

class ShippingAssignments {
  final Shipping? shipping;
  final List<Items>? items;

  ShippingAssignments({
    this.shipping,
    this.items,
  });

  ShippingAssignments.fromJson(Map<String, dynamic> json)
      : shipping = (json['shipping'] as Map<String, dynamic>?) != null
            ? Shipping.fromJson(json['shipping'] as Map<String, dynamic>)
            : null,
        items = (json['items'] as List?)
            ?.map((dynamic e) => Items.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'shipping': shipping?.toJson(),
        'items': items?.map((e) => e.toJson()).toList()
      };
}

class Shipping {
  final Total? total;

  Shipping({
    this.total,
  });

  Shipping.fromJson(Map<String, dynamic> json)
      : total = (json['total'] as Map<String, dynamic>?) != null
            ? Total.fromJson(json['total'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'total': total?.toJson()};
}

class Total {
  final int? baseShippingAmount;
  final int? baseShippingDiscountAmount;
  final int? baseShippingDiscountTaxCompensationAmnt;
  final int? baseShippingInclTax;
  final int? baseShippingTaxAmount;
  final int? shippingAmount;
  final int? shippingDiscountAmount;
  final int? shippingDiscountTaxCompensationAmount;
  final int? shippingInclTax;
  final int? shippingTaxAmount;

  Total({
    this.baseShippingAmount,
    this.baseShippingDiscountAmount,
    this.baseShippingDiscountTaxCompensationAmnt,
    this.baseShippingInclTax,
    this.baseShippingTaxAmount,
    this.shippingAmount,
    this.shippingDiscountAmount,
    this.shippingDiscountTaxCompensationAmount,
    this.shippingInclTax,
    this.shippingTaxAmount,
  });

  Total.fromJson(Map<String, dynamic> json)
      : baseShippingAmount = json['base_shipping_amount'] as int?,
        baseShippingDiscountAmount =
            json['base_shipping_discount_amount'] as int?,
        baseShippingDiscountTaxCompensationAmnt =
            json['base_shipping_discount_tax_compensation_amnt'] as int?,
        baseShippingInclTax = json['base_shipping_incl_tax'] as int?,
        baseShippingTaxAmount = json['base_shipping_tax_amount'] as int?,
        shippingAmount = json['shipping_amount'] as int?,
        shippingDiscountAmount = json['shipping_discount_amount'] as int?,
        shippingDiscountTaxCompensationAmount =
            json['shipping_discount_tax_compensation_amount'] as int?,
        shippingInclTax = json['shipping_incl_tax'] as int?,
        shippingTaxAmount = json['shipping_tax_amount'] as int?;

  Map<String, dynamic> toJson() => {
        'base_shipping_amount': baseShippingAmount,
        'base_shipping_discount_amount': baseShippingDiscountAmount,
        'base_shipping_discount_tax_compensation_amnt':
            baseShippingDiscountTaxCompensationAmnt,
        'base_shipping_incl_tax': baseShippingInclTax,
        'base_shipping_tax_amount': baseShippingTaxAmount,
        'shipping_amount': shippingAmount,
        'shipping_discount_amount': shippingDiscountAmount,
        'shipping_discount_tax_compensation_amount':
            shippingDiscountTaxCompensationAmount,
        'shipping_incl_tax': shippingInclTax,
        'shipping_tax_amount': shippingTaxAmount
      };
}

class ItemsVal {
  final int? amountRefunded;
  final int? baseAmountRefunded;
  final int? baseDiscountAmount;
  final int? baseDiscountInvoiced;
  final int? baseDiscountTaxCompensationAmount;
  final int? baseOriginalPrice;
  final int? basePrice;
  final int? basePriceInclTax;
  final int? baseRowInvoiced;
  final int? baseRowTotal;
  final int? baseRowTotalInclTax;
  final int? baseTaxAmount;
  final int? baseTaxInvoiced;
  final String? createdAt;
  final int? discountAmount;
  final int? discountInvoiced;
  final int? discountPercent;
  final int? freeShipping;
  final int? discountTaxCompensationAmount;
  final int? isQtyDecimal;
  final int? isVirtual;
  final int? itemId;
  final String? name;
  final int? noDiscount;
  final int? orderId;
  final int? originalPrice;
  final int? price;
  final int? priceInclTax;
  final int? productId;
  final String? productType;
  final int? qtyCanceled;
  final int? qtyInvoiced;
  final int? qtyOrdered;
  final int? qtyRefunded;
  final int? qtyShipped;
  final int? quoteItemId;
  final int? rowInvoiced;
  final int? rowTotal;
  final int? rowTotalInclTax;
  final int? rowWeight;
  final String? sku;
  final int? storeId;
  final int? taxAmount;
  final int? taxInvoiced;
  final int? taxPercent;
  final String? updatedAt;
  final ProductOption? productOption;

  ItemsVal({
    this.amountRefunded,
    this.baseAmountRefunded,
    this.baseDiscountAmount,
    this.baseDiscountInvoiced,
    this.baseDiscountTaxCompensationAmount,
    this.baseOriginalPrice,
    this.basePrice,
    this.basePriceInclTax,
    this.baseRowInvoiced,
    this.baseRowTotal,
    this.baseRowTotalInclTax,
    this.baseTaxAmount,
    this.baseTaxInvoiced,
    this.createdAt,
    this.discountAmount,
    this.discountInvoiced,
    this.discountPercent,
    this.freeShipping,
    this.discountTaxCompensationAmount,
    this.isQtyDecimal,
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
    this.qtyCanceled,
    this.qtyInvoiced,
    this.qtyOrdered,
    this.qtyRefunded,
    this.qtyShipped,
    this.quoteItemId,
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
    this.productOption,
  });

  ItemsVal.fromJson(Map<String, dynamic> json)
      : amountRefunded = json['amount_refunded'] as int?,
        baseAmountRefunded = json['base_amount_refunded'] as int?,
        baseDiscountAmount = json['base_discount_amount'] as int?,
        baseDiscountInvoiced = json['base_discount_invoiced'] as int?,
        baseDiscountTaxCompensationAmount =
            json['base_discount_tax_compensation_amount'] as int?,
        baseOriginalPrice = json['base_original_price'] as int?,
        basePrice = json['base_price'] as int?,
        basePriceInclTax = json['base_price_incl_tax'] as int?,
        baseRowInvoiced = json['base_row_invoiced'] as int?,
        baseRowTotal = json['base_row_total'] as int?,
        baseRowTotalInclTax = json['base_row_total_incl_tax'] as int?,
        baseTaxAmount = json['base_tax_amount'] as int?,
        baseTaxInvoiced = json['base_tax_invoiced'] as int?,
        createdAt = json['created_at'] as String?,
        discountAmount = json['discount_amount'] as int?,
        discountInvoiced = json['discount_invoiced'] as int?,
        discountPercent = json['discount_percent'] as int?,
        freeShipping = json['free_shipping'] as int?,
        discountTaxCompensationAmount =
            json['discount_tax_compensation_amount'] as int?,
        isQtyDecimal = json['is_qty_decimal'] as int?,
        isVirtual = json['is_virtual'] as int?,
        itemId = json['item_id'] as int?,
        name = json['name'] as String?,
        noDiscount = json['no_discount'] as int?,
        orderId = json['order_id'] as int?,
        originalPrice = json['original_price'] as int?,
        price = json['price'] as int?,
        priceInclTax = json['price_incl_tax'] as int?,
        productId = json['product_id'] as int?,
        productType = json['product_type'] as String?,
        qtyCanceled = json['qty_canceled'] as int?,
        qtyInvoiced = json['qty_invoiced'] as int?,
        qtyOrdered = json['qty_ordered'] as int?,
        qtyRefunded = json['qty_refunded'] as int?,
        qtyShipped = json['qty_shipped'] as int?,
        quoteItemId = json['quote_item_id'] as int?,
        rowInvoiced = json['row_invoiced'] as int?,
        rowTotal = json['row_total'] as int?,
        rowTotalInclTax = json['row_total_incl_tax'] as int?,
        rowWeight = json['row_weight'] as int?,
        sku = json['sku'] as String?,
        storeId = json['store_id'] as int?,
        taxAmount = json['tax_amount'] as int?,
        taxInvoiced = json['tax_invoiced'] as int?,
        taxPercent = json['tax_percent'] as int?,
        updatedAt = json['updated_at'] as String?,
        productOption =
            (json['product_option'] as Map<String, dynamic>?) != null
                ? ProductOption.fromJson(
                    json['product_option'] as Map<String, dynamic>)
                : null;

  Map<String, dynamic> toJson() => {
        'amount_refunded': amountRefunded,
        'base_amount_refunded': baseAmountRefunded,
        'base_discount_amount': baseDiscountAmount,
        'base_discount_invoiced': baseDiscountInvoiced,
        'base_discount_tax_compensation_amount':
            baseDiscountTaxCompensationAmount,
        'base_original_price': baseOriginalPrice,
        'base_price': basePrice,
        'base_price_incl_tax': basePriceInclTax,
        'base_row_invoiced': baseRowInvoiced,
        'base_row_total': baseRowTotal,
        'base_row_total_incl_tax': baseRowTotalInclTax,
        'base_tax_amount': baseTaxAmount,
        'base_tax_invoiced': baseTaxInvoiced,
        'created_at': createdAt,
        'discount_amount': discountAmount,
        'discount_invoiced': discountInvoiced,
        'discount_percent': discountPercent,
        'free_shipping': freeShipping,
        'discount_tax_compensation_amount': discountTaxCompensationAmount,
        'is_qty_decimal': isQtyDecimal,
        'is_virtual': isVirtual,
        'item_id': itemId,
        'name': name,
        'no_discount': noDiscount,
        'order_id': orderId,
        'original_price': originalPrice,
        'price': price,
        'price_incl_tax': priceInclTax,
        'product_id': productId,
        'product_type': productType,
        'qty_canceled': qtyCanceled,
        'qty_invoiced': qtyInvoiced,
        'qty_ordered': qtyOrdered,
        'qty_refunded': qtyRefunded,
        'qty_shipped': qtyShipped,
        'quote_item_id': quoteItemId,
        'row_invoiced': rowInvoiced,
        'row_total': rowTotal,
        'row_total_incl_tax': rowTotalInclTax,
        'row_weight': rowWeight,
        'sku': sku,
        'store_id': storeId,
        'tax_amount': taxAmount,
        'tax_invoiced': taxInvoiced,
        'tax_percent': taxPercent,
        'updated_at': updatedAt,
        'product_option': productOption?.toJson()
      };
}

class ProductOptionVal {
  final ExtensionAttributes? extensionAttributes;

  ProductOptionVal({
    this.extensionAttributes,
  });

  ProductOptionVal.fromJson(Map<String, dynamic> json)
      : extensionAttributes =
            (json['extension_attributes'] as Map<String, dynamic>?) != null
                ? ExtensionAttributes.fromJson(
                    json['extension_attributes'] as Map<String, dynamic>)
                : null;

  Map<String, dynamic> toJson() =>
      {'extension_attributes': extensionAttributes?.toJson()};
}

class ExtensionAttributesVal {
  final List<ConfigurableItemOptions>? configurableItemOptions;

  ExtensionAttributesVal({
    this.configurableItemOptions,
  });

  ExtensionAttributesVal.fromJson(Map<String, dynamic> json)
      : configurableItemOptions = (json['configurable_item_options'] as List?)
            ?.map((dynamic e) =>
                ConfigurableItemOptions.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'configurable_item_options':
            configurableItemOptions?.map((e) => e.toJson()).toList()
      };
}

class ConfigurableItemOptionsVal {
  final String? optionId;
  final int? optionValue;

  ConfigurableItemOptionsVal({
    this.optionId,
    this.optionValue,
  });

  ConfigurableItemOptionsVal.fromJson(Map<String, dynamic> json)
      : optionId = json['option_id'] as String?,
        optionValue = json['option_value'] as int?;

  Map<String, dynamic> toJson() =>
      {'option_id': optionId, 'option_value': optionValue};
}

class PaymentAdditionalInfo {
  final String? key;
  final String? value;

  PaymentAdditionalInfo({
    this.key,
    this.value,
  });

  PaymentAdditionalInfo.fromJson(Map<String, dynamic> json)
      : key = json['key'] as String?,
        value = json['value'] as String?;

  Map<String, dynamic> toJson() => {'key': key, 'value': value};
}

class Credits {
  final dynamic attributeId;
  final int? orderId;
  final int? credits;
  final int? creditsPaid;
  final int? creditsRefunded;
  final int? amount;
  final int? amountPaid;
  final int? amountRefunded;
  final int? baseAmount;
  final int? baseAmountPaid;
  final int? baseAmountRefunded;

  Credits({
    this.attributeId,
    this.orderId,
    this.credits,
    this.creditsPaid,
    this.creditsRefunded,
    this.amount,
    this.amountPaid,
    this.amountRefunded,
    this.baseAmount,
    this.baseAmountPaid,
    this.baseAmountRefunded,
  });

  Credits.fromJson(Map<String, dynamic> json)
      : attributeId = json['attribute_id'],
        orderId = json['order_id'] as int?,
        credits = json['credits'] as int?,
        creditsPaid = json['credits_paid'] as int?,
        creditsRefunded = json['credits_refunded'] as int?,
        amount = json['amount'] as int?,
        amountPaid = json['amount_paid'] as int?,
        amountRefunded = json['amount_refunded'] as int?,
        baseAmount = json['base_amount'] as int?,
        baseAmountPaid = json['base_amount_paid'] as int?,
        baseAmountRefunded = json['base_amount_refunded'] as int?;

  Map<String, dynamic> toJson() => {
        'attribute_id': attributeId,
        'order_id': orderId,
        'credits': credits,
        'credits_paid': creditsPaid,
        'credits_refunded': creditsRefunded,
        'amount': amount,
        'amount_paid': amountPaid,
        'amount_refunded': amountRefunded,
        'base_amount': baseAmount,
        'base_amount_paid': baseAmountPaid,
        'base_amount_refunded': baseAmountRefunded
      };
}
