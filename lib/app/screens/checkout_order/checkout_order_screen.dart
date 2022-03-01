import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/buttons/text_button.dart';
import 'package:solo_luxury/app/components/common_widget/common_button.dart';
import 'package:solo_luxury/app/components/common_widget/common_divider.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_field.dart';
import 'package:solo_luxury/app/components/common_widget/common_text_poppins.dart';
import 'package:solo_luxury/app/screens/checkout_order/checkout_order_controller.dart';
import 'package:solo_luxury/app/screens/home/home_controller.dart';
import 'package:solo_luxury/app/screens/home/widget/checkout_box.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/data/model/Home/estimate_shipping_method_model.dart';
import 'package:solo_luxury/data/model/Home/shipping_information_model.dart';

import '../home/home_screen.dart';

class CheckoutOrderScreen extends GetView<CheckoutOrderController> {
  CheckoutOrderScreen({Key? key}) : super(key: key);
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    print("homeController -> " + runtimeType.toString());
    return Obx(() => Scaffold(
          key: controller.scaffoldkey,
          backgroundColor: backGroundColor,
          drawer: getDrawer(homeController),
          body: Container(
            width: Get.width,
            child: Stack(
              children: [
                Container(
                  // margin: EdgeInsets.only(top: MediaQuery.of(Get.context!).viewPadding.top + 35.0),
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(Get.context!).viewPadding.top + 45.0),
                  child: SingleChildScrollView(
                      padding: EdgeInsets.only(top: 70.0),
                      child: Form(
                          key: controller.formKey, child: checkOutWidget())),
                ),
                appBarWidget(controller),
              ],
            ),
          ),
        ));
  }

  Widget checkOutWidget() {
    return Container(
      width: Get.width,
      color: appColorAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonTextPoppins("Checkout",
              color: Colors.black87,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline),
          const SizedBox(
            height: 10.0,
          ),
          CommonTextPoppins(
            "Please Enter Your Details Below To Complete Your Purchase",
            textAlign: TextAlign.center,
            color: Colors.black87,
            fontSize: 10.0,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(
            height: 20.0,
          ),

          //TODO: Login Button
          SizedBox(
            height: 40,
            width: 120.0,
            child: CommonButton(
              padding: EdgeInsets.zero,
              buttonType: ButtonType.ElevatedButton,
              onPressed: () {},
              elevation: 0.0,
              color: appColorButton,
              borderRadius: 0.0,
              child: CommonTextPoppins(
                "Sign In",
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // PrimaryTextButton(
          //   height: 40,
          //   width: 120.0,
          //   title: 'Sign In',
          //   buttonColor: appColorButton,
          //   titleTextStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
          //   onPressed: () {},
          // ),
          const SizedBox(
            height: 20.0,
          ),
          checkoutForm(),
          const SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }

  Widget checkoutForm() {
    return Column(
      children: [
        CheckOutBox(
            title: "Shipping Address", formFieldWidget: shippingAddress()),
        const SizedBox(height: 15.0),
        CheckOutBox(
            title: "Shipping Method", formFieldWidget: shippingMethod()),
        const SizedBox(height: 15.0),
        CheckOutBox(
          title: "Payment Method",
          formFieldWidget: paymentMethod(),
        ),
        const SizedBox(height: 15.0),
        CheckOutBox(title: "Order Summary", formFieldWidget: orderSummary()),
      ],
    );
  }

  Widget shippingAddress() {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10.0),
          CommonTextField(
            hintText: "Email",
            controller: TextEditingController(),
          ),
          const SizedBox(height: 10.0),
          CommonTextField(
            hintText: "Password",
            controller: TextEditingController(),
          ),
          const SizedBox(height: 5.0),
          CommonTextPoppins(
            "You Already have an account with us. Sign in or continue as guest.",
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w500,
            fontSize: 9.0,
          ),
          const SizedBox(height: 15.0),
          SizedBox(
            height: 40.0,
            width: Get.width,
            child: CommonButton(
              buttonType: ButtonType.ElevatedButton,
              onPressed: () {},
              elevation: 0.0,
              color: appColorButton,
              borderRadius: 0.0,
              child: CommonTextPoppins(
                "LOGIN",
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          CommonTextPoppins(
            "Forgot Your Password?",
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w500,
            fontSize: 10.0,
          ),
          const SizedBox(
            height: 15.0,
          ),
          CommonDivider(
            color: appColorDarkLineGrey,
            height: 1.0,
            width: Get.width,
          ),
          const SizedBox(
            height: 25.0,
          ),
          Row(
            children: [
              Expanded(
                child: CommonTextField(
                  hintText: "First Name",
                  controller: TextEditingController(),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: CommonTextField(
                  hintText: "Last Name",
                  controller: TextEditingController(),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          CommonTextField(
            hintText: "Company",
            controller: TextEditingController(),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Expanded(
                child: CommonTextField(
                  hintText: "Street Address: Line 1",
                  controller: TextEditingController(),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: CommonTextField(
                  hintText: "City",
                  controller: TextEditingController(),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Expanded(
                child: CommonTextField(
                  hintText: "Japan",
                  controller: TextEditingController(),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: CommonTextField(
                  hintText: "State/Province",
                  controller: TextEditingController(),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Expanded(
                child: CommonTextField(
                  hintText: "Zip/Postal Code",
                  controller: TextEditingController(),
                  isValidationShow: false,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: CommonTextField(
                  hintText: "Phone Number",
                  controller: TextEditingController(),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  Widget shippingMethod() {
    if (controller.estimatesList == null) return Container();
    return Column(
      children: [
        const SizedBox(height: 10.0),
        ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.estimatesList?.length,
            itemBuilder: (context, index) {
              controller.estimateShipModel!.value =
                  EstimateShippingMethodModel.fromJson(
                      controller.estimatesList?[index]);
              return Obx(() => InkWell(
                    onTap: () {
                      controller.selectedShippingIndex.value = index;
                    },
                    child: SizedBox(
                      height: 25.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 18.0,
                            width: 18.0,
                            child: Center(
                              child: Container(
                                height: 12,
                                width: 12,
                                decoration: BoxDecoration(
                                    color: controller
                                                .selectedShippingIndex.value ==
                                            index
                                        ? Colors.black
                                        : Colors.transparent,
                                    border: Border.all(
                                        color: Colors.black, width: 0.8),
                                    shape: BoxShape.circle),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            flex: 2,
                            child: CommonTextPoppins(
                              controller.estimateShipModel!.value.baseAmount
                                  .toString(),
                              fontSize: 10.0,
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: CommonTextPoppins(
                              controller.estimateShipModel!.value.methodTitle,
                              fontSize: 10.0,
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: CommonTextPoppins(
                              "Flat Rate",
                              textAlign: TextAlign.left,
                              fontSize: 10.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
            }),
      ],
    );
  }

  Widget paymentMethod() {
    if (controller.shipInfoModel!.value.paymentMethods == null) {
      return Container();
    }
    return Column(
      children: [
        const SizedBox(height: 10.0),
        ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.shipInfoModel!.value.paymentMethods!.length,
            itemBuilder: (context, index) {
              PaymentMethods paymentMethods =
                  controller.shipInfoModel!.value.paymentMethods![index];
              return InkWell(
                onTap: () {
                  controller.selectedPaymentIndex.value = index;
                },
                child: Obx(() => Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                  color:
                                      controller.selectedPaymentIndex.value ==
                                              index
                                          ? Colors.black
                                          : Colors.transparent,
                                  border: Border.all(
                                      color: Colors.black, width: 0.8),
                                  shape: BoxShape.circle),
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            CommonTextPoppins(
                              paymentMethods.title,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            index ==
                                    controller.shipInfoModel!.value
                                            .paymentMethods!.length -
                                        1
                                ? Container()
                                : Column(
                                    children: [
                                      CommonDivider(
                                        color: appColorDarkLineGrey,
                                        height: 1.0,
                                        width: Get.width,
                                      ),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                    ],
                                  ),
                          ],
                        )
                      ],
                    )),
              );
            }),
      ],
    );
  }

  Widget orderSummary() {
    if (controller.shipInfoModel!.value.totals == null) {
      return Container();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() => InkWell(
              onTap: () {
                controller.isShowItems.value = !controller.isShowItems.value;
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 30.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonTextPoppins(
                          "${controller.shipInfoModel!.value.totals!.itemsQty} Item in Cart",
                          fontSize: 10.0,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.left,
                        ),
                        Image.asset(
                          AppAsset.upArrow,
                          width: 18.0,
                          height: 18.0,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  CommonDivider(
                    color: appColorDarkLineGrey,
                    height: 1.0,
                    width: Get.width,
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  !controller.isShowItems.value
                      ? Container()
                      : ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller
                              .shipInfoModel!.value.totals!.items!.length,
                          itemBuilder: (context, index) {
                            Items shipItem = controller
                                .shipInfoModel!.value.totals!.items![index];
                            return Column(
                              children: [
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(AppAsset.frame,
                                        height: 85.0, width: 85.0),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 85.0,
                                        width: Get.width,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CommonTextPoppins(
                                              shipItem.name,
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500,
                                              textAlign: TextAlign.left,
                                              maxLine: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CommonTextPoppins(
                                                  "Qty: ${shipItem.qty}",
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w500,
                                                  textAlign: TextAlign.left,
                                                ),
                                                CommonTextPoppins(
                                                  "${shipItem.price}",
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w500,
                                                  textAlign: TextAlign.left,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            );
                          }),
                  const SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            )),
        Row(
          children: [
            SizedBox(width: Get.width * 0.269),
            CommonTextPoppins(
              "View Details",
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Image.asset(
              AppAsset.downArrow,
              width: 18.0,
              height: 18.0,
              fit: BoxFit.cover,
            ),
          ],
        ),
        const SizedBox(
          height: 30.0,
        ),
        CommonDivider(
          color: appColorDarkLineGrey,
          height: 1.0,
          width: Get.width,
        ),
        const SizedBox(
          height: 20.0,
        ),
        CommonTextPoppins(
          "Apply Discount Code",
          fontSize: 10.0,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 10.0,
        ),
        SizedBox(
          height: 40.0,
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: CommonTextField(
                  hintText: "Enter Discount Code",
                  controller: TextEditingController(),
                  isValidationShow: false,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              SizedBox(
                height: 40.0,
                child: CommonButton(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  buttonType: ButtonType.ElevatedButton,
                  onPressed: () {},
                  elevation: 0.0,
                  color: appColorButton,
                  borderRadius: 0.0,
                  child: CommonTextPoppins(
                    "Apply Discount",
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 25.0,
        ),
        const SizedBox(
          height: 10.0,
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount:
                controller.shipInfoModel!.value.totals!.totalSegments!.length,
            itemBuilder: (context, index) {
              TotalSegments totalSegmentsItem =
                  controller.shipInfoModel!.value.totals!.totalSegments![index];
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CommonTextPoppins(
                          "${totalSegmentsItem.title}",
                          fontSize: 11.0,
                          maxLine: 2,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      CommonTextPoppins(
                        "${totalSegmentsItem.value ?? 0}",
                        fontSize: 10.0,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              );
            }),
        const SizedBox(
          height: 10.0,
        ),
        CommonDivider(
          color: appColorDarkLineGrey,
          height: 1.0,
          width: Get.width,
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonTextPoppins(
              "Order Total",
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.left,
            ),
            CommonTextPoppins(
              "${controller.shipInfoModel!.value.totals!.grandTotal}",
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.left,
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 40.0,
            child: CommonButton(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              buttonType: ButtonType.ElevatedButton,
              onPressed: () {
                print(
                    "valid -> ${controller.formKey.currentState!.validate()}");
                if (controller.formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(Get.context!).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              elevation: 0.0,
              color: appColorButton,
              borderRadius: 0.0,
              child: CommonTextPoppins(
                "PLACE ORDER",
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
