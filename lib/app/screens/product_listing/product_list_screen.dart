import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_field_open_sans.dart';
import 'package:solo_luxury/app/screens/search/widget/product.dart';
import 'package:solo_luxury/data/model/filter/filter_model.dart';

import '../../../data/model/Product/product_model.dart';
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
                child: Column(children: [
                  filterWidget(),
                  const SizedBox(height: 15),
                  filterDropDown(),
                  const SizedBox(height: 30),
                  Expanded(
                    child: products(),
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
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300, color: Colors.black),
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
    return Scaffold(
      appBar: commonAppbarDialog(
        title: "Filters",
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(Get.context!).size.height,
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                // decoration: BoxDecoration(
                //     border: Border.all(width: 1, color: brownColor)),
                child: Column(
              children: [
                Container(
                  height: Get.height * .8,
                  width: Get.width,
                  decoration: const BoxDecoration(color: Colors.white),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      category(),
                      subCategory(),
                    ],
                  ),
                ),
              ],
            )),
            Container(
              width: Get.width,
              height: 40.0,
              margin: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
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
      ),
    );
  }

  Widget products() {
    return GridView.builder(
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
          return Product(item: item, itemList: controller.productModel?.value.items!);
        }
      },
      itemCount: controller.productModel?.value.items?.length,
    );
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

  Widget category() {
    return Expanded(
      flex: 3,
      child: Container(
        alignment: Alignment.centerLeft,
        color: Colors.grey[300],
        padding: const EdgeInsets.only(left: 5.0),
        margin: const EdgeInsets.only(right: 10.0, top: 10.0, bottom: 10.0),
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: controller.filterList.length,
            itemBuilder: (_, index) {
              controller.filterModel!.value = FilterModel.fromJson(controller.filterList[index]);
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
            decoration:
                BoxDecoration(color: controller.currentCategoryIndex.value == index ? Colors.white : Colors.grey[300]),
            width: Get.width,
            child: Align(
              alignment: Alignment.centerLeft,
              child:
                  CommonTextOpenSans("${item.attrLabel}", fontSize: 16, fontWeight: FontWeight.w400, color: appColor),
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
            decoration: BoxDecoration(border: Border.all(width: 1, color: filterBorderColor)),
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
                                  child: Icon(
                                    category.isSelected.value
                                        ? Icons.check_box_sharp
                                        : Icons.check_box_outline_blank_sharp,
                                    color: Colors.black54,
                                    size: 24.0,
                                  ),
                                )),
                            const SizedBox(width: 15.0,),
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
