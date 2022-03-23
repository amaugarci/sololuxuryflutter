import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/product_detail/product_detail_screen.dart';
import 'package:solo_luxury/app/screens/search/widget/product.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/lang_directory/it.dart';

import '../../../data/model/Product/product_model.dart';
import '../../../utils/image_constant.dart';
import '../../utils/app_asset.dart';
import '../../utils/colors.dart';
import '../product_listing/product_controller.dart';

class ProductListScreen extends GetView<ProductController> {
  const ProductListScreen({Key? key}) : super(key: key);

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
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                  child: SvgPicture.asset(ImageConstant.searchIcon),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                  child: SvgPicture.asset(ImageConstant.heartIcon),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                  child: SvgPicture.asset(ImageConstant.shoppingCartIcon, color: Colors.black),
                ),
              ),
            ],
            title: Image.asset(AppAsset.logo, width: 110),
            /*bottom: PreferredSize(
          preferredSize: Size(Get.width, 60),
          child: const HeaderWidget(),
        ),*/
          ),
<<<<<<< HEAD
          body: controller.isLoading.value
              ? const Center(
                child: CircularProgressIndicator(
                    color: appColor,
                  ),
              )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.5),
                  child: Column(
                    children: [
                      filterWidget(),
                      const SizedBox(height: 15),
                      filterDropDown(),
                      const SizedBox(height: 30),
                      Expanded(
                        child: GridView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 12.5,
                            childAspectRatio: 0.50,
                          ),
                          itemBuilder: (_, index) {
                            Item? item = controller.productModel?.value.items?[index];
                            return Product(product: item);
                          },
                          itemCount: controller.productModel?.value.items?.length,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
=======
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.5),
            child: Column(
              children: [
                filterWidget(),
                const SizedBox(height: 15),
                filterDropDown(),
                const SizedBox(height: 30),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 12.5,
                      childAspectRatio: 0.55,
                    ),
                    itemBuilder: (_, index) {
                      Item? item = controller.productModel?.value.items?[index];
                      if (item == null) {
                        return Container();
                      } else {
                        return Product(product: item);
                      }
                    },
                    itemCount: controller.productModel?.value.items?.length,
>>>>>>> e2979285eedb1c5eba54097b43911eea7d1cd98f
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
          Text(
            'WOMEN',
            style: TextStyle(
              color: appColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          Container(
            color: appColor,
            width: 166,
            height: 47,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAsset.filter,
                  width: 18.0,
                  height: 18.0,
                ),
                SizedBox(
                  width: 24,
                ),
                const Text(
                  'FILTER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
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
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: appColor, width: 1.4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Newest First',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300, color: Colors.black),
          ),
          Icon(
            Icons.expand_more,
            color: appColor,
          ),
        ],
      ),
    );
  }
}
