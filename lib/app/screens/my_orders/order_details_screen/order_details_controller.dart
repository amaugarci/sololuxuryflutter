import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/data/model/MyOrders/MyOrdersData.dart';
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
  var isLoading = true.obs;

  @override
  void onInit() {
    getReturnReasonList();
    super.onInit();
  }

  Rx<ReturnReasonModel> selectReturnReason = ReturnReasonModel().obs;
  getReturnReasonList() async {
    isLoading.value = true;
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

  //showReturn Reason Dialog

  showDialogBoxOpen(context) {
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
                    onTap: () {},
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
