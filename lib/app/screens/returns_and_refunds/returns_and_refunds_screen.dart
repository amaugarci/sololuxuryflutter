import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
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

  listTileUtilities({var onTap, var isSelected, String? title}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: appColorButton,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 25),
            Expanded(
              child: Text(
                title!,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 16,
                  color: brownColor,
                ),
              ),
            ),
            isSelected
                ? const Icon(
                    Icons.remove,
                    color: brownColor,
                  )
                : const Icon(
                    Icons.add,
                    color: brownColor,
                  ),
            const SizedBox(width: 30),
          ],
        ),
      ),
    );
  }

  contain({var isSelected, String? contain, var fontWidth}) {
    return isSelected
        ? Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: Text(
              contain!,
              style: TextStyle(
                fontFamily: "Open Sans",
                fontSize: 14,
                fontWeight: fontWidth,
                color: blackColor,
              ),
            ),
          )
        : const SizedBox();
  }

  bulletList({required List<String> strings, var isSelected, var number}) {
    return isSelected
        ? Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: strings.map((str) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      number ?? '\u2022',
                      style: const TextStyle(
                        fontFamily: "Open Sans",
                        fontSize: 14,
                        height: 1.30,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        str,
                        textAlign: TextAlign.left,
                        // softWrap: true,
                        style: const TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 14,
                          color: blackColor,
                          height: 1.30,
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          )
        : const SizedBox.shrink();
  }

  pageView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
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
                        fontFamily: "Montserrat",
                        fontSize: 16,
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
