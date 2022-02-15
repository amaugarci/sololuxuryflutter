import 'package:flutter/material.dart';
import 'package:solo_luxury/app/utils/colors.dart';

class MyWishListPage extends StatefulWidget {
  const MyWishListPage({Key? key}) : super(key: key);

  @override
  _MyWishListPageState createState() => _MyWishListPageState();
}

class _MyWishListPageState extends State<MyWishListPage> {
  String? _chosenValue;
  String? _chosenValue1;
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
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: appColor),
                    borderRadius: BorderRadius.circular(5)),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true, dropdownColor: offWhite,
                    value: _chosenValue1,
                    // elevation: 0,
                    style: TextStyle(
                        color: appColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                    items: <String>[
                      'My Account',
                      'My Orders',
                      'My Wish List',
                      'Address Book',
                      'Account Information',
                      'My Tickets',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hint: Text(
                      "My Wish List",
                      style: TextStyle(
                          color: appColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _chosenValue1 = value;
                      });
                    },
                  ),
                ),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(color: Colors.white),
                              width: MediaQuery.of(context).size.width,
                              height: 250),
                          Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.centerLeft,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("MIU MIU",
                                        style: TextStyle(fontSize: 20)),
                                    Text("PAINTED MARY JANE",
                                        style: TextStyle(fontSize: 14)),
                                    Text("Rs 560.00",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold))
                                  ])),
                          Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Qty ", style: TextStyle(fontSize: 15)),
                              Container(
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  width: 50,
                                  height: 45,
                                  child: Center(
                                      child: Text("1",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)))),
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
                              Image.asset("assets/images/edit.png"),
                              Image.asset("assets/images/delete.png")
                            ],
                          ))
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
