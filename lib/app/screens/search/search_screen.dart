import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.5),
        child: Column(
          children: [
            const SizedBox(height: 50),
            filterWidget(),
            const SizedBox(height: 15),
            filterDropDown(),
            const SizedBox(height: 30),
            // GetBuilder(
            //     init: productListCtr,
            //     builder: (context) {
            //       if (productListCtr.allProductList.isNotEmpty) {
            //         return Expanded(
            //           child: GridView.builder(
            //             padding: EdgeInsets.zero,
            //             shrinkWrap: true,
            //             gridDelegate:
            //                 const SliverGridDelegateWithFixedCrossAxisCount(
            //               crossAxisCount: 2,
            //               mainAxisSpacing: 10,
            //               crossAxisSpacing: 12.5,
            //               childAspectRatio: 0.55,
            //             ),
            //             itemBuilder: (_, index) {
            //               return Product(
            //                   items: productListCtr.allProductList[index]);
            //             },
            //             itemCount: productListCtr.allProductList.length,
            //           ),
            //         );
            //       } else {
            //         return const SpinKitDualRing(color: Colors.black);
            //       }
            //     }),
            const SizedBox(height: 20),
          ],
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
          Text(
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
            style: TextStyle(color: Colors.black54),
          ),
          Icon(
            Icons.expand_more,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}
