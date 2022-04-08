import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_poppins.dart';
import 'package:solo_luxury/app/screens/my_orders/order_details_screen/return_reason_screen.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/data/model/MyOrders/MyOrdersData.dart';
import 'package:solo_luxury/data/model/order_traking/order_traking_model.dart';
import 'package:solo_luxury/data/model/return_reason/return_reason_model.dart';
import 'package:solo_luxury/data/requests/get_my_orders.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/return_reason_api_repository.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

class OrderDetailsController extends GetxController {
  RxInt index = 0.obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  final ReturnReasonAPIRepository myOrdersAPIRepository;
  OrderDetailsController({required this.myOrdersAPIRepository});
  RxList<ReturnReasonModel> returnReasonList = RxList<ReturnReasonModel>();
  RxList<OrderTrackingModel> orderTrackingList = RxList<OrderTrackingModel>();
  var isLoading = true.obs;
  dynamic argumentData = Get.arguments;

  @override
  void onInit() {
    getOrderTrackingList();
    super.onInit();
  }

  Rx<ReturnReasonModel> selectReturnReason = ReturnReasonModel().obs;
  getReturnReasonList() async {
    // isLoading.value = true;
    print("getStoreDataFromApi -> ");
    var returnReasonListData =
        jsonDecode(await myOrdersAPIRepository.getReturnReasonResponse());
    returnReasonList.value = List<ReturnReasonModel>.from(
      returnReasonListData.map(
        (reason) => ReturnReasonModel.fromJson(reason),
      ),
    );
    print("Reason list Get $returnReasonList");
    isLoading.value = false;
  }

  getOrderTrackingList() async {
    isLoading.value = true;
    print("getStoreDataFromApi -> ");
    var returnReasonListData = jsonDecode(await myOrdersAPIRepository
        .getOrderTeakingResponse(argumentData[1]!.incrementId.toString()));
    orderTrackingList.value = List<OrderTrackingModel>.from(
      returnReasonListData.map(
        (reason) => OrderTrackingModel.fromJson(reason),
      ),
    );
    print("OrderTracking  list Get $orderTrackingList");
    print("${orderTrackingList}");
    await getReturnReasonList();
  }

  //Post Return Item Data
  postReturnItem(order, context) async {
    var postReturnItem = await myOrdersAPIRepository.postReturnItemAPIResponse(
        order[0]!.itemId.toString(),
        order[0]!.sku.toString(),
        order[1]!.customerEmail.toString(),
        "${selectReturnReason.value.reason.toString()}",
        "gb-en");
    print("Response Is $postReturnItem");
    if (postReturnItem["message"] ==
        "Order return request successfully sent, you will get updates soon.") {
      Get.to(ReturnReasonScreen());
    } else {
      Navigator.pop(context);
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: CommonTextPoppins(postReturnItem["message"])),
      );
      // Get.to(ReturnReasonScreen());
    }
  }

