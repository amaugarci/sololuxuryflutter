import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/order_confirmation/order_confirmation_controller.dart';
import 'package:solo_luxury/app/utils/colors.dart';

import '../../../data/model/Home/menu_model.dart';
import '../../utils/app_asset.dart';
import 'package:solo_luxury/app/components/common_widget/custom_expansion_tile.dart'
    as custom;

import '../home/home_controller.dart';

class OrderConfirmationPage extends GetView<OrderConfirmationController> {
  OrderConfirmationPage({Key? key}) : super(key: key);

  final HomeController homeController = Get.put(HomeController(homeAPIRepository: Get.find()));

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          key: controller.scaffoldkey,
          backgroundColor: appColorAccent,
          drawer: getDrawer(homeController),
          body: Container(
            margin: EdgeInsets.all(10),
            width: Get.width,
            child: Stack(
              children: [
                appBarWidget(controller),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(Get.context!).viewPadding.top + 45.0),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.zero,
                    child: Column(
                      children: [
                        SizedBox(height: 40),
                        Container(
                            child: Text("THANK YOU FOR YOUR PURCHASE!",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18))),
                        SizedBox(height: 5),
                        Container(
                            child: Text("Your Order # is: 14900004",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14))),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          decoration: BoxDecoration(color: offWhite),
                          child: Column(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          AppAsset.logo,
                                          width: 35,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Image.network(
                                      'https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg',
                                      height: 60,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Text("FENDI SLIDE SANDALS",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              SizedBox(height: 30),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "PRICE",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    Text(
                                      "QTY",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    Text(
                                      "SUB TOTAL",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    )
                                  ],
                                ),
                              ),
                              Divider(),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "29,960.00",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    Text(
                                      "1",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    Text(
                                      "29,960.00",
                                      style: TextStyle(fontSize: 13),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          decoration: BoxDecoration(color: lightBrownColor),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Expected Shipment Date",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                      Text("Order Date",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold))
                                    ]),
                              ),
                              SizedBox(height: 10),
                              Container(
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("September 12, 2022",
                                          style: TextStyle(
                                            fontSize: 13,
                                          )),
                                      Text("September 8, 2022",
                                          style: TextStyle(
                                            fontSize: 13,
                                          ))
                                    ]),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 180,
                          height: 40,
                          decoration: BoxDecoration(
                              color: brownColor,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                              child: Text("TRACK ORDER",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))),
                        ),
                        SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                child: Text("SHIPPING ADDRESS",
                                    style: TextStyle(
                                        color: appColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))),
                            Divider(
                              color: appColor,
                            ),
                            Text(
                                "123456\n\nJaipur, Delhi, 302019\n\nIndia\n\nT: 01234567890"),
                            SizedBox(height: 30),
                            Container(
                                child: Text("BILLING ADDRESS",
                                    style: TextStyle(
                                        color: appColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))),
                            Divider(
                              color: appColor,
                            ),
                            Text(
                                "123456\n\nJaipur, Delhi, 302019\n\nIndia\n\nT: 01234567890"),
                            SizedBox(height: 30),
                            Container(
                                child: Text("PAYMENT METHOD",
                                    style: TextStyle(
                                        color: appColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))),
                            Divider(
                              color: appColor,
                            ),
                            Text("Cash On Delivery"),
                          ],
                        ),

                        SizedBox(height: 30),
                        Container(
                          width: 180,
                          height: 40,
                          decoration: BoxDecoration(
                              color: brownColor,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                              child: Text("CONTINUE SHOPPING",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15))),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  getDrawer(controller) {
    return SizedBox(
        child: Drawer(
            child: SizedBox(
      width: Get.width - 40.0,
      child: getDrawerView(controller),
    )));
  }

  Widget getDrawerView(controller) {
    if (controller.menuModel?.value?.childrenData == null) {
      return Container();
    }
    return Container(
      height: Get.height,
      width: Get.width,
      color: appColorAccent,
      child: Stack(
        children: [
          Container(
            height: 40.0,
            margin: EdgeInsets.only(
                top: MediaQuery.of(Get.context!).viewPadding.top),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: Get.height,
                    color: appColorPrimary,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset(AppAsset.menu,
                                color: appColorAccent,
                                height: 18.0,
                                width: 18.0)),
                        Row(
                          children: const [
                            SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              "Menu",
                              style: TextStyle(
                                  color: appColorAccent, fontSize: 16.0),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: Get.height,
                    color: appColorPrimaryGrey,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 30.0),
                    child: const Text(
                      "Account",
                      style: TextStyle(color: appColorDarkGrey, fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 65),
            child: Stack(
              children: [
                ListView(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  primary: true,
                  padding: EdgeInsets.zero,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 10.0,
                        ),
                        ListView.builder(
                            // Important: Remove any padding from the ListView.
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: controller
                                .menuModel?.value?.childrenData?.length,
                            itemBuilder: (context, index) {
                              ChildrenData itemLevel1 = controller
                                  .menuModel?.value?.childrenData?[index];
                              return itemLevel1.isActive!
                                  ? Column(
                                      children: [
                                        custom.ExpansionTile(
                                          tileHeight: 40,
                                          verticalVisualDensity: -1,
                                          contentPadding: const EdgeInsets.only(
                                              left: 10, right: 20),
                                          title: Text(itemLevel1.name!,
                                              style: const TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: appColorDarkGrey)),
                                          isIcon:
                                              itemLevel1.childrenData!.isEmpty
                                                  ? true
                                                  : false,
                                          children: [
                                            ListView.builder(
                                              padding: const EdgeInsets.only(
                                                  left: 0,
                                                  right: 0,
                                                  top: 0,
                                                  bottom: 10),
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: itemLevel1
                                                  .childrenData!.length,
                                              itemBuilder: (context, index1) {
                                                ChildrenData itemLevel2 =
                                                    itemLevel1
                                                        .childrenData![index1];
                                                return custom.ExpansionTile(
                                                  title: Text(itemLevel2.name!,
                                                      style: const TextStyle(
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: appColorDarkGrey,
                                                      )),
                                                  contentPadding:
                                                      const EdgeInsets.only(
                                                          left: 25, right: 20),
                                                  tileHeight: 35,
                                                  verticalVisualDensity: -1,
                                                  isIcon: itemLevel2
                                                          .childrenData!.isEmpty
                                                      ? true
                                                      : false,
                                                  children: [
                                                    ListView.builder(
                                                        shrinkWrap: true,
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        padding:
                                                            EdgeInsets.zero,
                                                        itemCount: itemLevel2
                                                            .childrenData!
                                                            .length,
                                                        itemBuilder:
                                                            (context, index2) {
                                                          ChildrenData
                                                              itemLevel3 =
                                                              itemLevel2
                                                                      .childrenData![
                                                                  index2];
                                                          return Container(
                                                            margin:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 40.0,
                                                                    top: 3.0,
                                                                    bottom:
                                                                        3.0),
                                                            child: Text(
                                                              itemLevel3.name!,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: const TextStyle(
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color:
                                                                      appColorDarkGrey),
                                                            ),
                                                          );
                                                        })
                                                  ],
                                                );
                                              },
                                            )
                                          ],
                                        ),
                                        const Divider(
                                          height: 2.0,
                                          color: appColorDarkGrey,
                                        )
                                      ],
                                    )
                                  : Container();
                            }),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  appBarWidget(controller) {
    return Container(
      width: Get.width,
      margin: EdgeInsets.only(
          top: MediaQuery.of(Get.context!).viewPadding.top + 10.0,
          left: 10.0,
          right: 15.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppAsset.logo,
            height: 40.0,
            width: Get.width * 0.35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  print("onTap ->");
                  if (!controller.scaffoldkey.currentState!.isDrawerOpen) {
                    controller.scaffoldkey.currentState!.openDrawer();
                  }
                },
                child: Container(
                  height: 30.0,
                  width: 30.0,
                  child: Center(
                    child: Image.asset(
                      AppAsset.menu,
                      height: 20.0,
                      width: 20.0,
                      color: appColorPrimary,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15.0,
                  ),
                  SvgPicture.asset(
                    AppAsset.search,
                    height: 20.0,
                    width: 20.0,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  SvgPicture.asset(
                    AppAsset.heart,
                    height: 20.0,
                    width: 20.0,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  SvgPicture.asset(
                    AppAsset.cart,
                    height: 20.0,
                    width: 20.0,
                    color: Colors.black,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
