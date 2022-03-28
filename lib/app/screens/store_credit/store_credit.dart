import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';

import 'store_credit_controller.dart';

class StoreCreditScreen extends GetView<StoreCreditController> {
  const StoreCreditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _addressList = ["Address Book"];

    final CarouselController _controller = CarouselController();

    final controller = Get.put(StoreCreditController());
    return Scaffold(
      backgroundColor: Color(0xFFFBECE5),
      drawerEnableOpenDragGesture: false,
      appBar: customAppBar(
        context,
      ),
      drawer: const Drawer(),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 14.6,
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFF5E2DB),
                borderRadius: BorderRadius.circular(0.0),
                border: Border.all(color: Colors.black26, width: 1),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  items: _addressList
                      .map(
                        (value) => DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        ),
                      )
                      .toList(),
                  isExpanded: true,
                  hint: Text(
                    "  My Account",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 26,
                    color: Colors.black,
                  ),
                  onChanged: (String? value) {},
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: controller.storeCreditLIst.length,
                  itemBuilder: (BuildContext context, int index) {
                    final storeData = controller.storeCreditLIst[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF5E2DB),
                          border: Border.all(
                            color: Colors.black26,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text("Date : ${storeData['Date']}"),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 6),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(child: Text("Description :")),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      "${storeData['Description']}",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 1,
                              width: double.infinity,
                              color: Colors.black26,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Amount"),
                                        SizedBox(height: 10),
                                        Text("${storeData['Account']}")
                                      ],
                                    ),
                                  )),
                                  Expanded(
                                      child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("Balance"),
                                        SizedBox(height: 10),
                                        Text("${storeData['Account']}")
                                      ],
                                    ),
                                  )),
                                  Expanded(
                                      child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("Remarks"),
                                        SizedBox(height: 10),
                                        Text("${storeData['Remarks']}")
                                      ],
                                    ),
                                  )),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }

  AppBar customAppBar(
    BuildContext context,
  ) {
    return AppBar(
      backgroundColor: Color(0xFFFBECE5),
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      centerTitle: false,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 12.0, bottom: 12.0),
        child: Image.asset(
          AppAsset.drawerIcon,
        ),
      ),
      title: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Image.asset(
          AppAsset.logo,
          height: 40,
          width: 120,
          fit: BoxFit.fill,
        ),
      ),
      actions: [
        InkWell(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 18.0,
              bottom: 18,
            ),
            child: Image.asset(
              AppAsset.searchIcon,
              height: 20,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        InkWell(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 18.0,
              bottom: 18,
            ),
            child: Image.asset(
              AppAsset.heartIcon,
              height: 20,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        InkWell(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 18.0,
              bottom: 18,
            ),
            child: Image.asset(
              AppAsset.bagIcon,
              height: 20,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
