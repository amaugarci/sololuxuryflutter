import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:solo_luxury/app/screens/faq/faq_controller.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

class FaqScreen extends GetView<FaqController> {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Obx(
      () => Scaffold(
        backgroundColor: backGroundColor,
        body: controller.faqModel?.value.content == null
            ? const Center(child: CircularProgressIndicator())
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
                  fontFamily: "Open Sans  ",
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
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
          child: Center(
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
                  height: 39,
                ),
                listTileUtilities(
                  title: "How to shop & place an order?",
                  onTap: () {
                    controller.isSelected1.value =
                        !controller.isSelected1.value;
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
                              contain:
                                  LanguageConstant.returnPolicyContain10.tr,
                              isSelected: controller.isSelected1.isTrue,
                            ),
                            contain(
                              contain:
                                  LanguageConstant.returnPolicyContain11.tr,
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
                  title: "SOLO pricing & payment",
                  onTap: () {
                    controller.isSelected2.value =
                        !controller.isSelected2.value;
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
                              fontWidth: FontWeight.w600,
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
                                LanguageConstant.returnPolicyContain12.tr,
                              ],
                            ),
                            SizedBox(
                              height: controller.isSelected2.isTrue ? 20 : 0,
                            ),
                            contain(
                              contain:
                                  LanguageConstant.returnPolicyContain10.tr,
                              isSelected: controller.isSelected2.isTrue,
                            ),
                            contain(
                              contain:
                                  LanguageConstant.returnPolicyContain11.tr,
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
                  title: "Product availability & authenticity",
                  onTap: () {
                    controller.isSelected3.value =
                        !controller.isSelected3.value;
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
                              fontWidth: FontWeight.w600,
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
                                LanguageConstant.returnPolicyContain12.tr,
                              ],
                            ),
                            SizedBox(
                              height: controller.isSelected3.isTrue ? 20 : 0,
                            ),
                            contain(
                              contain:
                                  LanguageConstant.returnPolicyContain10.tr,
                              isSelected: controller.isSelected3.isTrue,
                            ),
                            contain(
                              contain:
                                  LanguageConstant.returnPolicyContain11.tr,
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
                  title: "Shipping, taxes & duties",
                  onTap: () {
                    controller.isSelected4.value =
                        !controller.isSelected4.value;
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
                              fontWidth: FontWeight.w600,
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
                                LanguageConstant.returnPolicyContain12.tr,
                              ],
                            ),
                            SizedBox(
                              height: controller.isSelected4.isTrue ? 20 : 0,
                            ),
                            contain(
                              contain:
                                  LanguageConstant.returnPolicyContain10.tr,
                              isSelected: controller.isSelected4.isTrue,
                            ),
                            contain(
                              contain:
                                  LanguageConstant.returnPolicyContain11.tr,
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
                  title: "Returns & refunds",
                  onTap: () {
                    controller.isSelected5.value =
                        !controller.isSelected5.value;
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
                              fontWidth: FontWeight.w600,
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
                                LanguageConstant.returnPolicyContain12.tr,
                              ],
                            ),
                            SizedBox(
                              height: controller.isSelected5.isTrue ? 20 : 0,
                            ),
                            contain(
                              contain:
                                  LanguageConstant.returnPolicyContain10.tr,
                              isSelected: controller.isSelected5.isTrue,
                            ),
                            contain(
                              contain:
                                  LanguageConstant.returnPolicyContain11.tr,
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
                  height: 20,
                ),
              ],
            ),
          ),

          /* Html(
                    data: controller.faqModel?.value.content,
                    tagsList: Html.tags..addAll(["bird", "flutter"]),
                    style: {
                      "table": Style(
                        backgroundColor:
                            const Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                      ),
                      "tr": Style(
                        border: const Border(
                            bottom: BorderSide(color: Colors.grey)),
                      ),
                      "th": Style(
                        padding: const EdgeInsets.all(6),
                        backgroundColor: Colors.grey,
                      ),
                      "td": Style(
                        padding: const EdgeInsets.all(6),
                        alignment: Alignment.topLeft,
                      ),
                      'h5': Style(
                          maxLines: 2, textOverflow: TextOverflow.ellipsis),
                    },
                    customRender: {
                      "table": (context, child) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: (context.tree as TableLayoutElement)
                              .toWidget(context),
                        );
                      },
                      "bird": (RenderContext context, Widget child) {
                        return TextSpan(text: "🐦");
                      },
                      "flutter": (RenderContext context, Widget child) {
                        return FlutterLogo(
                          style:
                              (context.tree.element!.attributes['horizontal'] !=
                                      null)
                                  ? FlutterLogoStyle.horizontal
                                  : FlutterLogoStyle.markOnly,
                          textColor: context.style.color!,
                          size: context.style.fontSize!.size! * 5,
                        );
                      },
                    },
                    customImageRenders: {
                      networkSourceMatcher(domains: ["flutter.dev"]):
                          (context, attributes, element) {
                        return FlutterLogo(size: 36);
                      },
                      networkSourceMatcher(domains: ["mydomain.com"]):
                          networkImageRender(
                        headers: {"Custom-Header": "some-value"},
                        altWidget: (alt) => Text(alt ?? ""),
                        loadingWidget: () => Text("Loading..."),
                      ),
                      // On relative paths starting with /wiki, prefix with a base url
                      (attr, _) =>
                              attr["src"] != null &&
                              attr["src"]!.startsWith("/wiki"):
                          networkImageRender(
                              mapUrl: (url) =>
                                  "https://upload.wikimedia.org" + url!),
                      // Custom placeholder image for broken links
                      networkSourceMatcher():
                          networkImageRender(altWidget: (_) => FlutterLogo()),
                    },
                    onLinkTap: (url, _, __, ___) {
                      print("Opening $url...");
                    },
                    onImageTap: (src, _, __, ___) {
                      print(src);
                    },
                    onImageError: (exception, stackTrace) {
                      print(exception);
                    },
                    onCssParseError: (css, messages) {
                      print("css that errored: $css");
                      print("error messages:");
                      messages.forEach((element) {
                        print(element);
                      });
                    })*/
        ));
  }
// Widget detailsButton(String text, int value) {
//   return GestureDetector(
//     onTap: () {
//       if (controller.index.value == value) {
//         controller.index.value = 0;
//       } else {
//         controller.index.value = value;
//       }
//     },
//     child: Container(
//       alignment: Alignment.center,
//       height: 50,
//       width: Get.width * 0.9,
//       decoration: BoxDecoration(
//         //  color: appColor,
//         border: Border.all(color: Colors.black, width: 0.4),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(text,
//               style: const TextStyle(
//                   color: Color(0xFFA4491A),
//                   fontSize: 18,
//                   fontWeight: FontWeight.w400)),
//           const SizedBox(width: 10),
//           const Icon(
//             Icons.expand_more,
//             color: Colors.white,
//           ),
//         ],
//       ),
//     ),
//   );
// }
}
