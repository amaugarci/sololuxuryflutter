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
    return Obx(
      () => Scaffold(
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
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: SvgPicture.asset(ImageConstant.searchIcon),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: SvgPicture.asset(ImageConstant.heartIcon),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: SvgPicture.asset(ImageConstant.shoppingCartIcon,
                    color: Colors.black),
              ),
            ),
          ],
          title: Image.asset(AppAsset.logo, width: 110),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          child: TabBar(
                            indicatorColor: buttoncolor,
                            indicatorSize: TabBarIndicatorSize.tab,
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
                                color: Colors.grey,
                                width: 0.5,
                              ),
                            ),
                          ),
                          child: TabBarView(
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  categoriesOptions(text: "Clothing"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  categoriesOptions(text: "Bags"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  categoriesOptions(text: "Footwear"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  categoriesOptions(text: "Accessories"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  categoriesOptions(text: "Intimates"),
                                ],
                              ),
                              Column(
                                children: const [
                                  Text('Display Tab 2',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const Center(
                                child: Text(
                                  'Display Tab 3',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
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

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
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

  categoriesOptions({var text}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: selectedTabColor,
            size: 12,
          ),
        ],
      ),
    );
  }

  Widget filterDropDown() {
    return Container(
      height: 50,
      width: Get.width * 0.85,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(color: appColor, width: 1.4),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black54,
          ),
          border: InputBorder.none,
          hintText: LanguageConstant.searchText.tr,
          hintStyle: const TextStyle(color: Colors.black54),
        ),
      ),
    );
  }
}
