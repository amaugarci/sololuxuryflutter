import 'package:flutter/material.dart';
import 'package:solo_luxury/app/utils/colors.dart';

class ListFilterPage extends StatefulWidget {
  const ListFilterPage({Key? key}) : super(key: key);

  @override
  _ListFilterPageState createState() => _ListFilterPageState();
}

class _ListFilterPageState extends State<ListFilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGroundColor,
        body: Container(
            child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 40),
            Container(
                child: Row(children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.3),
              Image.asset("assets/images/logo 2.png"),
              SizedBox(width: MediaQuery.of(context).size.width * 0.2),
              Icon(Icons.close, color: appColor)
            ])),
            SizedBox(height: 40),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: brownColor)),
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: lightBrownColor),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Price",
                        style: TextStyle(color: brownColor, fontSize: 16),
                      ),
                    ),
                    // Slider(value: 100, onChanged: null)
                  ],
                )),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: brownColor)),
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: lightBrownColor),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Color",
                            style: TextStyle(color: brownColor, fontSize: 16),
                          ),
                          Image.asset("assets/images/minus.png")
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(children: [
                            Text("Black",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                            Text("Blue",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                            Text("Brown",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                            Text("Green",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                          ]),
                          Column(children: [
                            Text("(56)",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                            Text("(3)",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                            Text("(9)",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                            Text("(2)",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                          ]),
                          Column(children: [
                            Text("White",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                            Text("Yellow",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                            Text("Pink",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                            Text("Tan",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                          ]),
                          Column(children: [
                            Text("(2)",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                            Text("(8)",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                            Text("(7)",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                            Text("(1)",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                          ]),
                        ],
                      ),
                    )
                  ],
                )),
            Container(
                height: 320,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: brownColor)),
                margin: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(color: lightBrownColor),
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Brand",
                              style: TextStyle(color: brownColor, fontSize: 16),
                            ),
                            Image.asset("assets/images/minus.png")
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: brownColor)),
                        margin: EdgeInsets.all(15),
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration.collapsed(
                              hintText: "Search",
                              hintStyle: TextStyle(fontSize: 14)),
                        ),
                      ),
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Brand 01",
                                  style: TextStyle(
                                      color: brownColor, fontSize: 14),
                                ));
                          })
                    ],
                  ),
                )),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: brownColor)),
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: lightBrownColor),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Size",
                            style: TextStyle(color: brownColor, fontSize: 16),
                          ),
                          Image.asset("assets/images/minus.png")
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(children: [
                            Text("11",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                            Text("35",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                            Text("35.5",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                            Text("40",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                          ]),
                          Column(children: [
                            Text("(56)",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                            Text("(3)",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                            Text("(9)",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                            Text("(1)",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                          ]),
                          Column(children: [
                            Text("38",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                            Text("39",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                            Text("40",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                            Text("41",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                          ]),
                          Column(children: [
                            Text("(2)",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                            Text("(8)",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                            Text("(7)",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                            Text("(1)",
                                style:
                                    TextStyle(color: brownColor, fontSize: 14)),
                          ]),
                        ],
                      ),
                    )
                  ],
                )),
            SizedBox(height: 100)
          ]),
        )));
  }
}
