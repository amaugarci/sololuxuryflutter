class SearchModel {
  final List<Items>? items;
  final Aggregations? aggregations;
  final SearchCriteria? searchCriteria;
  final int? totalCount;

  SearchModel({
    this.items,
    this.aggregations,
    this.searchCriteria,
    this.totalCount,
  });

  SearchModel.fromJson(Map<String, dynamic> json)
      : items = (json['items'] as List?)?.map((dynamic e) => Items.fromJson(e as Map<String,dynamic>)).toList(),
        aggregations = (json['aggregations'] as Map<String,dynamic>?) != null ? Aggregations.fromJson(json['aggregations'] as Map<String,dynamic>) : null,
        searchCriteria = (json['search_criteria'] as Map<String,dynamic>?) != null ? SearchCriteria.fromJson(json['search_criteria'] as Map<String,dynamic>) : null,
        totalCount = json['total_count'] as int?;

  Map<String, dynamic> toJson() => {
    'items' : items?.map((e) => e.toJson()).toList(),
    'aggregations' : aggregations?.toJson(),
    'search_criteria' : searchCriteria?.toJson(),
    'total_count' : totalCount
  };
}

class Items {
  final int? id;
  final List<CustomAttributes>? customAttributes;

  Items({
    this.id,
    this.customAttributes,
  });

  Items.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        customAttributes = (json['custom_attributes'] as List?)?.map((dynamic e) => CustomAttributes.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'id' : id,
    'custom_attributes' : customAttributes?.map((e) => e.toJson()).toList()
  };
}

class CustomAttributes {
  final String? attributeCode;
  final String? value;

  CustomAttributes({
    this.attributeCode,
    this.value,
  });

  CustomAttributes.fromJson(Map<String, dynamic> json)
      : attributeCode = json['attribute_code'] as String?,
        value = json['value'] as String?;

  Map<String, dynamic> toJson() => {
    'attribute_code' : attributeCode,
    'value' : value
  };
}

class Aggregations {
  final List<Buckets>? buckets;
  final List<String>? bucketNames;

  Aggregations({
    this.buckets,
    this.bucketNames,
  });

  Aggregations.fromJson(Map<String, dynamic> json)
      : buckets = (json['buckets'] as List?)?.map((dynamic e) => Buckets.fromJson(e as Map<String,dynamic>)).toList(),
        bucketNames = (json['bucket_names'] as List?)?.map((dynamic e) => e as String).toList();

  Map<String, dynamic> toJson() => {
    'buckets' : buckets?.map((e) => e.toJson()).toList(),
    'bucket_names' : bucketNames
  };
}

class Buckets {
  final String? name;
  final List<Values>? values;

  Buckets({
    this.name,
    this.values,
  });

  Buckets.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        values = (json['values'] as List?)?.map((dynamic e) => Values.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'name' : name,
    'values' : values?.map((e) => e.toJson()).toList()
  };
}

class Values {
  final String? value;
  final List<String>? metrics;

  Values({
    this.value,
    this.metrics,
  });

  Values.fromJson(Map<String, dynamic> json)
      : value = json['value'] as String?,
        metrics = (json['metrics'] as List?)?.map((dynamic e) => e as String).toList();

  Map<String, dynamic> toJson() => {
    'value' : value,
    'metrics' : metrics
  };
}

class SearchCriteria {
  final String? requestName;
  final List<FilterGroups>? filterGroups;

  SearchCriteria({
    this.requestName,
    this.filterGroups,
  });

  SearchCriteria.fromJson(Map<String, dynamic> json)
      : requestName = json['request_name'] as String?,
        filterGroups = (json['filter_groups'] as List?)?.map((dynamic e) => FilterGroups.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'request_name' : requestName,
    'filter_groups' : filterGroups?.map((e) => e.toJson()).toList()
  };
}

class FilterGroups {
  final List<Filters>? filters;

  FilterGroups({
    this.filters,
  });

  FilterGroups.fromJson(Map<String, dynamic> json)
      : filters = (json['filters'] as List?)?.map((dynamic e) => Filters.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'filters' : filters?.map((e) => e.toJson()).toList()
  };
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

  Map<String, dynamic> toJson() => {
    'field' : field,
    'value' : value,
    'condition_type' : conditionType
  };
}