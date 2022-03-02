import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';

import '../../../data/model/Product/product_model.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductModel product;

  ProductDetailScreen({required this.product});


  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int index = 0;
  int currentPage = 1;
  PageController controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backGroundColor,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              imageCarousel(),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 20,
                    color: Colors.black12,
                    child: const Icon(Icons.arrow_back_ios, size: 13),
                  ),
                  Expanded(child: allProductImages()),
                  Container(
                    height: 50,
                    width: 20,
                    color: Colors.black12,
                    child: const Icon(Icons.arrow_forward_ios, size: 13),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                "${widget.product.name}",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "${widget.product.name}",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 14),
              expandDetailWidget('Description', 1),
              const SizedBox(height: 10),
              Visibility(
                visible: index == 1 ? true : false,
                child: const Text(
                  'Nylon Messenger Backpack By Balenciaga, Front Closure With Hook, Top Handle, Adjustable Shoulder Straps, Front Patch Zip Pocket With Contrast Logo, Hooks As Decorative Elements.',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              expandDetailWidget('Details', 2),
              const SizedBox(height: 10),
              Visibility(
                visible: index == 2 ? true : false,
                child: const Text(
                  'Nylon Messenger Backpack By Balenciaga, Front Closure With Hook, Top Handle, Adjustable Shoulder Straps, Front Patch Zip Pocket With Contrast Logo, Hooks As Decorative Elements.',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                '\$ '+"${widget.product.price}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16),
              ),
              const SizedBox(height: 5),
              Text(
                'SKU : '+"${widget.product.sku}",
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: chooseAnOptionWidget()),
                  const SizedBox(width: 15),
                  sizeChartWidget(),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  addToCartButton(),
                  addToWishlistButton(),
                ],
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageCarousel() {
    return Container(
      height: 270,
      width: Get.width,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: appColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                AppAsset.logo,
                height: 16,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (currentPage >= 1) {
                      currentPage--;
                      controller.jumpToPage(currentPage);
                    }
                  });
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Colors.black54,
                ),
              ),
              SizedBox(
                height: 200,
                width: Get.width * 0.6,
                child: PageView.builder(
                  controller: controller,
                  itemBuilder: (_, index) {
                    return Image.network(
                      'https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg',
                      fit: BoxFit.cover,
                    );
                  },
                  itemCount: 6,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (currentPage <= 5) {
                      currentPage++;
                      controller.jumpToPage(currentPage);
                    }
                  });
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget expandDetailWidget(String text, int value) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (index == value) {
            index = 0;
          } else {
            index = value;
          }
        });
      },
      child: Container(
        color: secondaryColor,
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.black),
            ),
            const Icon(Icons.expand_more, color: Colors.black),
          ],
        ),
      ),
    );
  }

  Widget addToCartButton() {
    return SizedBox(
      width: 145,
      height: 41,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 1,
          primary: appColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(AppAsset.cart),
            const Text(
              'ADD TO CART',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 13.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget addToWishlistButton() {
    return SizedBox(
      width: 175,
      height: 41,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 1,
          primary: appColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 18,
            ),
            Text(
              'ADD TO WISHLIST',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 13.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sizeChartWidget() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backGroundColor,
        border: Border.all(color: appColor),
      ),
      child: Text(
        'SIZE CHART',
        style: TextStyle(
          color: appColor,
        ),
      ),
    );
  }

  Widget allProductImages() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          imageWidget(),
          imageWidget(),
          imageWidget(),
          imageWidget(),
          imageWidget(),
          imageWidget(),
          imageWidget(),
          imageWidget(),
          imageWidget(),
        ],
      ),
    );
  }

  Widget imageWidget() {
    return Container(
      height: 45,
      width: 48,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration:
          BoxDecoration(border: Border.all(color: appColor, width: 1.25)),
      child: Image.network(
        'https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget chooseAnOptionWidget() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: appColor),
      ),
      child: const Text(
        'Choose An Option...',
        style: TextStyle(
          color: Colors.black54,
        ),
      ),
    );
  }
}
