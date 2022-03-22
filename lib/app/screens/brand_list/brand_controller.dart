import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:collection/collection.dart";
import 'package:solo_luxury/data/model/brand_list/brand_model.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/brand_list_api_repository.dart';

class BrandController extends GetxController {
  Rx<Color> backgroundColorValue = const Color(0xffF7E8E1).obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey2 = GlobalKey<ScaffoldState>().obs;

  RxList<BrandModel>? getbrandList = <BrandModel>[].obs;
  RxList<BrandModel>? getsearchList = <BrandModel>[].obs;
  var brandList = <BrandModel>[].obs;
  var isLoading = true.obs;
  var filtersearchAlllist = [].obs;
  var lista = "A".obs;
  RxInt index = 0.obs;

  List filterList =
      ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M"].obs;
  List filterList2 =
      ["N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"].obs;
  List filterList3 = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].obs;

  var brandDetails = "".obs;
  List nAList = [].obs;
  List nBList = [].obs;
  List nCList = [].obs;
  List nDList = [].obs;
  List nEList = [].obs;
  List nFList = [].obs;
  List nGList = [].obs;
  List nHList = [].obs;
  List nIList = [].obs;
  List nJList = [].obs;
  List nKList = [].obs;
  List nLList = [].obs;
  List nMList = [].obs;
  List nNList = [].obs;
  List nOList = [].obs;
  List nPList = [].obs;
  List nQList = [].obs;
  List nRList = [].obs;
  List nSList = [].obs;
  List nTList = [].obs;
  List nUList = [].obs;
  List nVList = [].obs;
  List nWList = [].obs;
  List nXList = [].obs;
  List nYList = [].obs;
  List nZList = [].obs;
  List n0List = [].obs;
  List n1List = [].obs;
  List n2List = [].obs;
  List n3List = [].obs;
  List n4List = [].obs;
  List n5List = [].obs;
  List n6List = [].obs;
  List n7List = [].obs;
  List n8List = [].obs;
  List n9List = [].obs;

  onChnageFunction(value) {
    lista.value = "n${value}List";
  }

  var filterAlllist = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9"
  ].obs;

  List testList = [].obs;
  @override
  BrandListAPIRepository brandListAPIRepository;
  String? countryCode;

  BrandController({required this.brandListAPIRepository, this.countryCode});
  @override
  void onInit() {
    getBrandList();
    super.onInit();
  }

