import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:solo_luxury/app/components/common_widget/common_appbar.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/data/model/MyOrders/MyOrdersData.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';
import '../../utils/app_asset.dart';

class OrderDetailsScreen extends StatelessWidget {
  ParentItemElement? itemData;
  MyOrdersDataItem? orderData;

  OrderDetailsScreen({
    Key? key,
    this.itemData,
    this.orderData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var date = itemData!.createdAt;

    return Scaffold(
      backgroundColor: appColorAccent,
      appBar: commonAppbar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            const SizedBox(height: 20),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: LanguageConstant.orderIdTitle.tr,
                    style: commonTextStyle16400(),
                  ),
                  TextSpan(
                    text: itemData!.itemId.toString(),
                    style: commonTextStyle16500(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: appColorFDF3F1,
                boxShadow: [
                  BoxShadow(
                    color: blackColor.withOpacity(0.25),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: wishListBorder,
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
                  const SizedBox(height: 10),
                  Text(itemData!.name.toString(),
                      style: commonTextStyle20400()),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LanguageConstant.price.tr.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          fontFamily: AppConstants.fontPoppins,
                          color: unselectedTabColor,
                        ),
                      ),
                      Text(
                        "${LanguageConstant.qty.tr}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          fontFamily: AppConstants.fontPoppins,
                          color: unselectedTabColor,
                        ),
                      ),
                      Text(
                        LanguageConstant.subTotal.tr.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          fontFamily: AppConstants.fontPoppins,
                          color: unselectedTabColor,
                        ),
                      )
                    ],
                  ),
                  const Divider(
                    height: 9,
                    color: appColorDullPrimary,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        itemData!.price.toString(),
                        style: commonTextStyle20400(size: 14.0),
                      ),
                      Text(
                        itemData!.qtyOrdered.toString(),
                        style: commonTextStyle20400(size: 14.0),
                      ),
                      Text(
                        itemData!.baseRowTotal.toString(),
                        style: commonTextStyle20400(size: 14.0),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(color: brownF0DFD8),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LanguageConstant.expectedDate.tr,
                          style: commonTextStyle20400(size: 16.0),
                        ),
                        Text(
                          LanguageConstant.orderDate.tr,
                          style: commonTextStyle20400(size: 16.0),
                        ),
                      ]),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "September 12, 2022",
                        style: commonTextStyle20400(size: 15.0),
                      ),
                      Text(
                        DateFormat.yMMMMd().format(
                            DateTime.parse(itemData!.createdAt.toString())),
                        style: commonTextStyle20400(size: 15.0),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: 173,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: appColorButton,
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                LanguageConstant.trackOrderText.tr.toUpperCase(),
                style: commonTextStyle20500(
                  size: 18.0,
                  color: whiteColor,
                ),
              ),
            ),
            const SizedBox(height: 45),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LanguageConstant.shippingAddressText.tr.toUpperCase(),
                    style: commonTextStyle20600(
                      color: appColorButton,
                      size: 20.0,
                    ),
                  ),
                  const Divider(
                    height: 24,
                    color: appColorDullPrimary,
                    thickness: 1,
                  ),
                  Text(
                    // "123456\n\nJaipur, Delhi, 302019\n\nIndia\n\nT: 01234567890",

                    orderData!.extensionAttributes!.shippingAssignments![0] ==
                            null
                        ? ""
                        : orderData!.extensionAttributes!
                                .shippingAssignments![0].shipping!.address!.city
                                .toString() +
                            ", " +
                            orderData!
                                .extensionAttributes!
                                .shippingAssignments![0]
                                .shipping!
                                .address!
                                .postcode
                                .toString() +
                            "\n\n" +
                            orderData!
                                .extensionAttributes!
                                .shippingAssignments![0]
                                .shipping!
                                .address!
                                .countryId
                                .toString() +
                            "\n\n" +
                            "T:" +
                            orderData!
                                .extensionAttributes!
                                .shippingAssignments![0]
                                .shipping!
                                .address!
                                .telephone
                                .toString(),
                    style: commonTextStyleOpen400(size: 16.0),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    LanguageConstant.billingAddress.tr.toUpperCase(),
                    style: commonTextStyle20600(
                      color: appColorButton,
                      size: 20.0,
                    ),
                  ),
                  const Divider(
                    height: 24,
                    color: appColorDullPrimary,
                    thickness: 1,
                  ),
                  Text(
                    // "123456\n\nJaipur, Delhi, 302019\n\nIndia\n\nT: 01234567890",
                    orderData!.billingAddress!.street![0].toString() +
                        ",\n\n" +
                        orderData!.billingAddress!.city.toString() +
                        ", " +
                        orderData!.billingAddress!.postcode.toString() +
                        "\n\n" +
                        orderData!.billingAddress!.countryId.toString() +
                        "\n\n" +
                        "T:" +
                        orderData!.billingAddress!.telephone.toString(),
                    style: commonTextStyleOpen400(size: 16.0),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    LanguageConstant.paymentMethod.tr.toUpperCase(),
                    style: commonTextStyle20600(
                      color: appColorButton,
                      size: 20.0,
                    ),
                  ),
                  const Divider(
                    height: 24,
                    color: appColorDullPrimary,
                    thickness: 1,
                  ),
                  Text(
                    orderData!.payment!.method.toString(),
                    style: commonTextStyleOpen400(size: 16.0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Container(
              width: 215,
              height: 40,
              decoration: BoxDecoration(
                  color: appColorButton,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  LanguageConstant.continueShopping.tr.toUpperCase(),
                  style: commonTextStyleOpen400(size: 18.0, color: whiteColor),
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  commonTextStyle16400() {
    return const TextStyle(
      color: blackColor,
      fontSize: 16,
      fontFamily: AppConstants.fontMontserrat,
      fontWeight: FontWeight.w400,
    );
  }

  commonTextStyle20400({var size}) {
    return TextStyle(
      color: blackColor,
      fontSize: size ?? 20,
      fontFamily: AppConstants.fontPoppins,
      fontWeight: FontWeight.w400,
    );
  }

  commonTextStyle20500({var size, var color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontSize: size ?? 20,
      fontFamily: AppConstants.fontPoppins,
      fontWeight: FontWeight.w500,
    );
  }

  commonTextStyle20600({var size, var color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontSize: size ?? 20,
      fontFamily: AppConstants.fontOpenSans,
      fontWeight: FontWeight.w600,
    );
  }

  commonTextStyleOpen400({var size, var color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontSize: size ?? 20,
      fontFamily: AppConstants.fontOpenSans,
      fontWeight: FontWeight.w400,
    );
  }

  commonTextStyle16500() {
    return const TextStyle(
      color: blackColor,
      fontSize: 16,
      fontFamily: AppConstants.fontMontserrat,
      fontWeight: FontWeight.w500,
    );
  }
}
