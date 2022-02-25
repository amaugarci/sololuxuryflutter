import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/home/widget/header_widget.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => myOrderWidget(),
                  separatorBuilder: (context, index) => const Divider(
                    color: appColor,
                    thickness: 1.5,
                  ),
                  itemCount: 4,
                ),
              ),
              const SizedBox(height: 20),
              shippingAdd(),
              const SizedBox(height: 20),
              buttonShopping(),
              const SizedBox(height: 20),
              detailsButton(LanguageConstant.contactText.tr.toUpperCase(), 2),
              detailsButton(LanguageConstant.socialText.tr.toUpperCase(), 3),
              detailsButton(LanguageConstant.companyText.tr.toUpperCase(), 4),
              const SizedBox(height: 20),
              emailSubscribe(),
              const SizedBox(height: 40)
            ],
          ),
        ),
      ),
    );
  }

  Widget detailsButton(String text, int value) {
    return GestureDetector(
      onTap: () {
        // if (controller.index.value == value) {
        //   controller.index.value = 0;
        // } else {
        //   controller.index.value = value;
        // }
      },
      child: Container(
        height: 50,
        width: Get.width,
        decoration: BoxDecoration(
          color: appColor,
          border: Border.all(color: Colors.black, width: 0.4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(width: 10),
            const Icon(
              Icons.expand_more,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget shippingAdd() {
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
                LanguageConstant.paymentMethod.tr,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500),
              ),
              const Text(
                'Cash On Delivery',
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LanguageConstant.shippingAddress.tr,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500),
              ),
              const Text(
                'Lucknow',
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LanguageConstant.billingAddress.tr,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500),
              ),
              const Text(
                'Lucknow',
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget emailSubscribe() {
    return Container(
      height: 47,
      width: Get.width,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: appColor, width: 1.5),
      ),
      child: Row(
        children: [
          const SizedBox(width: 18),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Your E-Mail',
                hintStyle: TextStyle(color: Colors.black54, fontSize: 13.5),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            height: 47,
            width: 120,
            decoration: BoxDecoration(
              color: appColor,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: appColor, width: 1.5),
            ),
            alignment: Alignment.center,
            child: const Text(
              'SUBSCRIBE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonShopping() {
    return Container(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 1,
          primary: appColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          LanguageConstant.continueShopping.tr.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 12.5,
          ),
        ),
      ),
    );
  }

  Widget myOrderWidget() {
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
              const Text(
                '8/29.21',
                style: TextStyle(color: Colors.black54),
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
              const Text(
                'ship test aska p',
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
              const Text(
                '@280.00',
                style: TextStyle(color: Colors.black54),
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
              const Text(
                '1',
                style: TextStyle(color: Colors.black54),
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
                'pending',
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
