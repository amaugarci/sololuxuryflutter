import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_button.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_field_open_sans.dart';
import 'package:solo_luxury/app/screens/wishlist/wishlist_controller.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/main.dart';
import 'package:solo_luxury/utils/app_routes.dart';
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
          body: Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(Get.context!).viewPadding.top),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: wishListBorder),
                    ),
                    height: 40,
                    margin: EdgeInsets.only(left: 20, right: 20),
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
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
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
                        icon: Icon(Icons.expand_more, color: appColorPrimary),
                        hint: Center(
                          child: Text(
                            LanguageConstant.myWishlistText.tr,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: appColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        onChanged: (String? value) {
                          controller.chosenValue.value = value!;
                        },
                      ),
                    ),
                  ),
                  listItem(context)
                ],
              ),
            ),
          ),
        ));
  }

  Widget listItem(context) {
    if (controller.wishItemModel?.value.items == null) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        width: Get.width,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.wishItemModel?.value.items?.length,
          // itemCount:1,
          itemBuilder: (_, index) {
            Item? item = controller.wishItemModel?.value.items?[index];
            return GestureDetector(
                onTap: () {
                  Get.toNamed(RoutesConstants.productDetailsScreen,
                      arguments: [item]);
                },
                child: Column(
                  children: [
                    Container(
                      height: 340,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      width: Get.width,
                      child: Image.network(
                        "${AppConstants.productImageUrl}${item!.product!.customAttributes!.first.value}",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.only(
                          right: 20, left: 20, top: 20, bottom: 30),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: backgroundticket,
                        boxShadow: [
                          BoxShadow(
                            color: blackColor.withOpacity(0.10),
                            blurRadius: 25,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            "${item.product!.name}",
                            style: commonTextStyle400(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${localStore.getRegularPriceWithCurrency(item.product!.price.toStringAsFixed(2), item.product!.price!)}",
                              style: commonTextStyle600(),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    LanguageConstant.qtyText.tr,
                                    style: commonTextStyle400(),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 50,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${item.product!.status}",
                                      style: commonTextStyle400(),
                                    ),
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      border: Border.all(
                                        color: appTextFieldHintColor,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      controller.getGenerateCart(
                                        context,
                                        item.product!.name!,
                                        "${item.product!.customAttributes![1].value}",
                                        item.product!.sku,
                                      );
                                    },
                                    height: 30,
                                    child: Text(
                                      LanguageConstant.addTOCart.tr
                                          .toUpperCase(),
                                      style: commonTextStyle600(
                                        color: whiteColor,
                                        size: 14.0,
                                      ),
                                    ),
                                    elevation: 0,
                                    minWidth: 119,
                                    color: addToCartColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  // Image(
                                  //   image: AssetImage(AppAsset.edit),
                                  // ),
                                  // SizedBox(
                                  //   width: 25,
                                  // ),
                                  InkWell(
                                    onTap: () {
                                      controller.deleteWishListData(
                                        context,
                                        item.product!.name!,
                                        "${item.product!.customAttributes![1].value}",
                                        item.product!.sku,
                                        item.id,
                                      );
                                    },
                                    child: Image(
                                      image: AssetImage(AppAsset.delete),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ));
          },
        ),
      ),
    );
  }

  commonTextStyle400({var size}) {
    return TextStyle(
      color: blackColor,
      fontSize: size ?? 16,
      fontWeight: FontWeight.w400,
      fontFamily: AppConstants.fontOpenSans,
    );
  }

  commonTextStyle600({var size, var color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontSize: size ?? 16,
      fontWeight: FontWeight.w600,
      fontFamily: AppConstants.fontOpenSans,
    );
  }
}
