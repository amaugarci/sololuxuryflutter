import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_appbar.dart';
import 'package:solo_luxury/app/screens/returns_and_refunds/returns_and_refunds_controller.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';
import 'package:solo_luxury/app/components/common_widget/custom_expansion_tile.dart'
    as custom;

class ReturnsAndRefundsScreen extends GetView<ReturnsAndRefundsController> {
  const ReturnsAndRefundsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: appColorAccent,
        appBar: commonAppbar(title: LanguageConstant.returnsRefundsText.tr),
        body: controller.getReturnsList.isEmpty
            ? Center(
                child: SpinKitThreeBounce(
                color: appColor,
                // size: 50.0,
              ))
            : pageView(),
      ),
    );
  }

  pageView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              LanguageConstant.returnsRefundsTitle.tr,
              style: TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: appColor.withOpacity(0.25),
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
              itemCount: controller.getReturnsList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                print(
                    "DATADATA ========${controller.getReturnsList[index].title.toString()}");
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
                    tileHeight: 48,
                    verticalVisualDensity: -1,
                    contentPadding:
                        const EdgeInsets.only(left: 20, right: 20, top: 3),
                    title: Text(
                      controller.getReturnsList[index].title.toString(),
                      style: const TextStyle(
                        fontFamily: "Open Sans",
                        fontSize: 18,
                        color: brownColor,
                      ),
                    ),
                    isIcon: controller.getReturnsList.isEmpty ? true : false,
                    children: [
                      Container(
                        width: Get.width,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                        ),
                        child: Html(
                          data: controller.getReturnsList[index].description
                              .toString(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