//Order Tracking Dialog Box
  showOrderTrackingDialogBox(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Obx(
          () => AlertDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 10.0),
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            // titlePadding: EdgeInsets.zero,
            backgroundColor: Color(0xFFF9EAE3),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 14.0, top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.close, color: Color(0xff7e7a79))),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 20.0),
                    child: Row(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 6,
                                  ),
                                  height: 80,
                                  width: 4,
                                  color: orderTrackingList[0]
                                                  .statusDate
                                                  .toString() ==
                                              "null" ||
                                          orderTrackingList[0]
                                                  .statusDate
                                                  .toString() ==
                                              ""
                                      ? Color(0xff7e7a79)
                                      : Color(0xff7d675c),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipOval(
                                      child: Material(
                                        color: appColor, // Button color
                                        child: SizedBox(
                                          width: 18,
                                          height: 18,
                                          child: Center(
                                            child: Text(
                                              "1",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${orderTrackingList[0].statusTitle}",
                                          style: TextStyle(
                                            color: appColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(width: 60),
                                        orderTrackingList[0]
                                                        .statusDate
                                                        .toString() ==
                                                    "null" ||
                                                orderTrackingList[0]
                                                        .statusDate
                                                        .toString() ==
                                                    ""
                                            ? Text("")
                                            : Text(
                                                "${orderTrackingList[0].statusDate}",
                                                style: TextStyle(
                                                  color: appColor,
                                                  fontSize: 14,
                                                ),
                                              ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 6),
                                  height: 50,
                                  width: 4,
                                  color: orderTrackingList[1]
                                                  .statusDate
                                                  .toString() ==
                                              "null" ||
                                          orderTrackingList[1]
                                                  .statusDate
                                                  .toString() ==
                                              ""
                                      ? Color(0xff7e7a79)
                                      : Color(0xff7d675c),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ClipOval(
                                        child: Material(
                                      color: orderTrackingList[1]
                                                      .statusDate
                                                      .toString() ==
                                                  "null" ||
                                              orderTrackingList[1]
                                                      .statusDate
                                                      .toString() ==
                                                  ""
                                          ? Color(0xff7e7a79)
                                          : appColor, // Button color
                                      child: SizedBox(
                                        width: 18,
                                        height: 18,
                                        child: Center(
                                          child: Text(
                                            "2",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )),
                                    SizedBox(width: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${orderTrackingList[1].statusTitle}",
                                          style: TextStyle(
                                            color: orderTrackingList[2]
                                                            .statusDate
                                                            .toString() ==
                                                        "null" ||
                                                    orderTrackingList[2]
                                                            .statusDate
                                                            .toString() ==
                                                        ""
                                                ? Color(0xff7e7a79)
                                                : appColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(width: 60),
                                        orderTrackingList[1]
                                                        .statusDate
                                                        .toString() ==
                                                    "null" ||
                                                orderTrackingList[1]
                                                        .statusDate
                                                        .toString() ==
                                                    ""
                                            ? Text("")
                                            : Text(
                                                "${orderTrackingList[1].statusDate}",
                                                style: TextStyle(
                                                  color: appColor,
                                                  fontSize: 14,
                                                ),
                                              ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 6),
                                  height: 30,
                                  width: 4,
                                  color: orderTrackingList[2]
                                                  .statusDate
                                                  .toString() ==
                                              "null" ||
                                          orderTrackingList[2]
                                                  .statusDate
                                                  .toString() ==
                                              ""
                                      ? Color(0xff7e7a79)
                                      : Color(0xff7d675c),
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 6),
                                  height: 80,
                                  width: 4,
                                  color: orderTrackingList[2]
                                                  .statusDate
                                                  .toString() ==
                                              "null" ||
                                          orderTrackingList[2]
                                                  .statusDate
                                                  .toString() ==
                                              ""
                                      ? Color(0xff7e7a79)
                                      : Color(0xff7d675c),
                                ),
                                Row(
                                  children: [
                                    ClipOval(
                                      child: Material(
                                        color: orderTrackingList[2]
                                                        .statusDate
                                                        .toString() ==
                                                    "null" ||
                                                orderTrackingList[2]
                                                        .statusDate
                                                        .toString() ==
                                                    ""
                                            ? Color(0xff7e7a79)
                                            : Color(0xff7d675c), // Button color
                                        child: SizedBox(
                                          width: 18,
                                          height: 18,
                                          child: Center(
                                            child: Text(
                                              "3",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${orderTrackingList[2].statusTitle}",
                                          style: TextStyle(
                                            color: orderTrackingList[2]
                                                            .statusDate
                                                            .toString() ==
                                                        "null" ||
                                                    orderTrackingList[2]
                                                            .statusDate
                                                            .toString() ==
                                                        ""
                                                ? Color(0xff7e7a79)
                                                : appColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(width: 60),
                                        orderTrackingList[2]
                                                        .statusDate
                                                        .toString() ==
                                                    "null" ||
                                                orderTrackingList[2]
                                                        .statusDate
                                                        .toString() ==
                                                    ""
                                            ? Text("")
                                            : Text(
                                                "${orderTrackingList[2].statusDate}",
                                                style: TextStyle(
                                                  color: appColor,
                                                  fontSize: 14,
                                                ),
                                              ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 6),
                                  height: 10,
                                  width: 4,
                                  color: orderTrackingList[3]
                                                  .statusDate
                                                  .toString() ==
                                              "null" ||
                                          orderTrackingList[3]
                                                  .statusDate
                                                  .toString() ==
                                              ""
                                      ? Color(0xff7e7a79)
                                      : Color(0xff7d675c),
                                ),
                                Row(
                                  children: [
                                    ClipOval(
                                        child: Material(
                                            color: orderTrackingList[3]
                                                            .statusDate
                                                            .toString() ==
                                                        "null" ||
                                                    orderTrackingList[3]
                                                            .statusDate
                                                            .toString() ==
                                                        ""
                                                ? Color(0xff7e7a79)
                                                : Color(
                                                    0xff7d675c), // Button color
                                            child: SizedBox(
                                              width: 18,
                                              height: 18,
                                              child: Center(
                                                child: Text(
                                                  "4",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ))),
                                    SizedBox(width: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${orderTrackingList[3].statusTitle}",
                                          style: TextStyle(
                                            color: orderTrackingList[3]
                                                            .statusDate
                                                            .toString() ==
                                                        "null" ||
                                                    orderTrackingList[3]
                                                            .statusDate
                                                            .toString() ==
                                                        ""
                                                ? Color(0xff7e7a79)
                                                : appColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(width: 60),
                                        orderTrackingList[3]
                                                        .statusDate
                                                        .toString() ==
                                                    "null" ||
                                                orderTrackingList[3]
                                                        .statusDate
                                                        .toString() ==
                                                    ""
                                            ? Text("")
                                            : Text(
                                                "${orderTrackingList[3].statusDate}",
                                                style: TextStyle(
                                                  color: appColor,
                                                  fontSize: 14,
                                                ),
                                              ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ),
        );
      },
    );
  }

  //showReturn Reason Dialog
  showDialogBoxOpen(context, order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Obx(
          () => AlertDialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 10.0),
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            // titlePadding: EdgeInsets.zero,
            backgroundColor: Color(0xFFF9EAE3),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            content: Container(
              width: double.maxFinite,
              child: Form(
                // key: formKey.value,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.close,
                        size: 22,
                        color: Colors.transparent,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.close,
                            size: 22,
                            color: appColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 15.6,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                            color: const Color(0xFFDEC5B9), width: 1),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<ReturnReasonModel>(
                          dropdownColor: backGroundColor,
                          items: returnReasonList
                              .map(
                                (value) => DropdownMenuItem<ReturnReasonModel>(
                                  child: Text(value.reason.toString()),
                                  value: value,
                                ),
                              )
                              .toList(),
                          isExpanded: true,
                          hint: selectReturnReason.value.reason.toString() ==
                                  "null"
                              ? Text(
                                  LanguageConstant.reasonReturnText.tr,
                                  style: TextStyle(
                                    color: Color(0xFF6B6B6B).withOpacity(0.6),
                                    fontSize: 14,
                                  ),
                                )
                              : Text(
                                  "${selectReturnReason.value.reason.toString()}",
                                  style:
                                      const TextStyle(color: Color(0xFF6B6B6B)),
                                ),
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 22,
                            color: appColor,
                          ),
                          iconEnabledColor: Colors.transparent,
                          onChanged: (value) {
                            selectReturnReason.value = value!;
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  InkWell(
                    onTap: () {
                      if (selectReturnReason.value.reason.toString() ==
                          "null") {
                        ScaffoldMessenger.of(Get.context!).showSnackBar(
                          SnackBar(
                              content: CommonTextPoppins(
                                  "Please Select Return Reason Item")),
                        );
                      } else {
                        postReturnItem(order, context);
                      }
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
                      decoration: BoxDecoration(
                          color: appColor,
                          borderRadius: BorderRadius.circular(40)),
                      child: Text(
                        LanguageConstant.returnItemText.tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
//   Row(
//     children: [
//       ClipOval(
//           child: Material(
//               color: appColor, // Button color
//               child: SizedBox(
//                 width: 18,
//                 height: 18,
//                 child: Center(
//                   child: Text("1",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w500)),
//                 ),
//               ))),
//       SizedBox(
//         width: 10.0,
//       ),
//       Expanded(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "Order Placed",
//               style: TextStyle(
//                 color: appColor,
//                 fontSize: 14,
//               ),
//             ),
//             Text(
//               "March 11, 2022",
//               style: TextStyle(
//                 color: appColor,
//                 fontSize: 14,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ],
//   ),
//   Row(
//     children: [
//       SizedBox(
//         width: 6.0,
//       ),
//       Container(
//         width: 4,
//         height: 20,
//         color: appColor.withOpacity(1.0),
//       ),
//       SizedBox(
//         width: 10.0,
//       ),
//     ],
//   ),
