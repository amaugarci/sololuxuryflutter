import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

import '../../../utils/image_constant.dart';
import '../../utils/app_asset.dart';
import '../../utils/colors.dart';
import 'search_controller.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          key: controller.scaffoldKey.value,
          backgroundColor: backGroundColor,
          appBar: AppBar(
            backgroundColor: backGroundColor,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
            centerTitle: true,
            leading: InkWell(
              onTap: () {
                controller.scaffoldKey.value.currentState!.openDrawer();
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(ImageConstant.menuIcon),
              ),
            ),
            actions: [
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 8.0),
                  child: SvgPicture.asset(ImageConstant.searchIcon),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 8.0),
                  child: SvgPicture.asset(ImageConstant.heartIcon),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 8.0),
                  child: SvgPicture.asset(ImageConstant.shoppingCartIcon,
                      color: Colors.black),
                ),
              ),
            ],
            title: Image.asset(AppAsset.logo, width: 110),
            /*bottom: PreferredSize(
          preferredSize: Size(Get.width, 60),
          child: const HeaderWidget(),
        ),*/
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //  filterWidget(),
                const SizedBox(height: 15),
                filterDropDown(),
                const SizedBox(height: 10),
                Flexible(
                  child: DefaultTabController(
                      length: 3, // length of tabs
                      initialIndex: 0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              child: TabBar(
                                labelColor: selectedTabColor,
                                unselectedLabelColor: unselectedTabColor,
                                tabs: [
                                  Tab(
                                    text: LanguageConstant.menText.tr,
                                  ),
                                  Tab(text: LanguageConstant.womenText.tr),
                                  Tab(text: LanguageConstant.kidsText.tr),
                                ],
                              ),
                            ),
                            Container(
                                height: 400, //height of TabBarView
                                decoration: const BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            color: Colors.grey, width: 0.5))),
                                child: TabBarView(children: <Widget>[
                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0, top: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Text('Clothing',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                              SizedBox(
                                                width: Get.width * 0.7,
                                              ),
                                              const Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.black54,
                                                size: 12,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0, top: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Text('Bags',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                              SizedBox(
                                                width: Get.width * 0.75,
                                              ),
                                              const Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.black54,
                                                size: 12,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0, top: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              const Text('Footwear',
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                              SizedBox(
                                                width: Get.width * 0.68,
                                              ),
                                              const Icon(
                                                Icons.arrow_forward_ios,
                                                color: Colors.black54,
                                                size: 12,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Text('Display Tab 2',
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  const Center(
                                    child: Text('Display Tab 3',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ]))
                          ])),
                ),
                // FutureBuilder<List<ProductModel>>(
                //   future: controller.getHomeProducts("12"),
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData) {
                //       return Expanded(
                //         child: GridView.builder(
                //           padding: EdgeInsets.zero,
                //           shrinkWrap: true,
                //           gridDelegate:
                //               const SliverGridDelegateWithFixedCrossAxisCount(
                //             crossAxisCount: 2,
                //             mainAxisSpacing: 10,
                //             crossAxisSpacing: 12.5,
                //             childAspectRatio: 0.55,
                //           ),
                //           itemBuilder: (_, index) {
                //             return Product(
                //                 product:
                //                     controller.homeCategoryProductList[index]);
                //           },
                //           itemCount:
                //               controller.homeCategoryProductList.value.length,
                //         ),
                //       );
                //     } else {
                //       return Container();
                //     }
                //   },
                // ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }

  Widget filterWidget() {
    return Container(
      height: 47,
      color: secondaryColor,
      width: Get.width,
      child: Row(
        children: [
          const SizedBox(width: 10),
          const Text(
            'WOMEN',
            style: TextStyle(
              color: appColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Container(
            color: appColor,
            width: 90,
            height: 47,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(AppAsset.filter),
                const Text(
                  'FILTER',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget filterDropDown() {
    return Container(
      height: 50,
      width: Get.width * 0.85,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: appColor, width: 1.4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.search,
            color: Colors.black54,
          ),
          Text(
            LanguageConstant.searchText.tr,
            style: const TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
