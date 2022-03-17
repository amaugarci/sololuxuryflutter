import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/expandable_container.dart';
import 'package:solo_luxury/app/utils/app_asset.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/data/model/my_ticket/my_ticket_model.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/my_ticket_api_repository.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

class MyTicketsController extends GetxController {
  RxInt index = 0.obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;

  Rx<ExpandableController> aboutUsExpandableController =
      ExpandableController().obs;
  var isLoading = true.obs;
  RxList<MyTicketModel> getticketList = RxList<MyTicketModel>();

  List getMyTicketList = [
    {
      "Id": "T20220207104515",
      "Name": "Special Request | avo..",
    },
    {
      "Id": "T20220207104515",
      "Name": "Special Request | avo..",
    },
    {
      "Id": "T20220207104515",
      "Name": "Special Request | avo..",
    },
    {
      "Id": "T20220207104515",
      "Name": "Special Request | avo..",
    },
    {
      "Id": "T20220207104515",
      "Name": "Special Request | avo..",
    },
    {
      "Id": "T20220207104515",
      "Name": "Special Request | avo..",
    },
    {
      "Id": "T20220207104515",
      "Name": "Special Request | avo..",
    },
    {
      "Id": "T20220207104515",
      "Name": "Special Request | avo..",
    },
    {
      "Id": "T20220207104515",
      "Name": "Special Request | avo..",
    },
  ];

  List dialogList = [
    {
      "Message":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut",
      "Date": "2022-03-07",
      "Time": "10:45:15",
      "Sent By": "Admin"
    },
    {
      "Message":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut",
      "Date": "2022-03-07",
      "Time": "10:45:15",
      "Sent By": "Admin"
    },
  ];

  MyTicketAPIRepository myTicketAPIRepository;
  String? countryCode;

  MyTicketsController({required this.myTicketAPIRepository, this.countryCode});
  @override
  void onInit() {
    getMyTicket();
    super.onInit();
  }

  Map<String, dynamic> encodebody = {
    "website": "www.sololuxury.com",
    "email": "devdyna@gmail.com",
  };

//CountrList
  getMyTicket() async {
    isLoading.value = true;
    print("getStoreDataFromApi -> ");

    var myTicketLIst =
        await myTicketAPIRepository.getmyTicketApiResponse(encodebody);
    final ticketList = myTicketLIst[0]['tickets']['data'];

    getticketList.value = List<MyTicketModel>.from(
        ticketList.map((countryList) => MyTicketModel.fromJson(countryList)));
    print("Response $getticketList");
    isLoading.value = false;
  }

  showDialogBoxOpen(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: backGroundColor,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            insetPadding: EdgeInsets.symmetric(horizontal: 10.0),
            // title:
            content: Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height / 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.close))
                    ],
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  setupAlertDialoadContainer(context),
                ],
              ),
            ),
          );
        });
  }

//
  Widget setupAlertDialoadContainer(context) {
    return Expanded(
      child: Container(
        width: double.maxFinite,
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 1.2)),
        child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: dialogList.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(
            color: Colors.black,
            thickness: 1.2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "Message",
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Text(dialogList[index]['Message'],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 13),
                              maxLines: 3)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "Data",
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Text(dialogList[index]['Date'],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 13),
                              maxLines: 3)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "Time",
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Text(dialogList[index]['Time'],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 13),
                              maxLines: 3)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "Sent By",
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Text(dialogList[index]['Sent By'],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 13),
                              maxLines: 3)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
