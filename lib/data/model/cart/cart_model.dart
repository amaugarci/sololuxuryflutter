class CartModel {
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final bool? isActive;
  final bool? isVirtual;
  final List<Items>? items;
  final int? itemsCount;
  final int? itemsQty;
  final Customer? customer;
  final BillingAddress? billingAddress;
  final int? origOrderId;
  final Currency? currency;
  final bool? customerIsGuest;
  final bool? customerNoteNotify;
  final int? customerTaxClassId;
  final int? storeId;
  final ExtensionAttributesCart? extensionAttributes;

  CartModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.isActive,
    this.isVirtual,
    this.items,
    this.itemsCount,
    this.itemsQty,
    this.customer,
    this.billingAddress,
    this.origOrderId,
    this.currency,
    this.customerIsGuest,
    this.customerNoteNotify,
    this.customerTaxClassId,
    this.storeId,
    this.extensionAttributes,
  });

  CartModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        isActive = json['is_active'] as bool?,
        isVirtual = json['is_virtual'] as bool?,
        items = (json['items'] as List?)
            ?.map((dynamic e) => Items.fromJson(e as Map<String, dynamic>))
            .toList(),
        itemsCount = json['items_count'] as int?,
        itemsQty = json['items_qty'] as int?,
        customer = (json['customer'] as Map<String, dynamic>?) != null
            ? Customer.fromJson(json['customer'] as Map<String, dynamic>)
            : null,
        billingAddress =
            (json['billing_address'] as Map<String, dynamic>?) != null
                ? BillingAddress.fromJson(
                    json['billing_address'] as Map<String, dynamic>)
                : null,
        origOrderId = json['orig_order_id'] as int?,
        currency = (json['currency'] as Map<String, dynamic>?) != null
            ? Currency.fromJson(json['currency'] as Map<String, dynamic>)
            : null,
        customerIsGuest = json['customer_is_guest'] as bool?,
        customerNoteNotify = json['customer_note_notify'] as bool?,
        customerTaxClassId = json['customer_tax_class_id'] as int?,
        storeId = json['store_id'] as int?,
        extensionAttributes =
            (json['extension_attributes'] as Map<String, dynamic>?) != null
                ? ExtensionAttributesCart.fromJson(
                    json['extension_attributes'] as Map<String, dynamic>)
                : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'is_active': isActive,
        'is_virtual': isVirtual,
        'items': items?.map((e) => e.toJson()).toList(),
        'items_count': itemsCount,
        'items_qty': itemsQty,
        'customer': customer?.toJson(),
        'billing_address': billingAddress?.toJson(),
        'orig_order_id': origOrderId,
        'currency': currency?.toJson(),
        'customer_is_guest': customerIsGuest,
        'customer_note_notify': customerNoteNotify,
        'customer_tax_class_id': customerTaxClassId,
        'store_id': storeId,
        'extension_attributes': extensionAttributes?.toJson()
      };
}

class Items {
  final int? itemId;
  final String? sku;
  final int? qty;
  final String? name;
  final int? price;
  final String? productType;
  final String? quoteId;

  Items({
    this.itemId,
    this.sku,
    this.qty,
    this.name,
    this.price,
    this.productType,
    this.quoteId,
  });

  Items.fromJson(Map<String, dynamic> json)
      : itemId = json['item_id'] as int?,
        sku = json['sku'] as String?,
        qty = json['qty'] as int?,
        name = json['name'] as String?,
        price = json['price'] as int?,
        productType = json['product_type'] as String?,
        quoteId = json['quote_id'] as String?;

  Map<String, dynamic> toJson() => {
        'item_id': itemId,
        'sku': sku,
        'qty': qty,
        'name': name,
        'price': price,
        'product_type': productType,
        'quote_id': quoteId
      };
}

class Customer {
  final int? id;
  final int? groupId;
  final String? createdAt;
  final String? updatedAt;
  final String? createdIn;
  final String? email;
  final String? firstname;
  final String? lastname;
  final int? storeId;
  final int? websiteId;
  final List<dynamic>? addresses;
  final int? disableAutoGroupChange;
  final ExtensionAttributes? extensionAttributes;

