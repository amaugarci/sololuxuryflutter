import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/wishlist/widget/wishlist_item.dart';
import 'package:solo_luxury/app/screens/wishlist/wishlist_controller.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

import '../../../data/model/Product/product_model.dart';
import '../../components/common_widget/common_appbar.dart';

class MyWishListPage extends GetView<WishlistController> {
  MyWishListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          key: controller.scaffoldkey,
          appBar: commonAppbar(title: LanguageConstant.myWishlistText.tr),
          backgroundColor: backGroundColor,
          body: SizedBox(
            width: Get.width,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(Get.context!).viewPadding.top + 45.0),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: appColor),
                          ),
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(5),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              alignment: AlignmentDirectional.center,
                              isExpanded: true,
                              dropdownColor: offWhite,
                              value: controller.chosenValue.value,
                              // elevation: 0,
                              style: TextStyle(color: appColor, fontSize: 14, fontWeight: FontWeight.w600),
                              items: <String>[
                                LanguageConstant.myAccountText.tr,
                                LanguageConstant.myOrdersText.tr,
                                LanguageConstant.myWishlistText.tr,
                                LanguageConstant.addressBookText.tr,
                                LanguageConstant.accountInformationText.tr,
                                LanguageConstant.myTicketsText.tr,
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  alignment: AlignmentDirectional.center,
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              hint: Center(
                                child: Text(
                                  LanguageConstant.myWishlistText.tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: appColor, fontSize: 14, fontWeight: FontWeight.w600),
                                ),
                              ),
                              onChanged: (String? value) {
                                controller.chosenValue.value = value!;
                              },
                            ),
                          ),
                        ),
                        FutureBuilder<List<ProductModel>>(
                          future: controller.getWishlistProducts(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Expanded(
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemBuilder: (_, index) {
                                    return WishlistItem(product: controller.wishlistProductList[index]);
                                  },
                                  itemCount: controller.wishlistProductList.value.length,
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
