import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/utils/app_routes.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';
import '../../utils/app_asset.dart';
import '../../utils/colors.dart';
import 'brand_controller.dart';
import 'brand_list_details.dart';

class BrandListPage extends GetView<BrandController> {
  const BrandListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BrandController controller = Get.find<BrandController>();
    var expandvalue = false.obs;
    return Obx(
      () => Scaffold(
        key: controller.scaffoldKey.value,
        backgroundColor: backGroundColor,
        appBar: AppBar(
          backgroundColor: backGroundColor,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Image.asset(
            AppAsset.logo,
            width: 110,
            fit: BoxFit.fill,
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 10),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
              height: MediaQuery.of(context).size.height / 15.6,
              child: TextFormField(
                controller: null,
                cursorColor: appColor,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.transparent,
                    contentPadding:
                        EdgeInsets.only(bottom: 12, top: 12, left: 12),
                    hintText: LanguageConstant.findBrandsText.tr.toUpperCase(),
                    hintStyle: TextStyle(
                        color: appColor.withOpacity(0.4),
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                    errorStyle: TextStyle(color: Color(0xFF973133)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: appColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(
                        color: appColor,
                        width: 1.0,
                      ),
                    ),
                    isDense: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: appColor,
                        ),
                        borderRadius: BorderRadius.circular(20.0)),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 4),
                      child: ClipOval(
                        child: Material(
                          color: appColor, // Button color
                          child: InkWell(
                            splashColor: Colors.red, // Splash color
                            onTap: () {},
                            child: Icon(
                              CupertinoIcons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )),
                onChanged: (value) {
                  controller.onSearchTextChanged(value);
                },
              ),
            ),
            // Container(
            //   height: 32,
            //   child: Center(
            //     child: ListView.builder(
            //         shrinkWrap: true,
            //         scrollDirection: Axis.horizontal,
            //         itemCount: controller.filterList.length,
            //         itemBuilder: (BuildContext context, int index) {
            //           final fliterList = controller.filterList[index];
            //           return InkWell(
            //             onTap: () {
            //               // print("${controller.listDisplay(text).length}");
            //               controller.brandDetails.value = fliterList;
            //               Get.to(
            //                 const BrandDetailsPage(),
            //               );
            //               // if (controller.filtersearchAlllist
            //               //     .contains(fliterList)) {
            //               //   controller.setSerchwithAlphabatic("");
            //               // } else {
            //               //   controller.setSerchwithAlphabatic(fliterList);
            //               // }
            //             },
            //             child: Container(
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(5),
            //                     color: controller.filtersearchAlllist
            //                             .contains(fliterList)
            //                         ? appColor
            //                         : Colors.transparent),
            //                 padding: EdgeInsets.symmetric(
            //                     horizontal: 8, vertical: 8),
            //                 child: Text(
            //                   "${fliterList}",
            //                   style: TextStyle(
            //                       color: controller.filtersearchAlllist
            //                               .contains(fliterList)
            //                           ? Colors.white
            //                           : appColor,
            //                       fontWeight: FontWeight.w500),
            //                 )),
            //           );
            //         }),
            //   ),
            // ),
            // Container(
            //   height: 32,
            //   child: Center(
            //     child: ListView.builder(
            //         shrinkWrap: true,
            //         scrollDirection: Axis.horizontal,
            //         itemCount: controller.filterList2.length,
            //         itemBuilder: (BuildContext context, int index) {
            //           final fliterList = controller.filterList2[index];
            //           return InkWell(
            //             onTap: () {
            //               controller.brandDetails.value = fliterList;
            //               Get.to(const BrandDetailsPage());

            //               // if (controller.filtersearchAlllist
            //               //     .contains(fliterList)) {
            //               //   controller.setSerchwithAlphabatic("");
            //               // } else {
            //               //   controller.setSerchwithAlphabatic(fliterList);
            //               // }
            //             },
            //             child: Container(
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(5),
            //                     color: controller.filtersearchAlllist
            //                             .contains(fliterList)
            //                         ? appColor
            //                         : Colors.transparent),
            //                 padding: EdgeInsets.symmetric(
            //                     horizontal: 7.6, vertical: 8),
            //                 child: Text(
            //                   "${fliterList}",
            //                   style: TextStyle(
            //                       color: controller.filtersearchAlllist
            //                               .contains(fliterList)
            //                           ? Colors.white
            //                           : appColor,
            //                       fontWeight: FontWeight.w500),
            //                 )),
            //           );
            //         }),
            //   ),
            // ),
            // Container(
            //   height: 32,
            //   child: Center(
            //     child: ListView.builder(
            //         shrinkWrap: true,
            //         scrollDirection: Axis.horizontal,
            //         itemCount: controller.filterList3.length,
            //         itemBuilder: (BuildContext context, int index) {
            //           final fliterList = controller.filterList3[index];
            //           return InkWell(
            //             onTap: () {
            //               controller.brandDetails.value = fliterList;
            //               Get.to(const BrandDetailsPage());

            //               // if (controller.filtersearchAlllist
            //               //     .contains(fliterList)) {
            //               //   controller.setSerchwithAlphabatic("");
            //               // } else {
            //               //   controller.setSerchwithAlphabatic(fliterList);
            //               // }
            //             },
            //             child: Container(
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(5),
            //                     color: controller.filtersearchAlllist
            //                             .contains(fliterList)
            //                         ? appColor
            //                         : Colors.transparent),
            //                 padding: EdgeInsets.symmetric(
            //                     horizontal: 8, vertical: 8),
            //                 child: Text(
            //                   "${fliterList}",
            //                   style: TextStyle(
            //                       color: controller.filtersearchAlllist
            //                               .contains(fliterList)
            //                           ? Colors.white
            //                           : appColor,
            //                       fontWeight: FontWeight.w500),
            //                 )),
            //           );
            //         }),
            //   ),
            // ),
            Expanded(
              child: controller.isLoading.value
                  ? Container(
                      child: Center(
                          child: SpinKitThreeBounce(
                      color: appColor,
                      // size: 50.0,
                    )))
                  : ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      itemCount: controller.filtersearchAlllist.length > 0
                          ? controller.filtersearchAlllist.length
                          : controller.filterAlllist.length,
                      itemBuilder: (BuildContext context, int index) {
                        final brandsListCapital =
                            controller.filtersearchAlllist.length > 0
                                ? controller.filtersearchAlllist[index]
                                : controller.filterAlllist[index];
                        return ListTileTheme(
                            contentPadding: EdgeInsets.zero,
                            minVerticalPadding: 10,
                            dense: true,
                            horizontalTitleGap: 1.2,
                            minLeadingWidth: 10,
                            child: expandDetailWidget(
                                context, brandsListCapital, index + 1));
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget expandDetailWidget(BuildContext context, String text, int value) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(0),
        child: Container(
          color: controller.index.value == value
              ? backGroundColor
              : appColor.withOpacity(0.1),
          padding: EdgeInsets.zero,
          margin: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  InkWell(
                    child: Container(
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            text,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: appColor,
                            ),
                          ),
                          controller.index.value == value
                              ? const Icon(Icons.remove, color: appColor)
                              : const Icon(Icons.add, color: appColor),
                        ],
                      ),
                    ),
                    onTap: () {
                      if (controller.index.value == value) {
                        controller.index.value = 0;
                      } else {
                        controller.index.value = value;
                      }
                    },
                  ),
                  Visibility(
                    visible: controller.index.value == value ? true : false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 5.0),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 1, color: appColor),
                            ),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.listDisplay(text).length > 5
                              ? 5
                              : controller.listDisplay(text).length,
                          itemBuilder: (BuildContext context, int index) {
                            final countryInsideList =
                                controller.listDisplay(text)[index];
                            return Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(border: Border()),
                              child: Text(
                                "$countryInsideList",
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: appColor,
                                ),
                              ),
                            );
                          },
                        ),
                        InkWell(
                          onTap: () {
                            print("${controller.listDisplay(text).length}");
                            controller.brandDetails.value = text;
                            Get.to(
                              const BrandDetailsPage(),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              "& More...",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: appColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
