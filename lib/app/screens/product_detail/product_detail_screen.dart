import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/product_detail/product_detail_controller.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/main.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

import '../../../data/model/Product/product_model.dart';
import '../../../utils/app_constants.dart';

// ignore: must_be_immutable
class ProductDetailScreen extends GetView<ProductDetailController> {
  Item? product;

  ProductDetailScreen({this.product});

  PageController controllerPage = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    print("USER TOKEN =============${localStore.customerToken}");

    return Obx(
      () => Scaffold(
        backgroundColor: backGroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: backGroundColor,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: controller.isLoading.value == true
            ? const Center(
                child: SpinKitThreeBounce(
                color: appColor,
                // size: 50.0,
              ))
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.5),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      imageCarousel(),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          Container(
                            height: 65,
                            width: 20,
                            margin: EdgeInsets.only(right: 12),
                            color: whiteColor,
                            child: const Icon(
                              Icons.arrow_back_ios,
                              size: 16,
                              color: Colors.black54,
                            ),
                          ),
                          Expanded(child: allProductImages()),
                          Container(
                            height: 65,
                            width: 20,
                            margin: EdgeInsets.only(left: 12),
                            color: whiteColor,
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 41),
                      Text(
                        product!.name!,
                        style: commonTextStyle400(size: 24.0),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        product!.name!,
                        style: commonTextStyle400(size: 18.0),
                      ),
                      const SizedBox(height: 28),
                      expandDetailWidget(
                        text: LanguageConstant.description.tr,
                        onTap: () {
                          controller.isSelected.value =
                              !controller.isSelected.value;
                        },
                      ),
                      const SizedBox(height: 8),
                      Visibility(
                        visible: controller.isSelected.isTrue ? true : false,
                        child: Text(
                          "${product!.customAttributes!.first.value}",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      expandDetailWidget(
                        text: LanguageConstant.details.tr,
                        onTap: () {
                          controller.isSelected1.value =
                              !controller.isSelected1.value;
                        },
                      ),
                      const SizedBox(height: 10),
                      Visibility(
                        visible: controller.isSelected1.isTrue ? true : false,
                        child: Text(
                          "${product!.customAttributes!.first.value}",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      const SizedBox(height: 35),
                      Text(
                        "£${product?.price!.toStringAsFixed(2)}",
                        style: commonTextStyle600(size: 24.0),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        LanguageConstant.sku.tr + ":- ${product?.sku}",
                        style: commonTextStyle600(
                          size: 14.0,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 25),
                      Visibility(
                        visible: product!.typeId == 'configurable',
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(child: chooseAnOptionWidget()),
                            const SizedBox(width: 15),
                            sizeChartWidget(context),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: addToCartButton(context: context),
                          ),
                          const SizedBox(width: 25),
                          Expanded(
                            child: addToWishlistButton(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      TabBar(
                        tabs: controller.myTabs,
                        unselectedLabelColor: blackColor.withOpacity(0.50),
                        labelStyle: commonTextStyle600(size: 18.0),
                        unselectedLabelStyle: commonTextStyle600(
                          size: 18.0,
                          color: blackColor.withOpacity(0.50),
                        ),
                        labelColor: blackColor,
                        isScrollable: false,
                        controller: controller.controller,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorPadding: EdgeInsets.zero,
                        labelPadding: EdgeInsets.zero,
                        indicatorColor: brown743617,
                        indicatorWeight: 2,
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      SizedBox(
                        height: Get.height / 2,
                        child: TabBarView(
                          controller: controller.controller,
                          children: [
                            SizedBox(
                              height: 290,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.itemsData.length,
                                itemBuilder: (context, index) => SizedBox(
                                  width: 215,
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            const Positioned(
                                              top: 0,
                                              right: 0,
                                              child: Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Icon(
                                                  Icons.favorite_border,
                                                  size: 18,
                                                  color: blackColor,
                                                ),
                                              ),
                                            ),
                                            Image(
                                              width: 162,
                                              image: NetworkImage(
                                                controller.itemsData[index]
                                                    ["image_url"],
                                              ),
                                            ),
                                          ],
                                        ),
                                        height: 215,
                                        width: 215,
                                        margin: const EdgeInsets.only(
                                            right: 5, left: 5, top: 5),
                                        decoration: BoxDecoration(
                                          color: backGroundColor,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  blackColor.withOpacity(0.30),
                                              blurRadius: 8,
                                            ),
                                          ],
                                          border: Border.all(
                                            color: brown743617,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        controller.itemsData[index]
                                            ["brand_name"],
                                        textAlign: TextAlign.center,
                                        style: commonTextStyle400(size: 16.0),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        controller.itemsData[index]["name"],
                                        textAlign: TextAlign.center,
                                        style: commonTextStyle400(size: 16.0),
                                      ),
                                      Text(
                                        controller.itemsData[index]["price"],
                                        textAlign: TextAlign.center,
                                        style: commonTextStyle400(size: 16.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "Free global returns and pick up",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: commonTextStyle400(size: 16.0),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  commonTextStyle400({var size}) {
    return TextStyle(
      fontFamily: "Open Sans",
      fontWeight: FontWeight.w400,
      color: blackColor,
      fontSize: size ?? 14,
    );
  }

  commonTextStyle600({var size, var color}) {
    return TextStyle(
      fontFamily: "Open Sans",
      fontWeight: FontWeight.w600,
      color: color ?? blackColor,
      fontSize: size ?? 14,
    );
  }

  Widget imageCarousel() {
    return Container(
      height: 436,
      width: Get.width,
      //padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: appColor, width: 1),
      ),
      child: Stack(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PageView.builder(
            controller: controllerPage,
            itemBuilder: (_, index) {
              return Image.network(
                "${AppConstants.productImageUrl}${product!.customAttributes![1].value}",
                fit: BoxFit.fill,
              );
            },
            itemCount: 6,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  AppAsset.search,
                  height: 24,
                  color: Colors.black45,
                )),
          ),
          SizedBox(
            height: 97,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.black54,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget expandDetailWidget({String? text, var onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: secondaryColor,
        padding: const EdgeInsets.all(13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text!,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400),
            ),
            const Icon(Icons.expand_more, color: Colors.black),
          ],
        ),
      ),
    );
  }

  Widget addToCartButton({var context}) {
    return SizedBox(
      width: Get.width,
      height: 36,
      child: ElevatedButton(
        onPressed: () {
          controller.postAddToCartData(
            context,
            product!.name!,
            "${AppConstants.productImageUrl}${product!.customAttributes![1].value}",
            product?.sku,
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 1,
          primary: appColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(Icons.shopping_cart, size: 15),
            Text(
              LanguageConstant.addTOCart.tr,
              style: commonTextStyle600(color: whiteColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget addToWishlistButton() {
    return SizedBox(
      width: Get.width,
      height: 36,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 1,
          primary: appColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(
              Icons.favorite,
              color: Colors.white,
              size: 15,
            ),
            Text(
              'ADD TO WISHLIST',
              style: commonTextStyle600(color: whiteColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget sizeChartWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        imageDialog(LanguageConstant.sizeChartText.tr,
            product!.customAttributes![17].value, context);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backGroundColor,
          border: Border.all(color: brown743617),
        ),
        child: Text(
          LanguageConstant.sizeChartText.tr,
          style: commonTextStyle600(size: 14.0, color: brown743617),
        ),
      ),
    );
  }

  Widget allProductImages() {
    return SizedBox(
      height: 65,
      child: ListView.builder(
        itemCount: 6,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Row(
          children: [
            Container(
              width: 65,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "${AppConstants.productImageUrl}${product!.customAttributes![1].value}",
                  ),
                  fit: BoxFit.fill,
                ),
                border: Border.all(
                  width: 1,
                  color: brown743617,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageWidget() {
    return Container(
      height: 45,
      width: 48,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration:
          BoxDecoration(border: Border.all(color: appColor, width: 1.25)),
      child: Image.network(
        'https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget chooseAnOptionWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: appColor.withOpacity(0.4))),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          items: controller.sizeListData
              .map(
                (value) => DropdownMenuItem(
                  child: Text(value),
                  value: value,
                ),
              )
              .toList(),
          isExpanded: true,
          hint: controller.sizeList.toString() == ""
              ? Text(
                  'Choose An Option...',
                )
              : Text(
                  "${controller.sizeList.value}",
                  style: const TextStyle(color: Colors.black),
                ),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            size: 22,
            color: Colors.black,
          ),
          iconEnabledColor: Colors.transparent,
          onChanged: (valueList) {
            print("Val");
            controller.sizeList.value = valueList.toString();
          },
        ),
      ),
    );
  }

  //Add To Cart Open Dialog3
  void _showDialog(var context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          elevation: 6.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0.0))),
          contentPadding: EdgeInsets.all(14.0),
          insetPadding: EdgeInsets.symmetric(horizontal: 10.0),
          backgroundColor: Color(0xffFBECE5),
          content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.clear,
                        size: 22,
                        color: appColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14.0),
                Text(
                  LanguageConstant.youaddCartText.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: appColor),
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 100,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          border: Border.all(color: appColor),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2hvZXN8ZW58MHx8MHx8&w=1000&q=80"))),
                    )),
                    SizedBox(width: 8.0),
                    Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 14.0, vertical: 10.0),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: appColor),
                                        child: Text(
                                          LanguageConstant.viewCartText.tr
                                              .toUpperCase(),
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 14.0, vertical: 10.0),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: appColor),
                                      child: Text(
                                        LanguageConstant.continueShoppingText.tr
                                            .toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
                SizedBox(height: 14.0),
              ],
            ),
          ),
        );
      },
    );
  }

  imageDialog(text, path, context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.all(20),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$text',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: appColor),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.close_rounded,
                          size: 16,
                        ),
                        color: appColor,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Image.network(
                    '$path',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
