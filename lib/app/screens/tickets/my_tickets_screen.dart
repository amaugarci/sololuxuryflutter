import 'package:flutter/material.dart';

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

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Color(0xffFBECE5),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // SizedBox(width:1.0,),
                          Row(
                            children: [
                              Icon(Icons.menu, color: Color(0xFF6F3015)),
                              // SizedBox(width: 12.0),
                            ],
                          ),
                          // Text(
                          //   "AVOIR CHIC",
                          //   style: TextStyle(color: Color(0xFFBD367587)),
                          // ),

                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 12.0),
                                child: Image.asset(
                                  "assets/images/logo.png",
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Icon(
                                Icons.search,
                                size: 25.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 12.0),
                                child: Image.asset(
                                  "assets/images/like1.png",
                                ),
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
                            color: Color(0xFFF6E6DF),
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
                                          color: Color(0xffFBECE5),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.check,
                                                  color: Color(0xFF6F3015),
                                                ),
                                                Text("My Account",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF6F3015))),
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
                                                    color: Color(0xFF6F3015))),
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
                                          color: Color(0xffFBECE5),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.check,
                                                  color: Color(0xFF6F3015),
                                                ),
                                                Text("My Orders",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF6F3015))),
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
                                                    color: Color(0xFF6F3015))),
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
                                          color: Color(0xffFBECE5),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.check,
                                                  color: Color(0xFF6F3015),
                                                ),
                                                Text("My Wish List",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF6F3015))),
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
                                                    color: Color(0xFF6F3015))),
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
                                          color: Color(0xffFBECE5),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.check,
                                                  color: Color(0xFF6F3015),
                                                ),
                                                Text("Address Book",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF6F3015))),
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
                                                    color: Color(0xFF6F3015))),
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
                                          color: Color(0xffFBECE5),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.check,
                                                  color: Color(0xFF6F3015),
                                                ),
                                                Text("Account Information",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF6F3015))),
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
                                                    color: Color(0xFF6F3015))),
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
                                          color: Color(0xffFBECE5),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.check,
                                                  color: Color(0xFF6F3015),
                                                ),
                                                Text("My Tickets",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF6F3015))),
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
                                                    color: Color(0xFF6F3015))),
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xffFBECE5),
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
                                // Container(
                                //   width: MediaQuery.of(context).size.width,
                                //   height: 1.0,
                                //   color: Colors.black,
                                // ),
                                Container(
                                  // padding: EdgeInsets.only(top: 12.0,bottom: 12.0,left: 10.0,right: 10.0),
                                  // margin: EdgeInsets.only(top: 12.0,bottom: 22.0,left: 10.0,right: 10.0),
                                  height:
                                      MediaQuery.of(context).size.height * 0.5 -
                                          50,

                                  child: ListView.builder(
                                    // itemCount: 2,
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  backgroundColor:
                                                      Color(0xffFBECE5),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                  ),
                                                  insetPadding: EdgeInsets.only(
                                                      left: 12.0, right: 12.0),

                                                  // title:
                                                  content: Container(
                                                    // margin: EdgeInsets.zero,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: MediaQueryh * 0.2,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Transform.rotate(
                                                          angle: 95,
                                                          //set the angel
                                                          child: Icon(
                                                            Icons
                                                                .add_circle_outline,
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              width:
                                                                  MediaQueryw *
                                                                          0.4 -
                                                                      30,
                                                              child: Text(
                                                                "Id",
                                                                style:
                                                                    TextStyle(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width:
                                                                  MediaQueryw *
                                                                      0.4,
                                                              child: Text(
                                                                "Name",
                                                                style:
                                                                    TextStyle(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 10.0,
                                                                      bottom:
                                                                          10.0),
                                                              child: Container(
                                                                width:
                                                                    MediaQueryw *
                                                                            0.4 -
                                                                        30,
                                                                child: Text(
                                                                  "1010005",
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width:
                                                                  MediaQueryw *
                                                                      0.4,
                                                              child: Text(
                                                                "Hello Greate Team",
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              width:
                                                                  MediaQueryw *
                                                                          0.4 -
                                                                      30,
                                                              child: Text(
                                                                "Last Updated",
                                                                style:
                                                                    TextStyle(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width:
                                                                  MediaQueryw *
                                                                      0.4,
                                                              child: Text(
                                                                  "10-11-2021"),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 10.0,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              width:
                                                                  MediaQueryw *
                                                                          0.4 -
                                                                      30,
                                                              child: Text(
                                                                "Message",
                                                                style:
                                                                    TextStyle(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width:
                                                                  MediaQueryw *
                                                                      0.5,
                                                              child: Text(
                                                                  "Can you sourece this bag \nfor me Can you sourece this \nbag for me"),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        });
                                      },
                                      child: Container(
                                        // margin: EdgeInsets.only(
                                        //     top: 12.0,
                                        //     bottom: 22.0,
                                        //     left: 10.0,
                                        //     right: 10.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              color: (index % 2 == 0)
                                                  ? Color(0xFFF6E6DF)
                                                  : Color(0xffFBECE5),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 8.0,
                                                    bottom: 8.0,
                                                    left: 12.0,
                                                    right: 25.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text("1010005"),
                                                    Container(
                                                        width:
                                                            MediaQueryw * 0.3,
                                                        child: Text(
                                                          "Special Request | Suvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        )),
                                                    Icon(Icons
                                                        .visibility_outlined)
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Container(
                                //   width: MediaQuery.of(context).size.width,
                                //   height: 1.0,
                                //   color: Colors.black,
                                // ),
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
                      color: Color(0xFF8A3A06),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 100.0,
                                      child: Center(
                                        child: Text(
                                          "ABOUT US",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: Colors.white,
                                    )
                                  ],
                                )),
                          ),
                          Container(
                            width: MediaQueryw * 0.4 - 30,
                            child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 100.0,
                                      child: Center(
                                        child: Text(
                                          "CONTACT",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: Colors.white,
                                    )
                                  ],
                                )),
                          ),
                          Container(
                            width: MediaQueryw * 0.4 - 30,
                            child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 100.0,
                                      child: Center(
                                        child: Text(
                                          "SOCIAL",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: Colors.white,
                                    )
                                  ],
                                )),
                          ),
                          Container(
                            width: MediaQueryw * 0.4 - 30,
                            child: TextButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 100.0,
                                      child: Center(
                                        child: Text(
                                          "COMPANY",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: Colors.white,
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.white, width: 1.5),
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
                              color: Color(0xFF8A3A06),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: Color(0xFF6F3015), width: 1.5),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'SUBSCRIBE',
                              style: TextStyle(
                                color: Colors.white,
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
        ),
        Visibility(
          visible: visible,
          child: Scaffold(
            backgroundColor: Colors.black54,
            body: Center(
              child: Container(
                margin: EdgeInsets.only(left: 12.0, right: 12.0),
                width: MediaQueryw,
                height: 200,
                color: Colors.white,
                child: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      visible = !visible;
                    });
                  },
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
