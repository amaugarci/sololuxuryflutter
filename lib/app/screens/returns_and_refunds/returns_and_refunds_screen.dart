import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/returns_and_refunds/returns_and_refunds_controller.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

class ReturnsAndRefundsScreen extends GetView<ReturnsAndRefundsController> {
  const ReturnsAndRefundsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: appColorAccent,
        body: pageView(),
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
            listTileUtilities(
              title: LanguageConstant.returnPolicyTitle.tr,
              onTap: () {
                controller.isSelected1.value = !controller.isSelected1.value;
              },
              isSelected: controller.isSelected1.isTrue,
            ),
            controller.isSelected1.isTrue
                ? Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      border: Border.all(
                        width: 1,
                        color: appColorButton,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: controller.isSelected1.isTrue ? 20 : 0,
                        ),
                        contain(
                          contain: LanguageConstant.returnPolicyContain1.tr,
                          isSelected: controller.isSelected1.isTrue,
                          fontWidth: FontWeight.w600,
                        ),
                        bulletList(
                          isSelected: controller.isSelected1.isTrue,
                          strings: [
                            LanguageConstant.returnPolicyContain2.tr,
                            LanguageConstant.returnPolicyContain3.tr,
                            LanguageConstant.returnPolicyContain4.tr,
                            LanguageConstant.returnPolicyContain5.tr,
                            LanguageConstant.returnPolicyContain6.tr,
                            LanguageConstant.returnPolicyContain7.tr,
                            LanguageConstant.returnPolicyContain8.tr,
                            LanguageConstant.returnPolicyContain9.tr,
                            LanguageConstant.returnPolicyContain12.tr,
                          ],
                        ),
                        SizedBox(
                          height: controller.isSelected1.isTrue ? 20 : 0,
                        ),
                        contain(
                          contain: LanguageConstant.returnPolicyContain10.tr,
                          isSelected: controller.isSelected1.isTrue,
                        ),
                        contain(
                          contain: LanguageConstant.returnPolicyContain11.tr,
                          isSelected: controller.isSelected1.isTrue,
                        ),
                        SizedBox(
                          height: controller.isSelected1.isTrue ? 10 : 0,
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
            const SizedBox(
              height: 20,
            ),
            listTileUtilities(
              title: LanguageConstant.returnProcessTitle.tr,
              onTap: () {
                controller.isSelected2.value = !controller.isSelected2.value;
              },
              isSelected: controller.isSelected2.isTrue,
            ),
            controller.isSelected2.isTrue
                ? Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      border: Border.all(
                        width: 1,
                        color: appColorButton,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: controller.isSelected2.isTrue ? 20 : 0,
                        ),
                        contain(
                          contain: LanguageConstant.returnPolicyContain1.tr,
                          isSelected: controller.isSelected2.isTrue,
                        ),
                        bulletList(
                          isSelected: controller.isSelected2.isTrue,
                          strings: [
                            LanguageConstant.returnPolicyContain2.tr,
                            LanguageConstant.returnPolicyContain3.tr,
                            LanguageConstant.returnPolicyContain4.tr,
                            LanguageConstant.returnPolicyContain5.tr,
                            LanguageConstant.returnPolicyContain6.tr,
                            LanguageConstant.returnPolicyContain7.tr,
                            LanguageConstant.returnPolicyContain8.tr,
                            LanguageConstant.returnPolicyContain9.tr,
                          ],
                        ),
                        SizedBox(
                          height: controller.isSelected2.isTrue ? 20 : 0,
                        ),
                        contain(
                          contain: LanguageConstant.returnPolicyContain10.tr,
                          isSelected: controller.isSelected2.isTrue,
                        ),
                        contain(
                          contain: LanguageConstant.returnPolicyContain11.tr,
                          isSelected: controller.isSelected2.isTrue,
                        ),
                        SizedBox(
                          height: controller.isSelected2.isTrue ? 10 : 0,
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
            const SizedBox(
              height: 20,
            ),
            listTileUtilities(
              title: LanguageConstant.refundTitle.tr,
              onTap: () {
                controller.isSelected3.value = !controller.isSelected3.value;
              },
              isSelected: controller.isSelected3.isTrue,
            ),
            controller.isSelected3.isTrue
                ? Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      border: Border.all(
                        width: 1,
                        color: appColorButton,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: controller.isSelected3.isTrue ? 20 : 0,
                        ),
                        contain(
                          contain: LanguageConstant.returnPolicyContain1.tr,
                          isSelected: controller.isSelected3.isTrue,
                        ),
                        bulletList(
                          isSelected: controller.isSelected3.isTrue,
                          strings: [
                            LanguageConstant.returnPolicyContain2.tr,
                            LanguageConstant.returnPolicyContain3.tr,
                            LanguageConstant.returnPolicyContain4.tr,
                            LanguageConstant.returnPolicyContain5.tr,
                            LanguageConstant.returnPolicyContain6.tr,
                            LanguageConstant.returnPolicyContain7.tr,
                            LanguageConstant.returnPolicyContain8.tr,
                            LanguageConstant.returnPolicyContain9.tr,
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        contain(
                          contain: LanguageConstant.returnPolicyContain10.tr,
                          isSelected: controller.isSelected3.isTrue,
                        ),
                        contain(
                          contain: LanguageConstant.returnPolicyContain11.tr,
                          isSelected: controller.isSelected3.isTrue,
                        ),
                        SizedBox(
                          height: controller.isSelected3.isTrue ? 10 : 0,
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
            const SizedBox(
              height: 20,
            ),
            listTileUtilities(
              title: LanguageConstant.customisedTitle.tr,
              onTap: () {
                controller.isSelected4.value = !controller.isSelected4.value;
              },
              isSelected: controller.isSelected4.isTrue,
            ),
            controller.isSelected4.isTrue
                ? Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      border: Border.all(
                        width: 1,
                        color: appColorButton,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: controller.isSelected4.isTrue ? 20 : 0,
                        ),
                        contain(
                          contain: LanguageConstant.returnPolicyContain1.tr,
                          isSelected: controller.isSelected4.isTrue,
                        ),
                        bulletList(
                          isSelected: controller.isSelected4.isTrue,
                          strings: [
                            LanguageConstant.returnPolicyContain2.tr,
                            LanguageConstant.returnPolicyContain3.tr,
                            LanguageConstant.returnPolicyContain4.tr,
                            LanguageConstant.returnPolicyContain5.tr,
                            LanguageConstant.returnPolicyContain6.tr,
                            LanguageConstant.returnPolicyContain7.tr,
                            LanguageConstant.returnPolicyContain8.tr,
                            LanguageConstant.returnPolicyContain9.tr,
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        contain(
                          contain: LanguageConstant.returnPolicyContain10.tr,
                          isSelected: controller.isSelected4.isTrue,
                        ),
                        contain(
                          contain: LanguageConstant.returnPolicyContain11.tr,
                          isSelected: controller.isSelected4.isTrue,
                        ),
                        SizedBox(
                          height: controller.isSelected4.isTrue ? 10 : 0,
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
            const SizedBox(
              height: 20,
            ),
            listTileUtilities(
              title: LanguageConstant.howToReturnTitle.tr,
              onTap: () {
                controller.isSelected5.value = !controller.isSelected5.value;
              },
              isSelected: controller.isSelected5.isTrue,
            ),
            controller.isSelected5.isTrue
                ? Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      border: Border.all(
                        width: 1,
                        color: appColorButton,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: controller.isSelected5.isTrue ? 20 : 0,
                        ),
                        contain(
                          contain: LanguageConstant.returnPolicyContain1.tr,
                          isSelected: controller.isSelected5.isTrue,
                        ),
                        bulletList(
                          isSelected: controller.isSelected5.isTrue,
                          strings: [
                            LanguageConstant.returnPolicyContain2.tr,
                            LanguageConstant.returnPolicyContain3.tr,
                            LanguageConstant.returnPolicyContain4.tr,
                            LanguageConstant.returnPolicyContain5.tr,
                            LanguageConstant.returnPolicyContain6.tr,
                            LanguageConstant.returnPolicyContain7.tr,
                            LanguageConstant.returnPolicyContain8.tr,
                            LanguageConstant.returnPolicyContain9.tr,
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        contain(
                          contain: LanguageConstant.returnPolicyContain10.tr,
                          isSelected: controller.isSelected5.isTrue,
                        ),
                        contain(
                          contain: LanguageConstant.returnPolicyContain11.tr,
                          isSelected: controller.isSelected5.isTrue,
                        ),
                        SizedBox(
                          height: controller.isSelected5.isTrue ? 10 : 0,
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
