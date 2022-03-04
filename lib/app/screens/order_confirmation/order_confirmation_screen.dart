import 'package:flutter/material.dart';
import 'package:solo_luxury/app/utils/colors.dart';

class OrderConfirmationPage extends StatefulWidget {
  const OrderConfirmationPage({Key? key}) : super(key: key);

  @override
  _OrderConfirmationPageState createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  String? _chosenValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Icon(Icons.ac_unit),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backGroundColor,
        title: Image.asset("assets/images/logo 2.png"),
        centerTitle: true,
        iconTheme: IconThemeData(color: appColor),
      ),
      backgroundColor: backGroundColor,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
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
                            hint: Text(
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
                      Container(
                        width: 50,
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
                            hint: Text(
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
                      Container(
                        width: 70,
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
                            hint: Text(
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
                      Icon(Icons.search),
                      Image.asset("assets/images/heart.png"),
                      Icon(Icons.shopping_bag_rounded),
                      Text("0", style: TextStyle(fontSize: 11))
                    ],
                  )),
              SizedBox(height: 30),
              Container(
                  child: Text("Thank You For Your Purchase!",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18))),
              Container(
                  child: Text("Your Order # is: 14900004",
                      style: TextStyle(color: Colors.black, fontSize: 14))),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(color: offWhite),
                child: Column(
                  children: [
                    Icon(Icons.ac_unit),
                    Text("FENDI SLIDE SANDALS",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    SizedBox(height: 30),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "PRICE",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                          Text(
                            "QTY",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                          Text(
                            "SUB TOTAL",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          )
                        ],
                      ),
                    ),
                    Divider(),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(color: lightBrownColor),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Expected Shipment Date",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                            Text("Order Date",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold))
                          ]),
                    ),
                    Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                width: 220,
                height: 50,
                decoration: BoxDecoration(
                    color: brownColor, borderRadius: BorderRadius.circular(50)),
                child: Center(
                    child: Text("TRACK ORDER",
                        style: TextStyle(color: Colors.white, fontSize: 15))),
              ),
              SizedBox(height: 30),
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
                  child: Text("PAYMENT MODE",
                      style: TextStyle(
                          color: appColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold))),
              Divider(
                color: appColor,
              ),
              Text("Cash On Delivery"),
              SizedBox(height: 30),
              Container(
                width: 220,
                height: 50,
                decoration: BoxDecoration(
                    color: brownColor, borderRadius: BorderRadius.circular(50)),
                child: Center(
                    child: Text("CONTINUE SHOPPING",
                        style: TextStyle(color: Colors.white, fontSize: 15))),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
