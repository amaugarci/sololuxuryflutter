import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_asset.dart';
import '../../utils/colors.dart';
import 'brand_controller.dart';

class BrandDetailsPage extends GetView<BrandController> {
  const BrandDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BrandController controller = Get.find<BrandController>();

    return Obx(
      () => Scaffold(
        key: controller.scaffoldKey2.value,
        backgroundColor: backGroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Image.asset(
                      AppAsset.logo,
                      width: 110,
                      alignment: Alignment.center,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: appColor),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                      child: Text(
                        "${controller.brandDetails}",
                        style: const TextStyle(
                          color: appColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Theme(
                  data: ThemeData(
                    scrollbarTheme: const ScrollbarThemeData().copyWith(
                      thumbColor: MaterialStateProperty.all(appColor),
                      trackColor: MaterialStateProperty.all(Colors.red[500]),
                      trackBorderColor: MaterialStateProperty.all(Colors.yellow[500]),
                    ),
                  ),
                  child: Scrollbar(
                    hoverThickness: 15.0,
                    radius: Radius.circular(10),
                    showTrackOnHover: true,
                    thickness: 7.0,
                    isAlwaysShown: true,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.listDisplay(controller.brandDetails).length,
                      itemBuilder: (BuildContext context, int index) {
                        final countryInsideList = controller.listDisplay(controller.brandDetails)[index];
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          decoration: const BoxDecoration(border: Border()),
                          child: Text(
                            "$countryInsideList",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: appColor,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
