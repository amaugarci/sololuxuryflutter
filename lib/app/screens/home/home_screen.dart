import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:solo_luxury/app/screens/about_us/about_us_screen.dart';
import 'package:solo_luxury/app/screens/home/home_controller.dart';
import 'package:solo_luxury/app/screens/home/widget/header_widget.dart';
import 'package:solo_luxury/app/screens/refer_friend/refer_friend_screen.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/data/model/Home/menu_model.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
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
          drawer: SizedBox(
            child: Drawer(
                child: SizedBox(
              width: Get.width - 40.0,
              child: getDrawerView(),
            )),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(AppAsset.banner),
                ),
                detailsButton(LanguageConstant.aboutUsText.tr.toUpperCase(), 1),
                Visibility(
                  visible: controller.index.value == 1 ? true : false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.to(() => const AboutUsScreen());
                        },
                        child: Text(
                          LanguageConstant.aboutUsText.tr,
                          style: const TextStyle(color: Colors.black87),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => const ReferFriendScreen());
                        },
                        child: Text(
                          LanguageConstant.referFriendText.tr,
                          style: const TextStyle(color: Colors.black87),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          LanguageConstant.returnsRefundsText.tr,
                          style: const TextStyle(color: Colors.black87),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          LanguageConstant.faqText.tr,
                          style: const TextStyle(color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ),
                detailsButton(LanguageConstant.contactText.tr.toUpperCase(), 2),
                detailsButton(LanguageConstant.socialText.tr.toUpperCase(), 3),
                detailsButton(LanguageConstant.companyText.tr.toUpperCase(), 4),
                const SizedBox(height: 20),
                emailSubscribe(),
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

  Widget getDrawerView() {
    if (controller.menuModel?.value?.childrenData == null) {
      return Container();
    }
    return Container(
      height: Get.height,
      width: Get.width,
      color: appColorAccent,
      child: Stack(
        children: [
          Container(
            height: 40.0,
            margin: EdgeInsets.only(top: MediaQuery.of(Get.context!).viewPadding.top),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: Get.height,
                    color: appColorPrimary,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset(AppAsset.menu, color: appColorAccent, height: 18.0, width: 18.0)),
                        Row(
                          children: const [
                            SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              "Menu",
                              style: TextStyle(color: appColorAccent, fontSize: 16.0),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: Get.height,
                    color: appColorPrimaryGrey,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 30.0),
                    child: const Text(
                      "Account",
                      style: TextStyle(color: appColorDarkGrey, fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 65),
            child: Stack(
              children: [
                ListView(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  primary: true,
                  padding: EdgeInsets.zero,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        ListView.builder(
                            // Important: Remove any padding from the ListView.
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: controller.menuModel?.value?.childrenData?.length,
                            itemBuilder: (context, index) {
                              ChildrenData itemLevel1 = controller.menuModel?.value?.childrenData?[index];
                              return itemLevel1.isActive!
                                  ? Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(bottom: 5.0, right: 10.0, top: 5.0),
                                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              textWithIcon(
                                                name: itemLevel1.name!,
                                                style: const TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w400,
                                                    color: appColorDarkGrey),
                                                isIcon: itemLevel1.childrenData!.isEmpty ? true : false,
                                                isExpand: itemLevel1.isExpand.value ? true : false,
                                                onTapExpand: () {
                                                  itemLevel1.isExpand.value = true;
                                                  controller.menuModel!.refresh();
                                                },
                                                onTapCollapse: () {
                                                  itemLevel1.isExpand.value = false;
                                                  controller.menuModel!
                                                      .refresh(); // for (var element in itemLevel1.childrenData!) {
                                                },
                                              ),
                                              SizedBox(
                                                // height: 100,
                                                width: Get.width / 1.3,
                                                child: itemLevel1.isExpand.value
                                                    ? ListView.builder(
                                                        padding: EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        physics: const NeverScrollableScrollPhysics(),
                                                        itemCount: itemLevel1.childrenData!.length,
                                                        itemBuilder: (context, index1) {
                                                          ChildrenData itemLevel2 = itemLevel1.childrenData![index1];
                                                          return Container(
                                                            margin: const EdgeInsets.only(left: 10.0),
                                                            child: itemLevel2.isActive!
                                                                ? Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      textWithIcon(
                                                                        name: itemLevel2.name!,
                                                                        style: const TextStyle(
                                                                          fontSize: 15.0,
                                                                          fontWeight: FontWeight.w400,
                                                                          color: appColorDarkGrey,
                                                                        ),
                                                                        isIcon: itemLevel2.childrenData!.isEmpty
                                                                            ? true
                                                                            : false,
                                                                        isExpand:
                                                                            itemLevel2.isExpand.value ? true : false,
                                                                        onTapExpand: () {
                                                                          itemLevel2.isExpand.value = true;
                                                                          controller.menuModel!.refresh();
                                                                        },
                                                                        onTapCollapse: () {
                                                                          itemLevel2.isExpand.value = false;
                                                                          controller.menuModel!
                                                                              .refresh(); // for (var element in itemLevel1.childrenData!) {
                                                                        },
                                                                      ),
                                                                      Column(
                                                                        children: [
                                                                          const SizedBox(
                                                                            height: 8.0,
                                                                          ),
                                                                          itemLevel2.isExpand.value
                                                                              ? ListView.builder(
                                                                                  padding: EdgeInsets.zero,
                                                                                  shrinkWrap: true,
                                                                                  physics:
                                                                                      const NeverScrollableScrollPhysics(),
                                                                                  itemCount:
                                                                                      itemLevel2.childrenData!.length,
                                                                                  itemBuilder: (context, index2) {
                                                                                    ChildrenData itemLevel3 = itemLevel2
                                                                                        .childrenData![index2];
                                                                                    return itemLevel3.isActive!
                                                                                        ? Container(
                                                                                            margin:
                                                                                                const EdgeInsets.only(
                                                                                                    left: 10.0,
                                                                                                    top: 3.0,
                                                                                                    bottom: 3.0),
                                                                                            child: Text(
                                                                                              itemLevel3.name!,
                                                                                              overflow:
                                                                                                  TextOverflow.ellipsis,
                                                                                              style: const TextStyle(
                                                                                                  fontSize: 12.0,
                                                                                                  fontWeight:
                                                                                                      FontWeight.w400,
                                                                                                  color:
                                                                                                      appColorDarkGrey),
                                                                                            ),
                                                                                          )
                                                                                        : Container();
                                                                                  })
                                                                              : Container(),
                                                                        ],
                                                                      )
                                                                    ],
                                                                  )
                                                                : Container(),
                                                          );
                                                        })
                                                    : Container(),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Divider(
                                          height: 2.0,
                                          color: appColorDarkGrey,
                                        )
                                      ],
                                    )
                                  : Container();
                            }),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget textWithIcon({
    String? name,
    TextStyle? style,
    bool isIcon = false,
    bool isExpand = false,
    GestureTapCallback? onTapExpand,
    GestureTapCallback? onTapCollapse,
  }) {
    return InkWell(
      onTap: !isExpand ? onTapExpand : onTapCollapse,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name!, overflow: TextOverflow.ellipsis, style: style),
                isIcon
                    ? Container()
                    : Image.asset(
                        !isExpand ? AppAsset.plus : AppAsset.minus,
                        height: 14,
                        color: appColorDarkGrey,
                        width: 14,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