  Customer({
    this.id,
    this.groupId,
    this.createdAt,
    this.updatedAt,
    this.createdIn,
    this.email,
    this.firstname,
    this.lastname,
    this.storeId,
    this.websiteId,
    this.addresses,
    this.disableAutoGroupChange,
    this.extensionAttributes,
  });

  Customer.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        groupId = json['group_id'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        createdIn = json['created_in'] as String?,
        email = json['email'] as String?,
        firstname = json['firstname'] as String?,
        lastname = json['lastname'] as String?,
        storeId = json['store_id'] as int?,
        websiteId = json['website_id'] as int?,
        addresses = json['addresses'] as List?,
        disableAutoGroupChange = json['disable_auto_group_change'] as int?,
        extensionAttributes =
            (json['extension_attributes'] as Map<String, dynamic>?) != null
                ? ExtensionAttributes.fromJson(
                    json['extension_attributes'] as Map<String, dynamic>)
                : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'group_id': groupId,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'created_in': createdIn,
        'email': email,
        'firstname': firstname,
        'lastname': lastname,
        'store_id': storeId,
        'website_id': websiteId,
        'addresses': addresses,
        'disable_auto_group_change': disableAutoGroupChange,
        'extension_attributes': extensionAttributes?.toJson()
      };
}

class ExtensionAttributes {
  final bool? isSubscribed;

  ExtensionAttributes({
    this.isSubscribed,
  });

  ExtensionAttributes.fromJson(Map<String, dynamic> json)
      : isSubscribed = json['is_subscribed'] as bool?;

  Map<String, dynamic> toJson() => {'is_subscribed': isSubscribed};
}

class BillingAddress {
  final int? id;
  final dynamic region;
  final dynamic regionId;
  final dynamic regionCode;
  final dynamic countryId;
  final List<String>? street;
  final dynamic telephone;
  final String? postcode;
  final dynamic city;
  final dynamic firstname;
  final dynamic lastname;
  final int? customerId;
  final String? email;
  final int? sameAsBilling;
  final int? saveInAddressBook;

  BillingAddress({
    this.id,
    this.region,
    this.regionId,
    this.regionCode,
    this.countryId,
    this.street,
    this.telephone,
    this.postcode,
    this.city,
    this.firstname,
    this.lastname,
    this.customerId,
    this.email,
    this.sameAsBilling,
    this.saveInAddressBook,
  });

  BillingAddress.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        region = json['region'],
        regionId = json['region_id'],
        regionCode = json['region_code'],
        countryId = json['country_id'],
        street =
            (json['street'] as List?)?.map((dynamic e) => e as String).toList(),
        telephone = json['telephone'],
        postcode = json['postcode'] as String?,
        city = json['city'],
        firstname = json['firstname'],
        lastname = json['lastname'],
        customerId = json['customer_id'] as int?,
        email = json['email'] as String?,
        sameAsBilling = json['same_as_billing'] as int?,
        saveInAddressBook = json['save_in_address_book'] as int?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'region': region,
        'region_id': regionId,
        'region_code': regionCode,
        'country_id': countryId,
        'street': street,
        'telephone': telephone,
        'postcode': postcode,
        'city': city,
        'firstname': firstname,
        'lastname': lastname,
        'customer_id': customerId,
        'email': email,
        'same_as_billing': sameAsBilling,
        'save_in_address_book': saveInAddressBook
      };
}

class Currency {
  final String? globalCurrencyCode;
  final String? baseCurrencyCode;
  final String? storeCurrencyCode;
  final String? quoteCurrencyCode;
  final int? storeToBaseRate;
  final int? storeToQuoteRate;
  final int? baseToGlobalRate;
  final double? baseToQuoteRate;

  Currency({
    this.globalCurrencyCode,
    this.baseCurrencyCode,
    this.storeCurrencyCode,
    this.quoteCurrencyCode,
    this.storeToBaseRate,
    this.storeToQuoteRate,
    this.baseToGlobalRate,
    this.baseToQuoteRate,
  });

  Currency.fromJson(Map<String, dynamic> json)
      : globalCurrencyCode = json['global_currency_code'] as String?,
        baseCurrencyCode = json['base_currency_code'] as String?,
        storeCurrencyCode = json['store_currency_code'] as String?,
        quoteCurrencyCode = json['quote_currency_code'] as String?,
        storeToBaseRate = json['store_to_base_rate'] as int?,
        storeToQuoteRate = json['store_to_quote_rate'] as int?,
        baseToGlobalRate = json['base_to_global_rate'] as int?,
        baseToQuoteRate = json['base_to_quote_rate'] as double?;

