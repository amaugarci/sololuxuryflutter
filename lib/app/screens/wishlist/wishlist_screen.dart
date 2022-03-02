import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/wishlist/widget/wishlist_item.dart';
import 'package:solo_luxury/app/screens/wishlist/wishlist_controller.dart';
import 'package:solo_luxury/app/utils/colors.dart';

import '../../../data/model/Product/product_model.dart';
import '../../utils/app_asset.dart';
import '../home/widget/header_widget.dart';

class MyWishListPage extends GetView<WishlistController> {
  MyWishListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      key: controller.scaffoldKey.value,
      drawer: Icon(Icons.ac_unit),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backGroundColor,
        title: Image.asset(AppAsset.logo, width: 110),
        bottom: PreferredSize(
          preferredSize: Size(Get.width, 60),
          child: const HeaderWidget(),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: appColor),
      ),
      backgroundColor: backGroundColor,
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: appColor),),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      alignment: AlignmentDirectional.center,
                      isExpanded: true, dropdownColor: offWhite,
                      value: controller.chosenValue.value,
                      // elevation: 0,
                      style: TextStyle(
                          color: appColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                      items: <String>[
                        'My Account',
                        'My Orders',
                        'My WishList',
                        'Address Book',
                        'Account Information',
                        'My Tickets',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          alignment: AlignmentDirectional.center,
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Center(
                        child: Text(
                          "My WishList",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: appColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      onChanged: (String? value) {
                        controller.chosenValue.value = value!;
                      },
                    ),
                  ),
                ),
                FutureBuilder<List<ProductModel>>(
                  future: controller.getWishlistProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemBuilder: (_, index) {
                            return WishlistItem(
                                product:
                                controller.wishlistProductList[index]);
                          },
                          itemCount:
                          controller.wishlistProductList.value.length,
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
