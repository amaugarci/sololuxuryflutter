import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_field_open_sans.dart';
import 'package:solo_luxury/app/screens/search/widget/product.dart';
import 'package:solo_luxury/data/model/filter/filter_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/app_routes.dart';

import '../../../data/model/Product/product_model.dart';
import '../../../main.dart';
import '../../../utils/lang_directory/language_constant.dart';
import '../../components/common_widget/common_appbar.dart';
import '../../components/common_widget/common_button.dart';
import '../../components/common_widget/common_text_opensans.dart';
import '../../utils/app_asset.dart';
import '../../utils/colors.dart';
import '../product_listing/product_controller.dart';

class ProductListScreen extends GetView<ProductController> {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        key: controller.scaffoldKey.value,
        resizeToAvoidBottomInset: false,
        backgroundColor: backGroundColor,
        appBar: commonAppbar(),
        body: controller.isLoading.value
            ? Center(
                child: SpinKitThreeBounce(
                color: appColor,
                // size: 50.0,
              ))
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.5),
                child: controller.isFilter.value
                    ? filter()
                    : Column(children: [
                        filterWidget(),
                        const SizedBox(height: 15),
                        filterDropDown(),
                        const SizedBox(height: 30),
                        Expanded(
                          child: products(context),
                        ),
                      ]))));
  }

  Widget filterWidget() {
    return Container(
      height: 47,
      color: secondaryColor,
      width: Get.width,
      child: Row(
        children: [
          const SizedBox(width: 10),
          Text(
            "${Get.arguments[1]}",
            style: const TextStyle(
              color: appColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              // Get.toNamed(RoutesConstants.filterScreen);
              controller.isFilter.value = true;
            },
            child: Container(
              color: appColor,
              width: 166,
              height: 47,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppAsset.filter,
                    width: 18.0,
                    height: 18.0,
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  const Text(
                    'FILTER',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget filterDropDown() {
    return Container(
      height: 50,
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: appColor, width: 1.4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Newest First',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w300,
                color: Colors.black),
          ),
          Icon(
            Icons.expand_more,
            color: appColor,
          ),
        ],
      ),
    );
  }

  Widget filter() {
    return Container(
      height: MediaQuery.of(Get.context!).size.height,
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              // decoration: BoxDecoration(
              //     border: Border.all(width: 1, color: brownColor)),
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    height: 400,
                    decoration: const BoxDecoration(color: lightBrownColor),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        //Header
                        filterHeader(),
                        const SizedBox(height: 20),
                        //Filter Widget
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: filterBorderColor)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                category(),
                                subCategory(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Container(
            width: Get.width,
            height: 40.0,
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: CommonButton(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              buttonType: ButtonType.ElevatedButton,
              onPressed: () {},
              elevation: 0.0,
              color: appColorButton,
              borderRadius: 0.0,
              child: CommonTextOpenSans(
                LanguageConstant.applyText.tr,
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget products(context) {
    return Obx(() => GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 12.5,
            childAspectRatio: 0.55,
          ),
          itemBuilder: (_, index) {
            Item? item = controller.productModel?.value.items?[index];
            if (item == null) {
              return Container();
            } else {
              return GestureDetector(
                onTap: () {
                  // Get.toNamed(RoutesConstants.productDetailsScreen,
                  //     arguments: [item]);
                },
                child: Container(
                  width: 150,
                  color: backGroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 210,
                        //padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: appColor,
                            width: 1.4,
                          ),
                        ),
                        child: Stack(
                          //mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.network(
                              "${AppConstants.productImageUrl}${item.getProductImage()}",
                              height: 210,
                              width: 210,
                              fit: BoxFit.fill,
                            ),
                            InkWell(
                              onTap: () {
                                if (item.isWishList.value) {
                                  controller.deleteWishListData(
                                      context,
                                      item.name,
                                      item.customAttributes![1].value,
                                      item.sku,
                                      item.id,
                                      index);
                                  print("@@@@@@${item.isWishList.value}");
                                } else {
                                  controller.postAddToWishlistData(
                                      context,
                                      item.name,
                                      item.customAttributes![1].value,
                                      item.sku,
                                      index);
                                  print("@@@@@@${item.isWishList.value}");
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: favoriteOrNot(item)
                                    //  item.isWishList.value
                                    //     ? Icon(
                                    //         Icons.favorite,
                                    //         color: appColor,
                                    //       )
                                    //     : SvgPicture.asset(
                                    //         AppAsset.heart,
                                    //         height: 14,
                                    //         color: appColor,
                                    //       )
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "${item.getBrandName()}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "${item.name}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '${localStore.currentCurrency}' +
                                "${item.getPriceFromConfigurableProduct(controller.productModel?.value.items, item)}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 50),
                          Text(
                            '\$' + "${item.price}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black45,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
          },
          itemCount: controller.productModel?.value.items?.length,
        ));
  }

  filterHeader() {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: CommonTextOpenSans(LanguageConstant.filtersText.tr,
                color: appColor, fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        InkWell(
          onTap: () {
            controller.isFilter.value = false;
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.close,
              size: 25.0,
              color: appColor,
            ),
          ),
        )
      ],
    );
  }

  Widget favoriteOrNot(Item item) {
    return Obx(
      () => item.isWishList.value
          ? Icon(
              Icons.favorite,
              color: appColor,
            )
          : SvgPicture.asset(
              AppAsset.heart,
              height: 14,
              color: appColor,
            ),
    );
  }

  Widget category() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: filterBorderColor)),
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(
            left: 10.0, right: 5.0, top: 10.0, bottom: 10.0),
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.filterList.length,
            itemBuilder: (_, index) {
              controller.filterModel!.value =
                  FilterModel.fromJson(controller.filterList[index]);
              if (controller.filterModel == null) {
                return Container();
              }
              return categoryWidget(controller.filterModel!.value, index);
            }),
      ),
    );
  }

  Widget categoryWidget(FilterModel item, int index) {
    return Obx(() => GestureDetector(
          onTap: () {
            controller.changedData(index);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: controller.currentCategoryIndex.value == index
                    ? backGroundColor
                    : lightBrownColor),
            width: Get.width,
            height: 40,
            child: Align(
              alignment: Alignment.centerLeft,
              child: CommonTextOpenSans("${item.attrLabel}",
                  fontSize: 16, fontWeight: FontWeight.w400, color: appColor),
            ),
          ),
        ));
  }

  Widget subCategory() {
    return Expanded(
      child: Container(
          margin: const EdgeInsets.only(
              left: 5.0, right: 10.0, top: 10.0, bottom: 10.0),
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: filterBorderColor)),
          child: subCategoryWidget()),
    );
  }

  Widget subCategoryWidget() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: filterBorderColor)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 10.0,
                ),
                Container(
                  child: Image.asset(
                    AppAsset.search1,
                    color: filterBorderColor,
                    height: 18.0,
                    width: 18.0,
                  ),
                ),
                Expanded(
                  child: CommonTextFieldOpenSans(
                    height: 35.0,
                    hintText: LanguageConstant.searchText.tr,
                    controller: controller.searchEditingController.value,
                    textFieldBorder: Border.all(color: Colors.transparent),
                    textColor: appTextFieldHintColor,
                    fontWeight: FontWeight.w600,
                    onChanged: (val) {
                      print("onChanged -> $val");
                      controller.searchFilter(val);
                    },
                  ),
                ),
              ],
            )),
        Expanded(
          child: ListView(
            children: [
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  primary: false,
                  // <- add
                  itemCount: controller.subCategoryList!.length,
                  itemBuilder: (BuildContext context, int index) {
                    Category category = controller.subCategoryList![index];
                    return InkWell(
                      onTap: () {
                        category.isSelected.value = !category.isSelected.value;
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Obx(() => Container(
                                  height: 24.0,
                                  width: 24.0,
                                  alignment: Alignment.centerLeft,
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        category.isSelected.value
                                            ? AppAsset.checked
                                            : AppAsset.unchecked,
                                        height: 18.0,
                                        width: 18.0,
                                      ),
                                    ],
                                  ),
                                )),
                            Expanded(
                              child: CommonTextOpenSans(
                                category.display,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
