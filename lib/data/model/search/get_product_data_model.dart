import 'dart:convert';

ProductDetailsModel searchProductResponseModelFromJson(String str) =>
    ProductDetailsModel.fromJson(json.decode(str));

String searchProductResponseModelToJson(ProductDetailsModel data) =>
    json.encode(data.toJson());

class ProductDetailsModel {
  final List<Items>? items;
  final SearchCriteria? searchCriteria;
  final int? totalCount;

  ProductDetailsModel({
    this.items,
    this.searchCriteria,
    this.totalCount,
  });

  ProductDetailsModel.fromJson(Map<String, dynamic> json)
      : items = (json['items'] as List?)
            ?.map((dynamic e) => Items.fromJson(e as Map<String, dynamic>))
            .toList(),
        searchCriteria =
            (json['search_criteria'] as Map<String, dynamic>?) != null
                ? SearchCriteria.fromJson(
                    json['search_criteria'] as Map<String, dynamic>)
                : null,
        totalCount = json['total_count'] as int?;

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
        'search_criteria': searchCriteria?.toJson(),
        'total_count': totalCount
      };
}

class Items {
  final int? id;
  final String? sku;
  final String? name;
  final int? attributeSetId;
  final dynamic price;
  final int? status;
  final int? visibility;
  final String? typeId;
  final String? createdAt;
  final String? updatedAt;
  final int? weight;
  final ExtensionAttributes? extensionAttributes;
  final List<dynamic>? productLinks;
  final List<dynamic>? options;
  final List<MediaGalleryEntries>? mediaGalleryEntries;
  final List<dynamic>? tierPrices;
  final List<CustomAttributes>? customAttributes;

  Items({
    this.id,
    this.sku,
    this.name,
    this.attributeSetId,
    this.price,
    this.status,
    this.visibility,
    this.typeId,
    this.createdAt,
    this.updatedAt,
    this.weight,
    this.extensionAttributes,
    this.productLinks,
    this.options,
    this.mediaGalleryEntries,
    this.tierPrices,
    this.customAttributes,
  });

  Items.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        sku = json['sku'] as String?,
        name = json['name'] as String?,
        attributeSetId = json['attribute_set_id'] as int?,
        price = json['price'] as dynamic,
        status = json['status'] as int?,
        visibility = json['visibility'] as int?,
        typeId = json['type_id'] as String?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        weight = json['weight'] as int?,
        extensionAttributes =
            (json['extension_attributes'] as Map<String, dynamic>?) != null
                ? ExtensionAttributes.fromJson(
                    json['extension_attributes'] as Map<String, dynamic>)
                : null,
        productLinks = json['product_links'] as List?,
        options = json['options'] as List?,
        mediaGalleryEntries = (json['media_gallery_entries'] as List?)
            ?.map((dynamic e) =>
                MediaGalleryEntries.fromJson(e as Map<String, dynamic>))
            .toList(),
        tierPrices = json['tier_prices'] as List?,
        customAttributes = (json['custom_attributes'] as List?)
            ?.map((dynamic e) =>
                CustomAttributes.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'sku': sku,
        'name': name,
        'attribute_set_id': attributeSetId,
        'price': price,
        'status': status,
        'visibility': visibility,
        'type_id': typeId,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'weight': weight,
        'extension_attributes': extensionAttributes?.toJson(),
        'product_links': productLinks,
        'options': options,
        'media_gallery_entries':
            mediaGalleryEntries?.map((e) => e.toJson()).toList(),
        'tier_prices': tierPrices,
        'custom_attributes': customAttributes?.map((e) => e.toJson()).toList()
      };
}

class ExtensionAttributes {
  final List<int>? websiteIds;
  final List<CategoryLinks>? categoryLinks;
  final List<ConfigurableProductOptions>? configurableProductOptions;
  final List<int>? configurableProductLinks;

  ExtensionAttributes({
    this.websiteIds,
    this.categoryLinks,
    this.configurableProductOptions,
    this.configurableProductLinks,
  });

  ExtensionAttributes.fromJson(Map<String, dynamic> json)
      : websiteIds = (json['website_ids'] as List?)
            ?.map((dynamic e) => e as int)
            .toList(),
        categoryLinks = (json['category_links'] as List?)
            ?.map((dynamic e) =>
                CategoryLinks.fromJson(e as Map<String, dynamic>))
            .toList(),
        configurableProductOptions = (json['configurable_product_options']
                as List?)
            ?.map((dynamic e) =>
                ConfigurableProductOptions.fromJson(e as Map<String, dynamic>))
            .toList(),
        configurableProductLinks = (json['configurable_product_links'] as List?)
            ?.map((dynamic e) => e as int)
            .toList();

