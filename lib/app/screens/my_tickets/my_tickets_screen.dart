import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:solo_luxury/app/screens/home/widget/header_widget.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';

import 'my_tickets_controller.dart';

class MyTicketsScreen extends GetView<MyTicketsController> {
  const MyTicketsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    TextEditingController emailController = TextEditingController();

    Widget subscribeButton() {
      return SizedBox(
        width: 120,
        height: 35,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: 1,
            primary: Colors.black,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(20),
            // ),
          ),
          child: const Text('SUBSCRIBE'),
        ),
      );
    }

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('AlertDialog Title'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('This is a demo alert dialog.'),
                  Text('Would you like to approve of this message?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Approve'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
        backgroundColor: backGroundColor,
        appBar: AppBar(
          backgroundColor: backGroundColor,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Image.asset(AppAsset.logo, width: 110),
          bottom: PreferredSize(
            preferredSize: Size(Get.width, 60),
            child: const HeaderWidget(),
          ),
        ),
        drawer: const Drawer(),
        body: ListView(children: <Widget>[
          const Center(
              child: Text(
            'MY TICKETS',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          )),
          DataTable(
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('NAME')),
              DataColumn(label: Text('ACTION')),
            ],
            rows: [
              DataRow(cells: [
                const DataCell(Text('12345', style: TextStyle(fontSize: 11))),
                const DataCell(Text(
                  'Special Request',
                  style: TextStyle(fontSize: 11),
                )),
                DataCell(InkWell(
                  onTap: () {
                    _showMyDialog();
                  },
                  child: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.black,
                    size: 14,
                  ),
                )),
              ]),
              DataRow(cells: [
                const DataCell(Text('12346', style: TextStyle(fontSize: 11))),
                const DataCell(
                    Text('Special Request', style: TextStyle(fontSize: 11))),
                DataCell(InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.black,
                    size: 14,
                  ),
                )),
              ]),
              DataRow(cells: [
                const DataCell(Text('12347', style: TextStyle(fontSize: 11))),
                const DataCell(
                    Text('Special Request', style: TextStyle(fontSize: 11))),
                DataCell(InkWell(
                  onTap: () {
                    print('Hello');
                  },
                  child: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.black,
                    size: 14,
                  ),
                )),
              ]),
            ],
          ),
        ]));
  }

  Widget detailsButton(String text, int value) {
    return GestureDetector(
      onTap: () {
        if (controller.index.value == value) {
          controller.index.value = 0;
        } else {
          controller.index.value = value;
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: Get.width * 0.9,
        decoration: BoxDecoration(
          //  color: appColor,
          border: Border.all(color: Colors.black, width: 0.4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,
                style: const TextStyle(
                    color: Color(0xFFA4491A),
                    fontSize: 18,
                    fontWeight: FontWeight.w400)),
            const SizedBox(width: 10),
            const Icon(
              Icons.expand_more,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
