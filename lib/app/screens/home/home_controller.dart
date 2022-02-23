import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/data/model/Home/menu_model.dart';
import 'package:solo_luxury/utils/repository/network_repository.dart';

class HomeController extends GetxController {

  RxInt index = 0.obs;
  RxObjectMixin? menuModel = MenuModel().obs;

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  @override
  void onInit() {
    super.onInit();
    getMenuDataFromApi();
  }

  getMenuDataFromApi() async {
    menuModel!.value = await NetworkRepository().getMenu();
  }
}