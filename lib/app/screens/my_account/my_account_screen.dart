import 'package:flutter/material.dart';
import 'package:solo_luxury/app/utils/colors.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
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
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: appColor),
                    borderRadius: BorderRadius.circular(5)),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true, dropdownColor: offWhite,
                    value: _chosenValue,
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
                      "My Account",
                      style: TextStyle(
                          color: appColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
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
                margin: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Text("Account Information",
                    style: TextStyle(color: appColor, fontSize: 18)),
              ),
              Container(
                decoration: BoxDecoration(color: offWhite),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("CONTACT INFORMATION",
                        style: TextStyle(
                            color: appColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    Divider(),
                    SizedBox(height: 10),
                    Text("Yogesh Kumar Sharma",
                        style: TextStyle(color: silver, fontSize: 12)),
                    Text("admin@gmail.com",
                        style: TextStyle(color: silver, fontSize: 12)),
                    SizedBox(height: 50),
                    Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(color: offWhite),
                        child: Text("EDIT | CHANGE PASSWORD",
                            style: TextStyle(
                                color: appColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)))
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(color: offWhite),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("NEWSLETTERS",
                        style: TextStyle(
                            color: appColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    Divider(),
                    SizedBox(height: 10),
                    Text("You Aren;t Subscribed To\nOur Newsletter.",
                        style: TextStyle(color: silver, fontSize: 12)),
                    SizedBox(height: 50),
                    Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(color: offWhite),
                        child: Text("EDIT",
                            style: TextStyle(
                                color: appColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text("Address Book ",
                        style: TextStyle(color: appColor, fontSize: 18)),
                    Text("Manage Addresses",
                        style: TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.underline)),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(color: offWhite),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("DEFAULT BILLING ADDRESS",
                        style: TextStyle(
                            color: appColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    Divider(),
                    SizedBox(height: 10),
                    Text(
                        "12345\n\nJaipur, Delhi, 302019\n\nIndia\n\nT: 01234567890",
                        style: TextStyle(color: silver, fontSize: 12)),
                    SizedBox(height: 50),
                    Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(color: offWhite),
                        child: Text("EDIT ADDRESS",
                            style: TextStyle(
                                color: appColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)))
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(color: offWhite),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("DEFAULT SHIPPING ADDRESS",
                        style: TextStyle(
                            color: appColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    Divider(),
                    SizedBox(height: 10),
                    Text(
                        "12345\n\nJaipur, Delhi, 302019\n\nIndia\n\nT: 01234567890",
                        style: TextStyle(color: silver, fontSize: 12)),
                    SizedBox(height: 50),
                    Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(color: offWhite),
                        child: Text("EDIT ADDRESS",
                            style: TextStyle(
                                color: appColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
