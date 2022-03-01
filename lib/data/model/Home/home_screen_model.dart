import 'package:solo_luxury/data/model/business/my_business_model.dart';

class HomeScreenModel {
  int? status;
  String? message;
  Data? data;

  HomeScreenModel({this.status, this.message, this.data});

  HomeScreenModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<HomeCategory>? homeCategory;
  List<Poster>? poster;
  List<NearStore>? nearStore;
  List<PopularStore>? popularStore;

  Data({this.homeCategory, this.poster, this.nearStore, this.popularStore});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['category'] != null) {
      homeCategory = <HomeCategory>[];
      json['category'].forEach((v) {
        homeCategory!.add(new HomeCategory.fromJson(v));
      });
    }
    if (json['poster'] != null) {
      poster = <Poster>[];
      json['poster'].forEach((v) {
        poster!.add(new Poster.fromJson(v));
      });
    }
    if (json['nearStore'] != null) {
      nearStore = <NearStore>[];
      json['nearStore'].forEach((v) {
        nearStore!.add(new NearStore.fromJson(v));
      });
    }
    if (json['popularStore'] != null) {
      popularStore = <PopularStore>[];
      json['popularStore'].forEach((v) {
        popularStore!.add(new PopularStore.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.homeCategory != null) {
      data['category'] = this.homeCategory!.map((v) => v.toJson()).toList();
    }
    if (this.poster != null) {
      data['poster'] = this.poster!.map((v) => v.toJson()).toList();
    }
    if (this.nearStore != null) {
      data['nearStore'] = this.nearStore!.map((v) => v.toJson()).toList();
    }
    if (this.popularStore != null) {
      data['popularStore'] = this.popularStore!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeCategory {
  String? image;
  String? sId;
  String? name;

  HomeCategory({this.image, this.sId, this.name});

  HomeCategory.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}

class Poster {
  String? image;
  String? sId;
  String? message;

  Poster({this.image, this.sId, this.message});

  Poster.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    sId = json['_id'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['_id'] = this.sId;
    data['message'] = this.message;
    return data;
  }
}

class NearStore {
  String? sId;
  String? storeName;
  String? storeImage;
  List<Category>? category;
  bool? isCollect;

  NearStore({this.sId, this.storeName, this.storeImage, this.category});

  NearStore.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    storeName = json['storeName'];
    storeImage = json['storeImage'];
    category = json["category"] == null
        ? null
        : List<Category>.from(
        json["category"].map((x) => Category.fromJson(x)));
    isCollect = json['isCollect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['storeName'] = this.storeName;
    data['storeImage'] = this.storeImage;
    data['category'] = this.category;
    data['isCollect'] = this.isCollect;
    return data;
  }
}

class PopularStore {
  String? sId;
  String? storeName;
  String? storeImage;
  List<Category>? category;
  bool? isCollect;

  PopularStore({this.sId, this.storeName, this.storeImage, this.category});

  PopularStore.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    storeName = json['storeName'];
    storeImage = json['storeImage'];
    category = json["category"] == null
        ? null
        : List<Category>.from(
        json["category"].map((x) => Category.fromJson(x)));
    isCollect = json['isCollect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['storeName'] = this.storeName;
    data['storeImage'] = this.storeImage;
    data['category'] = this.category;
    data['isCollect'] = this.isCollect;
    return data;
  }
}