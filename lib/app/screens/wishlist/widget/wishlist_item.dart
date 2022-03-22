import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/data/model/Wishlist/wishlist_model.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';
import '../../../../utils/app_constants.dart';
import '../../../utils/colors.dart';

class WishlistItem extends StatelessWidget {
  Item? item;

  WishlistItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            height: 340,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: Get.width,
            child: Image.network(
              "${AppConstants.productImageUrl}${item!.product!.customAttributes!.first.value}",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: Get.width,
            padding:
                const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 30),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: backgroundticket,
              boxShadow: [
                BoxShadow(
                  color: blackColor.withOpacity(0.10),
                  blurRadius: 25,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  "${item!.product!.name}",
                  style: commonTextStyle400(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '\$ ' + "${item!.product!.price}",
                    style: commonTextStyle600(),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          LanguageConstant.qtyText.tr,
                          style: commonTextStyle400(),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 30,
                          width: 50,
                          alignment: Alignment.center,
                          child: Text(
                            "${item!.product!.status}",
                            style: commonTextStyle400(),
                          ),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(
                              color: appTextFieldHintColor,
                              width: 1,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        MaterialButton(
                          onPressed: () {},
                          height: 30,
                          child: Text(
                            LanguageConstant.addTOCart.tr.toUpperCase(),
                            style: commonTextStyle600(
                              color: whiteColor,
                              size: 14.0,
                            ),
                          ),
                          elevation: 0,
                          minWidth: 119,
                          color: addToCartColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Image(
                          image: AssetImage(AppAsset.edit),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Image(
                          image: AssetImage(AppAsset.delete),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),

      /*: Container(
        width: 150,
        color: backGroundColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 350,
                child: Image.network(
                  "${AppConstants.productImageUrl}${item!.product!.customAttributes!.first.value}",
                  // height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("${item!.product!.name}", style: TextStyle(fontSize: 20)),
                    SizedBox(
                      height: 5,
                    ),
                    Text("${item!.product!.name}", style: TextStyle(fontSize: 14)),
                    SizedBox(
                      height: 10,
                    ),
                    Text('\$ ' + "${item!.product!.price}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))
                  ]),
              const SizedBox(height: 10),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Qty ", style: TextStyle(fontSize: 15)),
                  Container(
                      decoration: BoxDecoration(color: Colors.white),
                      width: 50,
                      height: 45,
                      child: Center(
                          child: Text("1",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)))),
                  Container(
                      decoration: BoxDecoration(
                          color: brownColor,
                          borderRadius: BorderRadius.circular(50)),
                      width: 150,
                      height: 50,
                      child: Center(
                          child: Text("ADD TO CART",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)))),
                  Icon(Icons.edit),
                  Icon(Icons.delete),
                ],
              ))
            ],
          ),
        ),
      ),*/
    );
  }

  commonTextStyle400({var size}) {
    return TextStyle(
      color: blackColor,
      fontSize: size ?? 16,
      fontWeight: FontWeight.w400,
      fontFamily: AppConstants.fontOpenSans,
    );
  }

  commonTextStyle600({var size, var color}) {
    return TextStyle(
      color: color ?? blackColor,
      fontSize: size ?? 16,
      fontWeight: FontWeight.w600,
      fontFamily: AppConstants.fontOpenSans,
    );
  }
}
