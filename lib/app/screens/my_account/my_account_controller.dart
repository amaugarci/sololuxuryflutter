import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/data/model/myAccount/my_account_model.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/my_account_api_repository.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

class MyAccountController extends GetxController {
  Rx<Color> backgroundColorValue = const Color(0xffF7E8E1).obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  RxString chosenValue = LanguageConstant.myAccountText.tr.obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  var myAccountModel = MyAccountDetails().obs;
  RxBool isLoading = true.obs;

  List<String> data = [
    LanguageConstant.myAccountText.tr,
    LanguageConstant.myOrdersText.tr,
    LanguageConstant.myWishlistText.tr,
    LanguageConstant.addressBookText.tr,
    LanguageConstant.accountInformationText.tr,
    LanguageConstant.myTicketsText.tr,
  ];

  @override
  void onInit() {
    super.onInit();
    getMyAccountDataFromApi();
  }

  /* getMyAccountDataFromApi() async {
   /*  myAccountModel =
        (await myAccountAPIRepository.getMyAccountApiResponse()).obs;*/


    log("homePageManagerResponseModel : ${myAccountModel.value}");
    isLoading.value = false;
    print("getMenuDataFromApi ->############### ${myAccountModel.value}");
  }*/

  Future<void> getMyAccountDataFromApi() async {
    isLoading(true);
    try {
      var listingCategories = await MyAccountAPIRepository().myAccountsApi();
      if (listingCategories != null) {
        isLoading(false);
        myAccountModel(listingCategories);
      }
      print(myAccountModel.value.email);
    } catch (e) {
      isLoading(false);
    }
  }
}