  Map<String, dynamic> toJson() => {
        'global_currency_code': globalCurrencyCode,
        'base_currency_code': baseCurrencyCode,
        'store_currency_code': storeCurrencyCode,
        'quote_currency_code': quoteCurrencyCode,
        'store_to_base_rate': storeToBaseRate,
        'store_to_quote_rate': storeToQuoteRate,
        'base_to_global_rate': baseToGlobalRate,
        'base_to_quote_rate': baseToQuoteRate
      };
}

class ExtensionAttributesCart {
  final List<ShippingAssignments>? shippingAssignments;

  ExtensionAttributesCart({
    this.shippingAssignments,
  });

  ExtensionAttributesCart.fromJson(Map<String, dynamic> json)
      : shippingAssignments = (json['shipping_assignments'] as List?)
            ?.map((dynamic e) =>
                ShippingAssignments.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'shipping_assignments':
            shippingAssignments?.map((e) => e.toJson()).toList()
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
  final Address? address;
  final dynamic method;

  Shipping({
    this.address,
    this.method,
  });

  Shipping.fromJson(Map<String, dynamic> json)
      : address = (json['address'] as Map<String, dynamic>?) != null
            ? Address.fromJson(json['address'] as Map<String, dynamic>)
            : null,
        method = json['method'];

  Map<String, dynamic> toJson() =>
      {'address': address?.toJson(), 'method': method};
}

class Address {
  final int? id;
  final dynamic region;
  final dynamic regionId;
  final dynamic regionCode;
  final dynamic countryId;
  final List<String>? street;
  final dynamic telephone;
  final String? postcode;
  final dynamic city;
  final dynamic firstname;
  final dynamic lastname;
  final int? customerId;
  final String? email;
  final int? sameAsBilling;
  final int? saveInAddressBook;

  Address({
    this.id,
    this.region,
    this.regionId,
    this.regionCode,
    this.countryId,
    this.street,
    this.telephone,
    this.postcode,
    this.city,
    this.firstname,
    this.lastname,
    this.customerId,
    this.email,
    this.sameAsBilling,
    this.saveInAddressBook,
  });

  Address.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        region = json['region'],
        regionId = json['region_id'],
        regionCode = json['region_code'],
        countryId = json['country_id'],
        street =
            (json['street'] as List?)?.map((dynamic e) => e as String).toList(),
        telephone = json['telephone'],
        postcode = json['postcode'] as String?,
        city = json['city'],
        firstname = json['firstname'],
        lastname = json['lastname'],
        customerId = json['customer_id'] as int?,
        email = json['email'] as String?,
        sameAsBilling = json['same_as_billing'] as int?,
        saveInAddressBook = json['save_in_address_book'] as int?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'region': region,
        'region_id': regionId,
        'region_code': regionCode,
        'country_id': countryId,
        'street': street,
        'telephone': telephone,
        'postcode': postcode,
        'city': city,
        'firstname': firstname,
        'lastname': lastname,
        'customer_id': customerId,
        'email': email,
        'same_as_billing': sameAsBilling,
        'save_in_address_book': saveInAddressBook
      };
}

class ItemsCart {
  final int? itemId;
  final String? sku;
  final int? qty;
  final String? name;
  final int? price;
  final String? productType;
  final String? quoteId;

  ItemsCart({
    this.itemId,
    this.sku,
    this.qty,
    this.name,
    this.price,
    this.productType,
    this.quoteId,
  });

  ItemsCart.fromJson(Map<String, dynamic> json)
      : itemId = json['item_id'] as int?,
        sku = json['sku'] as String?,
        qty = json['qty'] as int?,
        name = json['name'] as String?,
        price = json['price'] as int?,
        productType = json['product_type'] as String?,
        quoteId = json['quote_id'] as String?;

  Map<String, dynamic> toJson() => {
        'item_id': itemId,
        'sku': sku,
        'qty': qty,
        'name': name,
        'price': price,
        'product_type': productType,
        'quote_id': quoteId
      };
}
