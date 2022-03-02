import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:solo_luxury/app/screens/faq/faq_controller.dart';
import 'package:solo_luxury/app/utils/colors.dart';

class FaqScreen extends GetView<FaqController> {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    const htmlData = '';

    return Obx(() => Scaffold(
        backgroundColor: backGroundColor,
        body: SingleChildScrollView(
            child: Html(
                data: controller.faqContentData.value,
                tagsList: Html.tags..addAll(["bird", "flutter"]),
                style: {
                  "table": Style(
                    backgroundColor:
                        const Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                  ),
                  "tr": Style(
                    border:
                        const Border(bottom: BorderSide(color: Colors.grey)),
                  ),
                  "th": Style(
                    padding: const EdgeInsets.all(6),
                    backgroundColor: Colors.grey,
                  ),
                  "td": Style(
                    padding: const EdgeInsets.all(6),
                    alignment: Alignment.topLeft,
                  ),
                  'h5': Style(maxLines: 2, textOverflow: TextOverflow.ellipsis),
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
                      style: (context.tree.element!.attributes['horizontal'] !=
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
                      attr["src"]!
                          .startsWith("/wiki"): networkImageRender(
                      mapUrl: (url) => "https://upload.wikimedia.org" + url!),
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
                }))));
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
