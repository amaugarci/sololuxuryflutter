import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/home/widget/header_widget.dart';
import 'package:solo_luxury/app/screens/my_orders/my_orders_controller.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

import '../../../data/model/MyOrders/MyOrdersData.dart';

class MyOrdersScreen extends GetView<MyOrdersController> {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          key: controller.scaffoldKey.value,
          backgroundColor: backGroundColor,
          appBar: AppBar(
            backgroundColor: backGroundColor,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
            centerTitle: true,
            title: Image.asset(AppAsset.logo, width: 110),
            bottom: PreferredSize(
              preferredSize: Size(Get.width, 60),
              child: const HeaderWidget(),
            ),
          ),
          endDrawer: const Drawer(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.5),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    LanguageConstant.myOrders.tr,
                    style: const TextStyle(
                      color: appColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(border: Border.all(width: 1)),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return myOrderWidget(index);
                      },
                      itemCount: controller.myOrdersModel?.value.items?.length,
                    ),
                  ),
                  const SizedBox(height: 20),
                  //   shippingAdd(),
                  const SizedBox(height: 20),
                  //   buttonShopping(),
                  const SizedBox(height: 20),
                  // detailsButton(
                  //     LanguageConstant.contactText.tr.toUpperCase(), 2),
                  // detailsButton(
                  //     LanguageConstant.socialText.tr.toUpperCase(), 3),
                  // detailsButton(
                  //     LanguageConstant.companyText.tr.toUpperCase(), 4),
                  const SizedBox(height: 20),
                  //   emailSubscribe(),
                  const SizedBox(height: 40)
                ],
              ),
            ),
          ),
        ));
  }

  Widget myOrderWidget(index) {
    ParentItemElement? item =
        controller.myOrdersModel?.value.items?[index].items?[0];
    return Padding(
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
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500),
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
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500),
              ),
              Text(
                item!.name!,
                style: TextStyle(
                    color: Colors.black54), //controller.brandList[index].name
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LanguageConstant.sku.tr,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500),
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
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500),
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
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500),
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
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500),
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
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove_red_eye_outlined)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.cancel_outlined))
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