  Map<String, dynamic> toJson() => {
        'website_ids': websiteIds,
        'category_links': categoryLinks?.map((e) => e.toJson()).toList(),
        'configurable_product_options':
            configurableProductOptions?.map((e) => e.toJson()).toList(),
        'configurable_product_links': configurableProductLinks
      };
}

class CategoryLinks {
  final int? position;
  final String? categoryId;

  CategoryLinks({
    this.position,
    this.categoryId,
  });

  CategoryLinks.fromJson(Map<String, dynamic> json)
      : position = json['position'] as int?,
        categoryId = json['category_id'] as String?;

  Map<String, dynamic> toJson() =>
      {'position': position, 'category_id': categoryId};
}

class ConfigurableProductOptions {
  final int? id;
  final String? attributeId;
  final String? label;
  final int? position;
  final List<Values>? values;
  final int? productId;

  ConfigurableProductOptions({
    this.id,
    this.attributeId,
    this.label,
    this.position,
    this.values,
    this.productId,
  });

  ConfigurableProductOptions.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        attributeId = json['attribute_id'] as String?,
        label = json['label'] as String?,
        position = json['position'] as int?,
        values = (json['values'] as List?)
            ?.map((dynamic e) => Values.fromJson(e as Map<String, dynamic>))
            .toList(),
        productId = json['product_id'] as int?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'attribute_id': attributeId,
        'label': label,
        'position': position,
        'values': values?.map((e) => e.toJson()).toList(),
        'product_id': productId
      };
}

class Values {
  final int? valueIndex;

  Values({
    this.valueIndex,
  });

  Values.fromJson(Map<String, dynamic> json)
      : valueIndex = json['value_index'] as int?;

  Map<String, dynamic> toJson() => {'value_index': valueIndex};
}

class MediaGalleryEntries {
  final int? id;
  final String? mediaType;
  final dynamic label;
  final int? position;
  final bool? disabled;
  final List<String>? types;
  final String? file;

  MediaGalleryEntries({
    this.id,
    this.mediaType,
    this.label,
    this.position,
    this.disabled,
    this.types,
    this.file,
  });

  MediaGalleryEntries.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        mediaType = json['media_type'] as String?,
        label = json['label'],
        position = json['position'] as int?,
        disabled = json['disabled'] as bool?,
        types =
            (json['types'] as List?)?.map((dynamic e) => e as String).toList(),
        file = json['file'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'media_type': mediaType,
        'label': label,
        'position': position,
        'disabled': disabled,
        'types': types,
        'file': file
      };
}

class CustomAttributes {
  final String? attributeCode;
  final dynamic value;

  CustomAttributes({
    this.attributeCode,
    this.value,
  });

  CustomAttributes.fromJson(Map<String, dynamic> json)
      : attributeCode = json['attribute_code'] as String?,
        value = json['value'] as dynamic;

  Map<String, dynamic> toJson() =>
      {'attribute_code': attributeCode, 'value': value};
}

class SearchCriteria {
  final List<FilterGroups>? filterGroups;

  SearchCriteria({
    this.filterGroups,
  });

  SearchCriteria.fromJson(Map<String, dynamic> json)
      : filterGroups = (json['filter_groups'] as List?)
            ?.map(
                (dynamic e) => FilterGroups.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'filter_groups': filterGroups?.map((e) => e.toJson()).toList()};
}

class FilterGroups {
  final List<Filters>? filters;

  FilterGroups({
    this.filters,
  });

  FilterGroups.fromJson(Map<String, dynamic> json)
      : filters = (json['filters'] as List?)
            ?.map((dynamic e) => Filters.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'filters': filters?.map((e) => e.toJson()).toList()};
}

class Filters {
  final String? field;
  final String? value;
  final String? conditionType;

  Filters({
    this.field,
    this.value,
    this.conditionType,
  });

  Filters.fromJson(Map<String, dynamic> json)
      : field = json['field'] as String?,
        value = json['value'] as String?,
        conditionType = json['condition_type'] as String?;

  Map<String, dynamic> toJson() =>
      {'field': field, 'value': value, 'condition_type': conditionType};
}
