import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_button.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_field_open_sans.dart';
import 'package:solo_luxury/app/screens/wishlist/wishlist_controller.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

import '../../../data/model/Wishlist/wishlist_model.dart';
import '../../../utils/app_constants.dart';
import '../../components/common_widget/common_appbar.dart';
import '../../components/common_widget/common_text_opensans.dart';
import '../../utils/app_asset.dart';
import 'widget/wishlist_item.dart';

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
            height: Get.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(Get.context!).viewPadding.top),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: wishListBorder),
                          ),
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(5),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isDense: true,
                              alignment: AlignmentDirectional.center,
                              isExpanded: true,
                              dropdownColor: offWhite,
                              value: controller.chosenValue.value,
                              // elevation: 0,
                              style: const TextStyle(
                                  color: appColorPrimary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: AppConstants.fontOpenSans),
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
                        listItem()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget listItem() {
    if (controller.wishItemModel?.value.items == null) {
      return Container();
    }
    return Container(
      width: Get.width,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.wishItemModel?.value.items?.length,
        itemBuilder: (_, index) {
          Item? item = controller.wishItemModel?.value.items?[index];
          return WishlistItem(item: item,);
        },
      ),
    );
  }
}
