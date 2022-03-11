import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solo_luxury/app/utils/colors.dart';

class MyTicketScreen extends StatefulWidget {
  const MyTicketScreen({Key? key}) : super(key: key);

  @override
  _MyTicketScreenState createState() => _MyTicketScreenState();
}

class _MyTicketScreenState extends State<MyTicketScreen> {
  int click = 0;
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    var MediaQueryw = MediaQuery.of(context).size.width;
    var MediaQueryh = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroundticket,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // SizedBox(width:1.0,),
                      Container(
                          width: MediaQueryw * 0.1,
                          child: Image.asset("assets/images/menusolo.png")),
                      Container(
                        width: MediaQueryw * 0.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/images/solo1.png",
                            ),
                            Image.asset("assets/images/magnifying2.png"),
                            Image.asset(
                              "assets/images/like2.png",
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/shoppingbag2.png",
                                  // width: 15.0,
                                ),
                                Positioned(
                                    top: 6,
                                    right: 0,
                                    child: Text(
                                      "0",
                                      style: TextStyle(
                                          fontSize: 8.0, color: Colors.black),
                                    ))
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  margin: EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
                        width: MediaQueryw,
                        color: secondarybackgroundcolor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  click = 6;
                                });
                              },
                              child: (click == 6)
                                  ? Container(
                                      width: MediaQueryw,
                                      color: backgroundticket,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.check,
                                              color: ticketTextColor,
                                            ),
                                            Text("My Account",
                                                style: TextStyle(
                                                    color: ticketTextColor)),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: MediaQueryw,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("My Account",
                                            style: TextStyle(
                                                color: ticketTextColor)),
                                      ),
                                    ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  click = 5;
                                });
                              },
                              child: (click == 5)
                                  ? Container(
                                      width: MediaQueryw,
                                      color: backgroundticket,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.check,
                                              color: ticketTextColor,
                                            ),
                                            Text("My Orders",
                                                style: TextStyle(
                                                    color: ticketTextColor)),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: MediaQueryw,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("My Orders",
                                            style: TextStyle(
                                                color: ticketTextColor)),
                                      ),
                                    ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  click = 4;
                                });
                              },
                              child: (click == 4)
                                  ? Container(
                                      width: MediaQueryw,
                                      color: backgroundticket,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.check,
                                              color: ticketTextColor,
                                            ),
                                            Text("My Wish List",
                                                style: TextStyle(
                                                    color: ticketTextColor)),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: MediaQueryw,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("My Wish List",
                                            style: TextStyle(
                                                color: ticketTextColor)),
                                      ),
                                    ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  click = 3;
                                });
                              },
                              child: (click == 3)
                                  ? Container(
                                      width: MediaQueryw,
                                      color: backgroundticket,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.check,
                                              color: ticketTextColor,
                                            ),
                                            Text("Address Book",
                                                style: TextStyle(
                                                    color: ticketTextColor)),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: MediaQueryw,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Address Book",
                                            style: TextStyle(
                                                color: ticketTextColor)),
                                      ),
                                    ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  click = 2;
                                });
                              },
                              child: (click == 2)
                                  ? Container(
                                      width: MediaQueryw,
                                      color: backgroundticket,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.check,
                                              color: ticketTextColor,
                                            ),
                                            Text("Account Information",
                                                style: TextStyle(
                                                    color: ticketTextColor)),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: MediaQueryw,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Account Information",
                                            style: TextStyle(
                                                color: ticketTextColor)),
                                      ),
                                    ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  click = 1;
                                });
                              },
                              child: (click == 1)
                                  ? Container(
                                      width: MediaQueryw,
                                      color: backgroundticket,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.check,
                                              color: ticketTextColor,
                                            ),
                                            Text("My Tickets",
                                                style: TextStyle(
                                                    color: ticketTextColor)),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: MediaQueryw,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("My Tickets",
                                            style: TextStyle(
                                                color: ticketTextColor)),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: backgroundticket,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(40),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(-1,
                                  1), // changes position of shadow, negative value on y makes it appering on the top
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQueryw,
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("ID"),
                                  Text("NAME"),
                                  Text("ACTION"),
                                ],
                              ),
                            ),
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.5 -
                                        50,
                                child: cartList()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  color: buttoncolor,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQueryw * 0.4 - 30,
                        child: TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 100.0,
                                  child: Center(
                                    child: Text(
                                      "ABOUT US",
                                      style: TextStyle(color: whiteColor),
                                    ),
                                  ),
                                ),
                                Icon(Icons.keyboard_arrow_down_outlined,
                                    color: whiteColor)
                              ],
                            )),
                      ),
                      Container(
                        width: MediaQueryw * 0.4 - 30,
                        child: TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 100.0,
                                  child: Center(
                                    child: Text(
                                      "CONTACT",
                                      style: TextStyle(color: whiteColor),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: whiteColor,
                                )
                              ],
                            )),
                      ),
                      Container(
                        width: MediaQueryw * 0.4 - 30,
                        child: TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 100.0,
                                  child: Center(
                                    child: Text(
                                      "SOCIAL",
                                      style: TextStyle(color: whiteColor),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: whiteColor,
                                )
                              ],
                            )),
                      ),
                      Container(
                        width: MediaQueryw * 0.4 - 30,
                        child: TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 100.0,
                                  child: Center(
                                    child: Text(
                                      "COMPANY",
                                      style: TextStyle(color: whiteColor),
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: whiteColor,
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 47,
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: whiteColor, width: 1.5),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 18),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Your email',
                            hintStyle: TextStyle(
                                color: Colors.black54, fontSize: 13.5),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        height: 47,
                        width: 120,
                        decoration: BoxDecoration(
                          color: buttoncolor,
                          borderRadius: BorderRadius.circular(30),
                          border:
                              Border.all(color: ticketTextColor, width: 1.5),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'SUBSCRIBE',
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 13.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Dialogbbox() {
    return AlertDialog(
      backgroundColor: backgroundticket,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      insetPadding: EdgeInsets.only(left: 12.0, right: 12.0),

      // title:
      content: Container(
        // margin: EdgeInsets.zero,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Transform.rotate(
              angle: 95,
              //set the angel
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.add_circle_outline,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4 - 30,
                  child: Text(
                    "Id",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(
                    "Name",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4 - 30,
                    child: Text(
                      "1010005",
                      style: TextStyle(),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(
                    "Hello Greate Team",
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4 - 30,
                  child: Text(
                    "Last Updated",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text("10-11-2021"),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4 - 30,
                  child: Text(
                    "Message",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                      "Can you sourece this bag \nfor me Can you sourece this \nbag for me"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget cartList() {
    var listview = ListView.builder(
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          setState(() {
            showDialog(
                context: context,
                builder: (context) {
                  return Dialogbbox();
                });
          });
        },
        child: Container(
          child: Column(
            children: [
              Container(
                color: (index % 2 == 0)
                    ? secondarybackgroundcolor
                    : backgroundticket,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 8.0, left: 12.0, right: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("1010005"),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text(
                            "Special Request | Suvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv",
                            overflow: TextOverflow.ellipsis,
                          )),
                      Icon(Icons.visibility_outlined)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    return listview;
  }
}
