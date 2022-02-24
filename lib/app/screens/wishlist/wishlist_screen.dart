import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/utils/colors.dart';

import '../../utils/app_asset.dart';
import '../home/widget/header_widget.dart';

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
      drawer: Icon(Icons.ac_unit),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backGroundColor,
        title: Image.asset(AppAsset.logo, width: 110),
        bottom: PreferredSize(
          preferredSize: Size(Get.width, 60),
          child: const HeaderWidget(),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: appColor),
      ),
      backgroundColor: backGroundColor,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: appColor),),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    alignment: AlignmentDirectional.center,
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
                        alignment: AlignmentDirectional.center,
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hint: Center(
                      child: Text(
                        "My Wish List",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: appColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
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
                            padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(color: Colors.white),
                              width: MediaQuery.of(context).size.width,
                              height: 250,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    AppAsset.logo,
                                    width: 90,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Image.network(
                                'https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg',
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),),
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
                                    SizedBox(height: 5,),
                                    Text("PAINTED MARY JANE",
                                        style: TextStyle(fontSize: 14)),
                                    SizedBox(height: 10,),
                                    Text("\$ 560.00",
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
                              Icon(Icons.edit),
                              Icon(Icons.delete),
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