//CountrList
  getBrandList() async {
    isLoading.value = true;
    var brandList =
        jsonDecode(await brandListAPIRepository.getBrandListResponse());
    getbrandList!.value = List<BrandModel>.from(
        brandList.map((brandList) => BrandModel.fromJson(brandList)));
    getbrandList!
        .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    print("brands list Get $getbrandList");

    // //////////////////////////////////////////////////
    for (var i in filterAlllist) {
      for (var f in getbrandList!) {
        if (f.name[0] != null || f.name[0] != "") {
          if (f.name[0] == "a".toLowerCase() ||
              f.name[0] == "A".toUpperCase()) {
            nAList.add(f.name);
          } else if (f.name[0] == "b".toLowerCase() ||
              f.name[0] == "B".toUpperCase()) {
            nBList.add(f.name);
          } else if (f.name[0] == "c".toLowerCase() ||
              f.name[0] == "C".toUpperCase()) {
            nCList.add(f.name);
          } else if (f.name[0] == "d".toLowerCase() ||
              f.name[0] == "D".toUpperCase()) {
            nDList.add(f.name);
          } else if (f.name[0] == "e".toLowerCase() ||
              f.name[0] == "E".toUpperCase()) {
            nEList.add(f.name);
          } else if (f.name[0] == "f".toLowerCase() ||
              f.name[0] == "F".toUpperCase()) {
            nFList.add(f.name);
          } else if (f.name[0] == "g".toLowerCase() ||
              f.name[0] == "G".toUpperCase()) {
            nGList.add(f.name);
          } else if (f.name[0] == "h".toLowerCase() ||
              f.name[0] == "H".toUpperCase()) {
            nHList.add(f.name);
          } else if (f.name[0] == "i".toLowerCase() ||
              f.name[0] == "I".toUpperCase()) {
            nIList.add(f.name);
          } else if (f.name[0] == "j".toLowerCase() ||
              f.name[0] == "J".toUpperCase()) {
            nJList.add(f.name);
          } else if (f.name[0] == "k".toLowerCase() ||
              f.name[0] == "K".toUpperCase()) {
            nKList.add(f.name);
          } else if (f.name[0] == "l".toLowerCase() ||
              f.name[0] == "L".toUpperCase()) {
            nLList.add(f.name);
          } else if (f.name[0] == "m".toLowerCase() ||
              f.name[0] == "M".toUpperCase()) {
            nMList.add(f.name);
          } else if (f.name[0] == "n".toLowerCase() ||
              f.name[0] == "N".toUpperCase()) {
            nNList.add(f.name);
          } else if (f.name[0] == "o".toLowerCase() ||
              f.name[0] == "O".toUpperCase()) {
            nOList.add(f.name);
          } else if (f.name[0] == "p".toLowerCase() ||
              f.name[0] == "P".toUpperCase()) {
            nPList.add(f.name);
          } else if (f.name[0] == "q".toLowerCase() ||
              f.name[0] == "Q".toUpperCase()) {
            nQList.add(f.name);
          } else if (f.name[0] == "r".toLowerCase() ||
              f.name[0] == "R".toUpperCase()) {
            nRList.add(f.name);
          } else if (f.name[0] == "s".toLowerCase() ||
              f.name[0] == "S".toUpperCase()) {
            nSList.add(f.name);
          } else if (f.name[0] == "t".toLowerCase() ||
              f.name[0] == "T".toUpperCase()) {
            nTList.add(f.name);
          } else if (f.name[0] == "u".toLowerCase() ||
              f.name[0] == "U".toUpperCase()) {
            nUList.add(f.name);
          } else if (f.name[0] == "v".toLowerCase() ||
              f.name[0] == "V".toUpperCase()) {
            nVList.add(f.name);
          } else if (f.name[0] == "W".toLowerCase() ||
              f.name[0] == "W".toUpperCase()) {
            nWList.add(f.name);
          } else if (f.name[0] == "x".toLowerCase() ||
              f.name[0] == "X".toUpperCase()) {
            nXList.add(f.name);
          } else if (f.name[0] == "y".toLowerCase() ||
              f.name[0] == "Y".toUpperCase()) {
            nYList.add(f.name);
          } else if (f.name[0] == "z".toLowerCase() ||
              f.name[0] == "Z".toUpperCase()) {
            nZList.add(f.name);
          } else if (f.name[0].toString() == "0") {
            n0List.add(f.name);
          } else if (f.name[0].toString() == "1") {
            n1List.add(f.name);
          } else if (f.name[0].toString() == "2") {
            n2List.add(f.name);
          } else if (f.name[0].toString() == "3") {
            n3List.add(f.name);
          } else if (f.name[0].toString() == "4") {
            n4List.add(f.name);
          } else if (f.name[0].toString() == "5") {
            n5List.add(f.name);
          } else if (f.name[0].toString() == "6") {
            n6List.add(f.name);
          } else if (f.name[0].toString() == "7") {
            n7List.add(f.name);
          } else if (f.name[0].toString() == "8") {
            n8List.add(f.name);
          } else if (f.name[0].toString() == "9") {
            n9List.add(f.name);
          }
        }
      }
    }
    print("List Of Alphabet $nAList");
    isLoading.value = false;
  }

  //getSearch
  onSearchTextChanged(String text) async {
    print("Text is $text");
    getbrandList!.forEach((userDetail) {
      if (userDetail.name.contains(text)) {
        getsearchList!.add(userDetail);
      }
    });
    getsearchList!
        .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  }

  listDisplay(alphabet) {
    switch (alphabet.toString()) {
      case "A":
        return nAList;
      case "B":
        return nBList;
      case "C":
        return nCList;
      case "D":
        return nDList;
      case "E":
        return nEList;
      case "F":
        return nFList;
      case "G":
        return nGList;
      case "H":
        return nHList;
      case "I":
        return nIList;
      case "J":
        return nJList;
      case "K":
        return nKList;
      case "L":
        return nLList;
      case "M":
        return nMList;
      case "N":
        return nNList;
      case "O":
        return nOList;
      case "P":
        return nPList;
      case "Q":
        return nQList;
      case "R":
        return nRList;
      case "S":
        return nSList;
      case "T":
        return nTList;
      case "U":
        return nUList;
      case "V":
        return nVList;
      case "W":
        return nWList;
      case "X":
        return nXList;
      case "Y":
        return nYList;
      case "Z":
        return nZList;
      case "0":
        return n0List;
      case "1":
        return n1List;
      case "2":
        return n2List;
      case "3":
        return n3List;
      case "4":
        return n4List;
      case "5":
        return n5List;
      case "6":
        return n6List;
      case "7":
        return n7List;
      case "8":
        return n8List;
      case "9":
        return n9List;
      default:
        return nAList;
    }
  }

  //Loading Widgets
  setSerchwithAlphabatic(value) {
    isLoading.value = true;
    if (value == "") {
      filtersearchAlllist.clear();
      isLoading.value = false;
    } else {
      Future.delayed(const Duration(milliseconds: 500), () {
        filtersearchAlllist.clear();
        filtersearchAlllist.add("$value");
        isLoading.value = false;
      });
    }
  }
}
