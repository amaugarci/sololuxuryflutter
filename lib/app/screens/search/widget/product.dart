import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solo_luxury/app/screens/product_detail/product_detail_screen.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';

import '../../../../data/model/Product/product_model.dart';

class Product extends StatelessWidget {
  //const Product({Key? key}) : super(key: key);
  ProductModel product;

  Product({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailScreen(
              product: product,
            ));
      },
      child: Container(
        width: 150,
        color: backGroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 200,
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
                        width: 90,
                      ),
                      SvgPicture.asset(AppAsset.heart, height: 14),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Image.network(
                    'https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg',
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "${product.name}",
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(height: 10),
            Text(
              "${product.name}",
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  overflow: TextOverflow.ellipsis),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ ' + "${product.price}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 14.5,
                  ),
                ),
                Text(
                  '\$ ' + "${product.price}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black45,
                    decoration: TextDecoration.lineThrough,
                    fontSize: 14.5,
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
