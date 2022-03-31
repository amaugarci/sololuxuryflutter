import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/my_orders/my_orders_controller.dart';
import 'package:solo_luxury/app/screens/my_orders/order_details_screen.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/app_routes.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

import '../../../data/model/MyOrders/MyOrdersData.dart';
import '../../components/common_widget/common_appbar.dart';

class MyOrdersScreen extends GetView<MyOrdersController> {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          key: controller.scaffoldKey.value,
          backgroundColor: appColorAccent,
          appBar: commonAppbar(title: LanguageConstant.myOrdersText.tr),
          body: body(),
        ));
  }

  body() {
    if (controller.myOrdersModel!.value.items == null) {
      return Container();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 39),
            Text(
              LanguageConstant.itemOrder.tr,
              style: commonTextStyle500(size: 18.0),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: appColorButton,
                ),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  ParentItemElement item =
                      controller.myOrdersModel!.value.items![index].items![0];
                  MyOrdersDataItem orderData=controller.myOrdersModel!.value.items![index];
                  return myOrderWidget(item: item,orderData: orderData);
                  // return myOrderWidget();
                },
                itemCount: controller.myOrdersModel!.value.items!.length,
                // itemCount: 2,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: appColorButton,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LanguageConstant.paymentMethod.tr + ": Cash On Delivery",
                    style: commonTextStyle500(size: 15.0),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LanguageConstant.subTotal.tr + ":",
                        style: commonTextStyle500(size: 15.0),
                      ),
                      Text(
                        "AED12,900.00",
                        style: commonTextStyle400(size: 14.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LanguageConstant.estimatedTotal.tr + ":",
                        style: commonTextStyle500(size: 15.0),
                      ),
                      Text(
                        "AED12,900.00",
                        style: commonTextStyle400(size: 14.0),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LanguageConstant.grandTotalToBeCharge.tr + ":",
                        style: commonTextStyle500(size: 15.0),
                      ),
                      Text(
                        "AED350.00",
                        style: commonTextStyle400(size: 14.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LanguageConstant.shippingAddressText.tr + ":",
                  style: commonTextStyle500(
                    size: 16.0,
                    color: const Color(0xff585858),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Hitesh jfdsio, jfdsio, street-added,citytesting-named 12345, italy.",
                    maxLines: 2,
                    style: commonTextStyle400(
                      size: 16.0,
                      color: const Color(0xff585858),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LanguageConstant.billingAddress.tr + ":",
                  style: commonTextStyle500(
                    size: 16.0,
                    color: const Color(0xff585858),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Hitesh jfdsio, jfdsio, street-added,citytesting-named 12345, italy.",
                    maxLines: 2,
                    style: commonTextStyle400(
                      size: 16.0,
                      color: const Color(0xff585858),
                    ),
                  ),
                ),
              ],
            ),

            //   shippingAdd(),
            const SizedBox(height: 45),
            Center(
              child: InkWell(
                onTap: () {
                  Get.toNamed(RoutesConstants.orderConfirmScreen);
                },
                child: Container(
                  width: 215,
                  height: 40,
                  decoration: BoxDecoration(
                      color: appColorButton,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      LanguageConstant.continueShopping.tr.toUpperCase(),
                      style: commonTextStyle500(size: 16.0, color: whiteColor),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60)
          ],
        ),
      ),
    );
  }

  commonTextStyle500({var size, var color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontSize: size ?? 16.0,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w500,
    );
  }

  commonTextStyle400({var size, var color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontSize: size ?? 16.0,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w400,
    );
  }

  row1({var text, var data}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: Get.width / 3,
          child: Text(
            text,
            style: commonTextStyle500(size: 15.0),
          ),
        ),
        Expanded(
          child: Text(
            data ?? "",
            style: commonTextStyle400(size: 14.0),
          ),
        ),
      ],
    );
  }

  row2({var text, var data}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: Get.width / 3,
          child: Text(
            text,
            style: commonTextStyle500(size: 15.0),
          ),
        ),
        Container(
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            border: Border.all(
              color: wishListBorder,
              width: 1,
            ),
          ),
          child: Image.network(
            'https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg',
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }

  Widget myOrderWidget({ParentItemElement? item, var index,MyOrdersDataItem? orderData}) {
    if (item == null) {
      return Container();
    }
    return InkWell(
      onTap: () {
        Get.to(
          () => OrderDetailsScreen(
            itemData: item,
            orderData: orderData,
          ),
        );
      },
      child: Column(
        children: [
          const SizedBox(height: 20),
          row2(
            text: LanguageConstant.myOrderImage.tr,
          ),
          const SizedBox(height: 20),
          row1(
            text: LanguageConstant.productName.tr,
            data: item.name,
          ),
          const SizedBox(height: 20),
          row1(
            text: LanguageConstant.sku.tr,
            data: item.sku,
          ),
          const SizedBox(height: 20),
          row1(
            text: LanguageConstant.price.tr,
            data: item.price.toString(),
          ),
          const SizedBox(height: 20),
          row1(
            text: LanguageConstant.quantity.tr,
            data: "Ordered: ${item.qtyOrdered.toString()}",
          ),
          const SizedBox(height: 20),
          row1(
            text: LanguageConstant.subTotal.tr,
            data: item.baseRowTotal.toString(),
          ),
          const SizedBox(height: 20),
          row1(text: LanguageConstant.status.tr, data: orderData!.status.toString()),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: Get.width / 3,
                child: Text(
                  LanguageConstant.action.tr,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                children: const [
                  Icon(Icons.remove_red_eye_outlined),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.clear)
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(
            height: 1,
            color: blackColor,
            thickness: 1,
          ),
        ],
      ),
    );

    /*Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LanguageConstant.myOrderImage.tr,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              const Text(
                '149052',
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LanguageConstant.productName.tr,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              Text(
                item.name!,
                style: TextStyle(color: Colors.black54), //controller.brandList[index].name
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LanguageConstant.sku.tr,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              Text(
                item.sku!,
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LanguageConstant.price.tr,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              Text(
                item.price!.toString(),
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LanguageConstant.quantity.tr,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              Text(
                item.qtyOrdered.toString(),
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LanguageConstant.status.tr,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              const Text(
                'Processing',
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LanguageConstant.action.tr,
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.remove_red_eye_outlined)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.cancel_outlined))
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
    );*/
  }
}
