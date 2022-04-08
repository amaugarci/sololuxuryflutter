import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_field_open_sans.dart';
import 'package:solo_luxury/data/model/filter/filter_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/app_routes.dart';

import '../../../data/model/Product/product_model.dart';
import '../../../main.dart';
import '../../../utils/lang_directory/language_constant.dart';
import '../../components/common_widget/common_appbar.dart';
import '../../components/common_widget/common_button.dart';
import '../../components/common_widget/common_text_opensans.dart';
import '../../components/common_widget/common_text_poppins.dart';
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
        appBar: commonAppbar(
            title: "${Get.arguments[1]}",
            centerTitle: false,
            useAnotherTextStyle: true),
        body: controller.isLoading.value
            ? const Center(
                child: SpinKitThreeBounce(
                color: appColor,
                // size: 50.0,
              ))
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.5),
                child: Column(children: [
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
      width: Get.width,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 47,
              margin: const EdgeInsets.only(right: 5),
              // padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: backGroundColor.withOpacity(0.2),
                  border: Border.all(color: appColor, width: 1.5)),
              child: MaterialButton(
                onPressed: () {
                  showGeneralDialog(
                    context: Get.context!,
                    barrierColor: Colors.black12.withOpacity(0.6),
                    // Background color
                    barrierDismissible: false,
                    barrierLabel: 'Dialog',
                    transitionDuration: Duration(milliseconds: 400),
                    pageBuilder: (_, __, ___) {
                      return sort();
                    },
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAsset.sort,
                      width: 18.0,
                      height: 18.0,
                      color: appColor,
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    const Text(
                      'SORT',
                      style: TextStyle(
                        color: appColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 5),
              height: 47,
              decoration: BoxDecoration(
                  color: backGroundColor.withOpacity(0.2),
                  border: Border.all(color: appColor, width: 1.5)),
              child: MaterialButton(
                onPressed: () {
                  // Get.toNamed(RoutesConstants.filterScreen);
                  // controller.getSortedProducts();
                  showGeneralDialog(
                    context: Get.context!,
                    barrierColor: Colors.black12.withOpacity(0.6),
                    // Background color
                    barrierDismissible: false,
                    barrierLabel: 'Dialog',
                    transitionDuration: Duration(milliseconds: 400),
                    pageBuilder: (_, __, ___) {
                      return filter();
                    },
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAsset.filter,
                      width: 18.0,
                      height: 18.0,
                      color: appColor,
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    const Text(
                      'FILTER',
                      style: TextStyle(
                        color: appColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
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

  Widget sort() {
    return Scaffold(
      appBar: commonAppbarDialog(
        title: "Sort by",
      ),
      backgroundColor: Colors.white,
      body: Obx(() {
        return Column(
          children: [
            Divider(
              color: Colors.black,
              thickness: 1.5,
            ),
            ...List.generate(
                controller.sortTypeList.length,
                (index) => InkWell(
                      onTap: () {
                        controller.selectedSortIndex.value = index;
                        controller.selectedSortVal.value =
                            controller.sortTypeList[index];
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 20.0,
                            right: 30,
                            top: index == 0 ? 25 : 15,
                            bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.sortTypeList.value[index].name,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: appColor),
                            ),
                            Container(
                              height: 18,
                              width: 18,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: appColor, width: 2)),
                              child: Container(
                                margin: EdgeInsets.all(2.2),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: controller.selectedSortIndex.value ==
                                            index
                                        ? appColor
                                        : Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
          ],
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        padding: EdgeInsets.zero,
        color: appColorButton,
        child: MaterialButton(
          onPressed: () {
            controller.getSortedProducts();
            Get.back();
          },
          child: CommonTextPoppins(
            LanguageConstant.applyText.tr,
            fontSize: 18.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget filter() {
    return Material(
      child: Container(
        height: Get.height,
        width: Get.width,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            commonAppbarDialog(title: "Filters", onTapRefresh: () {}),
            Expanded(
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  category(),
                  subCategory(),
                ],
              ),
            ),
            Container(
              width: Get.width,
              height: 40.0,
              margin:
                  const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
              child: CommonButton(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                buttonType: ButtonType.ElevatedButton,
                onPressed: () {
                  Get.back();
                },
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
            ),
          ],
        ),
      ),
    );
  }

  Widget products(context) {
    controller.productModel?.value.items =
        controller.productModel?.value.items!.where((element) {
      print("element -> $element");
      return element.visibility == 4;
    }).toList();
    return Obx(() => GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 12.5,
            childAspectRatio: 0.60,
          ),
          itemBuilder: (_, index) {
            Item? item = controller.productModel?.value.items?[index];
            if (item == null) {
              return Container();
            } else {
              print("Images is ${item.getProductImage()}");
              return InkWell(
                onTap: () {
                  Get.toNamed(RoutesConstants.productDetailsScreen,
                      arguments: [item]);
                },
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                            width: double.infinity,
                            alignment: Alignment.topRight,
                            decoration: item.getProductImage() == "no_selection"
                                ? BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: AssetImage(
                                          AppAsset.logo,
                                        )),
                                    border: Border.all(
                                      color: Color(0xffE7CCBE),
                                    ))
                                : BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                          "${AppConstants.productImageUrl}${item.getProductImage()}",
                                        )),
                                    border: Border.all(
                                      color: Color(0xffE7CCBE),
                                    )),
                            child: InkWell(
                              onTap: () {
                                if (item.isWishList.value) {
                                  controller.deleteWishListData(
                                      context,
                                      item.name,
                                      item.customAttributes![1].value,
                                      item.sku,
                                      item.id,
                                      index);
                                } else {
                                  controller.postAddToWishlistData(
                                      context,
                                      item.name,
                                      item.customAttributes![1].value,
                                      item.sku,
                                      index);
                                }
                              },
                              child: Container(
                                  padding:
                                      EdgeInsets.only(right: 10, top: 10.0),
                                  child: favoriteOrNot(item)),
                            )),
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${item.getBrandName()}".toUpperCase(),
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 16,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${item.name}".toUpperCase(),
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 16,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${localStore.getRegularPriceWithCurrency(
                                        item
                                            .getPriceFromConfigurableProduct(
                                                controller.itemList, item)
                                            .toString(),
                                        item.getConvertRegularPriceFromConfigurableProduct(
                                            controller.itemList, item),
                                      )}',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 15,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '\$' + "${item.price!.round()}",
                                      maxLines: 1,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontSize: 15,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Color(0xffA5A5A5),
                                          fontWeight: FontWeight.w500,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
          // } else {
          //   return Container(
          //     height: 10.0,
          //     width: 10.0,
          //     color: Colors.pink,
          //   );
          // }
          // },
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
            Get.back();
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
          ? const Icon(
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
      flex: 3,
      child: Container(
        alignment: Alignment.centerLeft,
        color: lightBrownColor,
        padding: const EdgeInsets.only(left: 5.0),
        margin: const EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0),
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
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
            height: 50.0,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: controller.currentCategoryIndex.value == index
                    ? Colors.white
                    : lightBrownColor),
            width: Get.width,
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
      flex: 4,
      child: Container(
          color: Colors.white,
          margin: const EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0),
          alignment: Alignment.topLeft,
          child: subCategoryWidget()),
    );
  }

  Widget subCategoryWidget() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
            height: 45.0,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: filterBorderColor)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 15.0,
                ),
                Container(
                  child: Image.asset(
                    AppAsset.search1,
                    color: filterBorderColor,
                    height: 18.0,
                    width: 18.0,
                  ),
                ),
                const SizedBox(
                  width: 3.0,
                ),
                Expanded(
                  child: CommonTextFieldOpenSans(
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
            padding: const EdgeInsets.only(top: 5.0),
            children: [
              Obx(() => ListView.builder(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Obx(() => Container(
                                  height: 24.0,
                                  width: 24.0,
                                  alignment: Alignment.centerLeft,
                                  child: Icon(
                                    category.isSelected.value
                                        ? Icons.check_box_sharp
                                        : Icons.check_box_outline_blank_sharp,
                                    color: Colors.black54,
                                    size: 24.0,
                                  ),
                                )),
                            const SizedBox(
                              width: 15.0,
                            ),
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
                  })),
            ],
          ),
        ),
      ],
    );
  }
}
