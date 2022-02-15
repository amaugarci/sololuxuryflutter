import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:solo_luxury/app/utils/colors.dart';

class SizeGuidPage extends StatefulWidget {
  const SizeGuidPage({Key? key}) : super(key: key);

  @override
  _SizeGuidPageState createState() => _SizeGuidPageState();
}

class _SizeGuidPageState extends State<SizeGuidPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(color: lightBrownColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "SIZE GUIDE",
                          style: TextStyle(
                            color: brownColor,
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          Icons.close,
                          color: brownColor,
                        )
                      ],
                    )),
                SizedBox(height: 30),
                Container(
                    child: Row(
                  children: [
                    Container(
                        width: 80,
                        height: 32.17,
                        child: Image.asset("assets/images/shoe.png")),
                    SizedBox(width: 20),
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "BALENCIAGA",
                              style: TextStyle(fontSize: 16, color: brownColor),
                            ),
                            Text("LOAFERS IN LEATHER",
                                style:
                                    TextStyle(fontSize: 12, color: darkGrey)),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(Icons.stop, color: brownColor),
                                Text("Fit Predictor ",
                                    style: TextStyle(
                                        color: darkGrey, fontSize: 12)),
                                Text(
                                  "Calculate Your Size",
                                  style: TextStyle(
                                      color: brownColor, fontSize: 12),
                                )
                              ],
                            )
                          ]),
                    )
                  ],
                )),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Text("CONVERSION CHART",
                      style: TextStyle(color: brownColor, fontSize: 24)),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "US",
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(border: Border.all(width: 1)),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Standard",
                                  style: TextStyle(
                                      fontSize: 15, color: lightGrey)),
                              Icon(Icons.arrow_drop_down)
                            ]),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Row(children: [
                    Text("0",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("XXXS",
                        style: TextStyle(color: lightGrey, fontSize: 15)),
                    Icon(Icons.arrow_drop_down)
                  ]),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Row(children: [
                    Text("2",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("XXS",
                        style: TextStyle(color: lightGrey, fontSize: 15)),
                    Icon(Icons.arrow_drop_down)
                  ]),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Row(children: [
                    Text("4",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("XS",
                        style: TextStyle(color: lightGrey, fontSize: 15)),
                    Icon(Icons.arrow_drop_down)
                  ]),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Row(children: [
                    Text("6",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("S", style: TextStyle(color: lightGrey, fontSize: 15)),
                    Icon(Icons.arrow_drop_down)
                  ]),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Row(children: [
                    Text("8",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("M", style: TextStyle(color: lightGrey, fontSize: 15)),
                    Icon(Icons.arrow_drop_down)
                  ]),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Row(children: [
                    Text("10",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("L", style: TextStyle(color: lightGrey, fontSize: 15)),
                    Icon(Icons.arrow_drop_down)
                  ]),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Row(children: [
                    Text("12",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("XL",
                        style: TextStyle(color: lightGrey, fontSize: 15)),
                    Icon(Icons.arrow_drop_down)
                  ]),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Row(children: [
                    Text("14",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("XXL",
                        style: TextStyle(color: lightGrey, fontSize: 15)),
                    Icon(Icons.arrow_drop_down)
                  ]),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Row(children: [
                    Text("16",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("XXXL",
                        style: TextStyle(color: lightGrey, fontSize: 15)),
                    Icon(Icons.arrow_drop_down)
                  ]),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Row(children: [
                    Text("18",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("4XL",
                        style: TextStyle(color: lightGrey, fontSize: 15)),
                    Icon(Icons.arrow_drop_down)
                  ]),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Row(children: [
                    Text("20",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("5XL",
                        style: TextStyle(color: lightGrey, fontSize: 15)),
                    Icon(Icons.arrow_drop_down)
                  ]),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: MediaQuery.of(context).size.width * 0.15),
                  child: Row(children: [
                    Text("22",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text("6XL",
                        style: TextStyle(color: lightGrey, fontSize: 15)),
                    Icon(Icons.arrow_drop_down)
                  ]),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: Text(
                    "Nylon Messenger Backpack By Balenciaga, Front Closure With Hook, Top Handle, Adjustable Shoulder Straps, Front Patch.",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          )),
    );
  }
}
