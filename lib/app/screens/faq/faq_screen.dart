import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:solo_luxury/app/screens/faq/faq_controller.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';
import 'package:solo_luxury/app/components/common_widget/custom_expansion_tile.dart'
    as custom;

class FaqScreen extends GetView<FaqController> {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Obx(
      () => Scaffold(
        backgroundColor: backGroundColor,
        body: controller.getFaqList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : pageView(),
      ),
    );
  }

  pageView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: Get.height,
        width: Get.width,
        color: appColorAccent,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Text(
                LanguageConstant.faqTitle.tr,
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: appColor,
                  decorationThickness: 1.5,
                  fontFamily: "Open Sans",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: appColorButton,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.getFaqList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  print(
                      "DATADATA ========${controller.getFaqList[index].title.toString()}");
                  return Container(
                    width: Get.width,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: appColorButton,
                      ),
                    ),
                    child: custom.ExpansionTile(
                      tileHeight: 40,
                      verticalVisualDensity: -1,
                      contentPadding:
                          const EdgeInsets.only(left: 10, right: 20),
                      title: Text(
                        controller.getFaqList[index].title.toString(),
                        style: const TextStyle(
                          fontFamily: "Open Sans  ",
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: brownColor,
                        ),
                      ),
                      isIcon: controller.getFaqList.isEmpty ? true : false,
                      children: [
                        Container(
                          width: Get.width,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                          ),
                          child: Html(
                            data: controller.getFaqList[index].description
                                .toString(),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
