import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:solo_luxury/app/screens/faq/faq_controller.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

class FaqScreen extends GetView<FaqController> {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Obx(() => Scaffold(
          backgroundColor: backGroundColor,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(AppAsset.logo, height: 15, width: 18),
                ),
                detailsButton(LanguageConstant.shopAndPlaceOrder.tr, 1),
                Container(
                  width: Get.width * 0.9,
                  decoration: BoxDecoration(
                    //  color: appColor,
                    border: Border.all(color: Colors.black, width: 0.4),
                  ),
                  child: Visibility(
                    visible: controller.index.value == 1 ? true : false,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LanguageConstant.accountToPlaceOrderQues.tr,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            LanguageConstant.accountToPlaceOrderAns.tr,
                            style: const TextStyle(color: Colors.black87),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            LanguageConstant.accountToPlaceOrderQues.tr,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            LanguageConstant.accountToPlaceOrderAns.tr,
                            style: const TextStyle(color: Colors.black87),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            LanguageConstant.accountToPlaceOrderQues.tr,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            LanguageConstant.accountToPlaceOrderAns.tr,
                            style: const TextStyle(color: Colors.black87),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            LanguageConstant.accountToPlaceOrderQues.tr,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            LanguageConstant.accountToPlaceOrderAns.tr,
                            style: const TextStyle(color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ));
  }

  Widget detailsButton(String text, int value) {
    return GestureDetector(
      onTap: () {
        if (controller.index.value == value) {
          controller.index.value = 0;
        } else {
          controller.index.value = value;
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: Get.width * 0.9,
        decoration: BoxDecoration(
          //  color: appColor,
          border: Border.all(color: Colors.black, width: 0.4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,
                style: const TextStyle(
                    color: Color(0xFFA4491A),
                    fontSize: 18,
                    fontWeight: FontWeight.w400)),
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
}
