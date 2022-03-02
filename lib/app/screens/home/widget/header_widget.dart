import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/cart/cart_screen.dart';
import 'package:solo_luxury/app/screens/search/search_screen.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';

import '../../../../utils/app_routes.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Text(
            'UNITED KINGDOM',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Icon(Icons.expand_more, size: 18),
          const SizedBox(width: 8),
          const Text(
            'GBP',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Icon(Icons.expand_more, size: 18),
          const SizedBox(width: 8),
          const Text(
            'ENGLISH',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Icon(Icons.expand_more, size: 18),
          const SizedBox(width: 8),
          const Spacer(),
          GestureDetector(
              onTap: () {
                Get.to(
                  () => SearchScreen(),
                );
              },
              child: SvgPicture.asset(AppAsset.search, height: 12.5)),
          const SizedBox(width: 10),
          GestureDetector(
              onTap: () async{
                await Future.delayed(const Duration(seconds: 2), () async  {
                  Get.toNamed(RoutesConstants.wishlistScreen);
                });
              },
              child: SvgPicture.asset(AppAsset.heart, height: 12.5)),
          const SizedBox(width: 10),
          GestureDetector(
              onTap: () {
                Get.to(() => CartScreen());
              },
              child: SvgPicture.asset(AppAsset.cart, color: Colors.black, height: 12.5)),
          const SizedBox(width: 2),
          const Text('0'),
        ],
      ),
    );
  }
}
