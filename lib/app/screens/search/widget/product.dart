import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solo_luxury/app/screens/product_detail/product_detail_screen.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';

import '../../../../data/model/Product/product_model.dart';
import '../../../../utils/app_constants.dart';

class Product extends StatelessWidget {
  //const Product({Key? key}) : super(key: key);
  Item? product;

  Product({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailScreen(),arguments: product);
      },
      child: Container(
        width: 150,
        color: backGroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 210,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: appColor,
                  width: 1.4,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        AppAsset.logo,
                        width: 50,
                      ),
                      SvgPicture.asset(AppAsset.heart, height: 14),
                    ],
                  ),
                  const SizedBox(height: 48),
                  Image.network(
                    "${AppConstants.productImageUrl}${product!.customAttributes![1].value}",
                    height: 100,
                    width: 120,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "${product?.name}",
              style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.black, fontSize: 16, overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(height: 6),
            Text(
              "${product?.name}",
              style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.black, fontSize: 16, overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(height: 6),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '\$' + "${product?.price}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 50),
                Text(
                  '\$' + "${product?.price}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black45,
                    decoration: TextDecoration.lineThrough,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
