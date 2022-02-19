class MenuModel {
  int? id;
  int? parentId;
  String? name;
  bool? isActive;
  int? position;
  int? level;
  int? productCount;
  List<ChildrenData>?   childrenData;

  MenuModel(
      {id,
        parentId,
        name,
        isActive,
        position,
        level,
        productCount,
        childrenData});

  MenuModel.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'];
    isActive = json['is_active'];
    position = json['position'];
    level = json['level'];
    productCount = json['product_count'];
    if (json['children_data'] != null) {
      childrenData = <ChildrenData>[];
      json['children_data'].forEach((v) {
        childrenData!.add(ChildrenData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parent_id'] = parentId;
    data['name'] = name;
    data['is_active'] = isActive;
    data['position'] = position;
    data['level'] = level;
    data['product_count'] = productCount;
    if (childrenData != null) {
      data['children_data'] =
          childrenData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChildrenData {
  int? id;
  int? parentId;
  String? name;
  bool? isActive;
  int? position;
  int? level;
  int? productCount;
  List<MenuModel>? childrenData;

  ChildrenData(
      {id,
        parentId,
        name,
        isActive,
        position,
        level,
        productCount,
        childrenData});

  ChildrenData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'];
    isActive = json['is_active'];
    position = json['position'];
    level = json['level'];
    productCount = json['product_count'];
    if (json['children_data'] != null) {
      childrenData = <MenuModel>[];
      json['children_data'].forEach((v) {
        childrenData!.add(MenuModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parent_id'] = parentId;
    data['name'] = name;
    data['is_active'] = isActive;
    data['position'] = position;
    data['level'] = level;
    data['product_count'] = productCount;
    if (childrenData != null) {
      data['children_data'] =
          childrenData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}