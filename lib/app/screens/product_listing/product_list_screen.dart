import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_asset.dart';
import 'product_controller.dart';

class ProductListScreen extends GetView<ProductController> {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Obx(() => SafeArea(
      child: Scaffold(
        body: Container(
          height: mq.height,
          width: mq.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: controller.backgroundColorValue.value,
          ),
          child: Image.asset(AppAsset.logo,
              height: mq.height * 0.25, width: mq.width * 0.5),
        ),
      ),
    ));
  }
}