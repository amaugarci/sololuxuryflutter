import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/main.dart';
import 'package:solo_luxury/utils/app_routes.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';
import '../../utils/colors.dart';
import 'cart_controller.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: appSubscribeButtonColor,
          body: controller.isLoading.value
              ? Center(
                  child: SpinKitThreeBounce(
                    color: appColor,
                  ),
                )
              : ListView(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    donateDesign(),
                    const SizedBox(
                      height: 50,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: controller.cartModel!.value.items.length,
                      itemBuilder: (context, index) => Container(
                        width: Get.width,
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 5, left: 5, top: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: const [
                                                Image(
                                                  image:
                                                      AssetImage(AppAsset.logo),
                                                  width: 40,
                                                ),
                                                Icon(Icons.favorite_border,
                                                    color: blackColor,
                                                    size: 10),
                                              ],
                                            ),
                                          ),
                                          const Image(
                                            image: AssetImage(AppAsset.sandel),
                                            width: 40,
                                          ),
                                        ],
                                      ),
                                      width: 100,
                                      height: 100,
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: brownE7CCBE,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${controller.cartModel!.value.items[index].name.toString()}",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style:
                                                textStyleUtils600(size: 16.0),
                                          ),
                                          Text(
                                            "${controller.cartModel!.value.items[index].sku.toString()}",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style:
                                                textStyleUtils300(size: 16.0),
                                          ),
                                          // Text(
                                          //   "Size: 12",
                                          //   style: textStyleUtils300(size: 16.0),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image(
                                      image: AssetImage(AppAsset.edit),
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (localStore.customerToken
                                                .toString() !=
                                            "") {
                                          controller.deleteCartProductContent(
                                              controller.cartModel!.value
                                                  .items[index].itemId
                                                  .toString(),
                                              1);
                                        } else {
                                          controller.deleteCartProductContent(
                                              controller.cartModel!.value
                                                  .items[index].itemId
                                                  .toString(),
                                              2);
                                        }
                                      },
                                      child: Image(
                                        image: AssetImage(AppAsset.delete),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                              alignment: Alignment.bottomRight,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: Get.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${LanguageConstant.price.tr.toUpperCase()}         ",
                                    style: textStyleUtils600(size: 16.0),
                                  ),
                                  Text(
                                    LanguageConstant.qtyText.tr.toUpperCase(),
                                    style: textStyleUtils600(size: 16.0),
                                  ),
                                  Text(
                                    LanguageConstant.subTotal.tr.toUpperCase(),
                                    style: textStyleUtils600(size: 16.0),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(
                              color: brownE7CCBE,
                              height: 1,
                              thickness: 1,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$${controller.cartModel!.value.items[index].price.toString()}",
                                  style: textStyleUtils400(size: 16.0),
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.postRemoveFromCartData(
                                            context,
                                            "${controller.cartModel!.value.items[index].name.toString()}",
                                            "${controller.cartModel!.value.items[index].sku.toString()}");
                                      },
                                      child: const Icon(
                                        Icons.remove,
                                        color: blackColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 14,
                                    ),
                                    Container(
                                      width: 50,
                                      height: 32,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: brownE7CCBE, width: 1),
                                      ),
                                      child: cartNumber(index),
                                    ),
                                    const SizedBox(
                                      width: 14,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.postAddToCartData(
                                            context,
                                            "${controller.cartModel!.value.items[index].name.toString()}",
                                            "${controller.cartModel!.value.items[index].sku.toString()}");
                                        // controller.
                                      },
                                      child: const Icon(
                                        Icons.add,
                                        color: blackColor,
                                      ),
                                    ),
                                  ],
                                ),
                                cartPrice(index),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Text(
                        LanguageConstant.updateCart.tr,
                        style: textStyleUtils600(color: whiteColor),
                      ),
                      elevation: 0,
                      minWidth: 137,
                      color: ticketTextColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: Get.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LanguageConstant.orderDetails.tr,
                            style: textStyleUtils600(size: 22.0),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                LanguageConstant.subTotal.tr,
                                style: textStyleUtils600(size: 22.0),
                              ),
                              Text(
                                "\$${controller.subtotal.value..toString()}",
                                style: TextStyle(fontSize: 18),
                              )
                              // cartPrice(index),
                            ],
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          const Divider(
                            color: brownDBD3D1,
                            thickness: 1,
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                LanguageConstant.tax.tr,
                                style: textStyleUtils600(size: 22.0),
                              ),
                              Text(
                                "\$0.00",
                                style: textStyleUtils400(size: 18.0),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: Get.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LanguageConstant.promoCode.tr,
                                  style: textStyleUtils600(),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: LanguageConstant.enterCode.tr,
                                    hintStyle:
                                        textStyleUtils400(color: brownBDB5B3),
                                  ),
                                ),
                              ],
                            ),
                            color: whiteColor,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              LanguageConstant.orderTotalText.tr.toUpperCase(),
                              style: textStyleUtils600(size: 16.0),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.center,
                            // child: cartPrice(index),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: MaterialButton(
                              onPressed: () {
                                Get.toNamed(RoutesConstants.checkoutOrderScreen,
                                    arguments: controller.cartModel!.value);
                              },
                              child: Text(
                                LanguageConstant.checkOutText.tr.toUpperCase(),
                                style: textStyleUtils600(color: whiteColor),
                              ),
                              elevation: 0,
                              minWidth: 119,
                              color: ticketTextColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              LanguageConstant.cartContain5.tr,
                              style: textStyleUtils300(),
                            ),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.only(
                          bottom: 15, top: 20, left: 20, right: 20),
                      color: brownF3E5DE,
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                  ],
                ),
        ));
  }

  cartNumber(index) {
    return Obx(() => Text("${controller.cartModel!.value.items[index].qty}"));
  }

  cartPrice(index) {
    return Obx(
      () => Text(
        "\$${controller.cartModel!.value.items[index].qty * controller.cartModel!.value.items[index].price}",
        style: textStyleUtils400(size: 18.0),
      ),
    );
  }

  textStyleUtils600({var size, var color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: "OpenSans",
      fontSize: size ?? 14,
      fontWeight: FontWeight.w600,
    );
  }

  textStyleUtils300({var size}) {
    return TextStyle(
      color: blackColor,
      fontFamily: "OpenSans",
      fontSize: size ?? 14,
      fontWeight: FontWeight.w300,
    );
  }

  textStyleUtils400({var size, var color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontFamily: "OpenSans",
      fontSize: size ?? 14,
      fontWeight: FontWeight.w400,
    );
  }

  Widget donateDesign() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LanguageConstant.cartContain1.tr,
            style: textStyleUtils600(size: 16.0),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            LanguageConstant.cartContain2.tr,
            style: textStyleUtils300(),
          ),
          const SizedBox(
            height: 28,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(
                image: AssetImage(AppAsset.he),
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LanguageConstant.cartContain3.tr,
                    style: textStyleUtils600(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Text(
                      LanguageConstant.cartContain4.tr,
                      style: textStyleUtils600(color: whiteColor),
                    ),
                    elevation: 0,
                    minWidth: 175,
                    color: ticketTextColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      padding: const EdgeInsets.only(left: 15, top: 15, bottom: 12),
      margin: const EdgeInsets.only(left: 20, right: 20),
      width: Get.width,
      decoration: const BoxDecoration(
        color: secondarybackgroundcolor,
      ),
    );
  }
}
