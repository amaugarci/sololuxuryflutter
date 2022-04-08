import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/utils/colors.dart';

import '../../../utils/lang_directory/language_constant.dart';
import '../../components/common_widget/common_appbar.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String? _chosenValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
        title: LanguageConstant.checkOutText.tr,
      ),
      backgroundColor: backGroundColor,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 110,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: offWhite,
                            value: _chosenValue,
                            // elevation: 0,
                            style: TextStyle(
                                color: appColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                            items: <String>[]
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            hint: const Text(
                              "UNITED KINGDOM",
                              style: TextStyle(
                                  fontSize: 9, fontWeight: FontWeight.w600),
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                _chosenValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: offWhite,
                            value: _chosenValue,
                            // elevation: 0,
                            style: const TextStyle(
                                color: appColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                            items: <String>[]
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            hint: const Text(
                              "GBF",
                              style: TextStyle(
                                  fontSize: 9, fontWeight: FontWeight.w600),
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                _chosenValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 70,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: offWhite,
                            value: _chosenValue,
                            // elevation: 0,
                            style: const TextStyle(
                                color: appColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                            items: <String>[]
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            hint: const Text(
                              "ENGLISH",
                              style: TextStyle(
                                  fontSize: 9, fontWeight: FontWeight.w600),
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                _chosenValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                      const Icon(Icons.search),
                      Image.asset("assets/images/heart.png"),
                      const Icon(Icons.shopping_bag_rounded),
                      const Text("0", style: TextStyle(fontSize: 11))
                    ],
                  )),
              const SizedBox(height: 30),
              const Text(
                "CHECKOUT",
                style: TextStyle(color: appColor, fontSize: 20),
              ),
              Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1),
                  child: const Text(
                      "Please Enter Your Details Below To Complete Your Purchase",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: darkGrey,
                      ))),
              Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: appColor)),
                  child: Column(
                    children: [
                      const Text("SHIPPING ADDRESS",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Divider(color: appColor),
                      const SizedBox(height: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(width: 1, color: appColor),
                                borderRadius: BorderRadius.circular(1)),
                            child: TextFormField(
                              decoration: const InputDecoration.collapsed(
                                  hintText: "Email Address",
                                  hintStyle: TextStyle(fontSize: 14)),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                              "You can create an account after checkout.",
                              style: TextStyle(fontSize: 10)),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 155,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(width: 1, color: appColor),
                                    borderRadius: BorderRadius.circular(1)),
                                child: TextFormField(
                                  decoration: const InputDecoration.collapsed(
                                      hintText: "First Name",
                                      hintStyle: TextStyle(fontSize: 14)),
                                ),
                              ),
                              Container(
                                width: 155,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(width: 1, color: appColor),
                                    borderRadius: BorderRadius.circular(1)),
                                child: TextFormField(
                                  decoration: const InputDecoration.collapsed(
                                      hintText: "Last Name",
                                      hintStyle: TextStyle(fontSize: 14)),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(width: 1, color: appColor),
                                borderRadius: BorderRadius.circular(1)),
                            child: TextFormField(
                              decoration: const InputDecoration.collapsed(
                                  hintText: "Company",
                                  hintStyle: TextStyle(fontSize: 14)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(width: 1, color: appColor),
                                borderRadius: BorderRadius.circular(1)),
                            child: TextFormField(
                              decoration: const InputDecoration.collapsed(
                                  hintText: "Street Address",
                                  hintStyle: TextStyle(fontSize: 14)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(width: 1, color: appColor),
                                borderRadius: BorderRadius.circular(1)),
                            child: TextFormField(
                              decoration: const InputDecoration.collapsed(
                                  hintText: "Street Address2",
                                  hintStyle: TextStyle(fontSize: 14)),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(width: 1, color: appColor),
                                borderRadius: BorderRadius.circular(1)),
                            child: TextFormField(
                              decoration: const InputDecoration.collapsed(
                                  hintText: "Street Address3",
                                  hintStyle: TextStyle(fontSize: 14)),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 155,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(width: 1, color: appColor),
                                    borderRadius: BorderRadius.circular(1)),
                                child: TextFormField(
                                  decoration: const InputDecoration.collapsed(
                                      hintText: "City",
                                      hintStyle: TextStyle(fontSize: 14)),
                                ),
                              ),
                              Container(
                                width: 155,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(width: 1, color: appColor),
                                    borderRadius: BorderRadius.circular(1)),
                                child: TextFormField(
                                  decoration: const InputDecoration.collapsed(
                                      hintText: "United Kingdom",
                                      hintStyle: TextStyle(fontSize: 14)),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 155,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(width: 1, color: appColor),
                                      borderRadius: BorderRadius.circular(1)),
                                  child: TextFormField(
                                    decoration: const InputDecoration.collapsed(
                                        hintText: "State/Province",
                                        hintStyle: TextStyle(fontSize: 14)),
                                  ),
                                ),
                                Container(
                                  width: 155,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(width: 1, color: appColor),
                                      borderRadius: BorderRadius.circular(1)),
                                  child: TextFormField(
                                    decoration: const InputDecoration.collapsed(
                                        hintText: "Zip/Postal Code",
                                        hintStyle: TextStyle(fontSize: 14)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(width: 1, color: appColor),
                                borderRadius: BorderRadius.circular(1)),
                            child: TextFormField(
                              decoration: const InputDecoration.collapsed(
                                  hintText: "Phone Number",
                                  hintStyle: TextStyle(fontSize: 14)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: appColor)),
                  child: Column(
                    children: [
                      const Text("SHIPPING METHOD",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Divider(color: appColor),
                      const SizedBox(height: 20),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text("Price",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text(
                                  "Rs 161,360.00",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Rs 161,360.00",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                )
                              ],
                            )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text("Title",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text(
                                  "Free",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Fixed",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text("Carrier Title",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                                Text(
                                  "Free Shipping",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Standard Shipping",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10)
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: appColor)),
                  child: Column(
                    children: [
                      const Text("PAYMENT METHOD",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Divider(color: appColor),
                      const SizedBox(height: 20),
                      Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text("Check/Money order",
                              style: TextStyle(fontSize: 12)),
                          Divider(),
                          Text("Cash On Delivery",
                              style: TextStyle(fontSize: 12)),
                          Divider(),
                          Text("Pay by Card with Checkout.com",
                              style: TextStyle(fontSize: 12))
                        ],
                      )),
                      SizedBox(height: 10)
                    ],
                  )),
              Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: appColor)),
                  child: Column(
                    children: [
                      const Text("SUPPORT A CHARITY WITH YOUR DONATION",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Divider(color: appColor),
                      const SizedBox(height: 20),
                      Container(
                        child: Row(
                          children: [
                            Container(
                                width: 90,
                                height: 60,
                                decoration: BoxDecoration(color: Colors.white)),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                    "15% Of The Order Value Will\n Be Donated By Avoirchic For\n Donation",
                                    style: TextStyle(fontSize: 13)),
                                SizedBox(height: 5),
                                Text("PLEASE CLICK HERE TO DONATE\n NOW",
                                    style: TextStyle(fontSize: 12)),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10)
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: appColor)),
                  child: Column(
                    children: [
                      const Text("ORDER SUMMARY",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Divider(color: appColor),
                      Text("1 Item in Cart",
                          style: TextStyle(fontSize: 14, color: silver)),
                      Divider(),
                      SizedBox(height: 20),
                      Container(
                        child: Row(
                          children: [
                            Container(
                                width: 150,
                                height: 100,
                                decoration: BoxDecoration(color: Colors.white)),
                            SizedBox(width: 10),
                            Container(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "THE POUCH BAG",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Qty: 1",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  "Rs 161,360.00",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "View Details",
                                  style:
                                      TextStyle(fontSize: 12, color: lightGrey),
                                ),
                              ],
                            ))
                          ],
                        ),
                      ),
                      Divider(),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: appColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 220,
                              padding: const EdgeInsets.all(10),
                              child: TextFormField(
                                  decoration: InputDecoration.collapsed(
                                      hintText: "ENTER DISCOUNT CODE",
                                      hintStyle: TextStyle(
                                          color: darkGrey, fontSize: 14))),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(color: appColor),
                              child: Center(
                                child: Text("APPLY",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white)),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Cart Subtotal",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("Rs 161,360.00",
                                        style: TextStyle(fontSize: 14))
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Shipping",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("Rs 0.00",
                                        style: TextStyle(fontSize: 14))
                                  ],
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Firas Sample Shipping Method - Fixed",
                                  style: TextStyle(fontSize: 14),
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Order Total",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("Rs 480.00",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                SizedBox(height: 20),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: appColor)),
                                  padding: EdgeInsets.all(10),
                                  child: TextFormField(
                                      decoration: InputDecoration.collapsed(
                                          hintText: "Order Comment",
                                          hintStyle: TextStyle(
                                              fontSize: 14, color: darkGrey))),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                          decoration: BoxDecoration(color: appColor),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 50,
                          child: Center(
                              child: Text("PLACE ORDER",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)))),
                      SizedBox(height: 50)
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
