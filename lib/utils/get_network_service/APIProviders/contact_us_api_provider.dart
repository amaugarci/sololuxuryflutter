import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:solo_luxury/data/model/contact_us_response_model.dart';
import '../../app_constants.dart';
import 'package:http/http.dart' as http;

abstract class IContactUsProvider {
  Future<dynamic> getContactUsResponseProvider({
    required String urlPath,
    required String contactusRequestJson,
    required String orderNo,
    required String country,
    required String subject,
    required String message,
    required String sourceOfTicket,
    required String phoneNumber,
    required String typeOfEnquiry,
    required String email,
    required String name,
    required String lastName,
  });
}

class ContactUsAPIProvider extends GetConnect implements IContactUsProvider {
  @override
  void onInit() {
    // httpClient.defaultDecoder = (val) => ContactUsResponseModel.fromJson(val);
    // httpClient.baseUrl = AppConstants.apiEndPointContactUs;
    httpClient.defaultDecoder = (val) => jsonEncode(val);
    httpClient.baseUrl = AppConstants.apiEndPointContactUs;
    httpClient.timeout = const Duration(seconds: 60);
  }

  @override
  Future<dynamic> getContactUsResponseProvider({
    required String urlPath,
    required String contactusRequestJson,
    required String orderNo,
    required String country,
    required String subject,
    required String message,
    required String sourceOfTicket,
    required String phoneNumber,
    required String typeOfEnquiry,
    required String email,
    required String name,
    required String lastName,
  }) async {
    var request = http.MultipartRequest(
        "POST", Uri.parse("https://dev3.sololuxury.com/rest/V1/contactus"));
    request.fields["contactForm[name]"] = "${name.toString()}";
    request.fields["contactForm[email]"] = "${email.toString()}";
    request.fields["contactForm[phone_no]"] = "${phoneNumber.toString()}";
    request.fields["contactForm[message]"] = "${message.toString()}";
    request.fields["contactForm[lastname]"] = "${lastName.toString()}";
    request.fields["contactForm[type_of_inquiry]"] =
        "${typeOfEnquiry.toString()}";
    request.fields["contactForm[order_no]"] = "${orderNo.toString()}";
    request.fields["contactForm[country]"] = "${country.toString()}";
    request.fields["contactForm[subject]"] = "${subject.toString()}";
    request.fields["contactForm[source_of_ticket]"] =
        "${sourceOfTicket.toString()}";

    // request.fields["sku"] = "${sku.toString()}";
    final response = await request.send().timeout(const Duration(seconds: 60));
    var res = await http.Response.fromStream(response);
    print("response -> " + res.body);
    var json1 = json.decode(res.body);
    return json1;
  }

  // @override
  // Future<dynamic> getContactUsResponseProvider({
  //   required String urlPath,
  //   required String contactusRequestJson,
  //   required String orderNo,
  //   required String country,
  //   required String subject,
  //   required String message,
  //   required String sourceOfTicket,
  //   required String phoneNumber,
  //   required String typeOfEnquiry,
  //   required String email,
  //   required String name,
  //   required String lastName,
  // }) {
  //   return post(
  //       "?contactForm[order_no]=" +
  //           "${orderNo}" +
  //           "&contactForm[country]=" +
  //           "${country}" +
  //           "IN&contactForm[subject]=" +
  //           "${subject}" +
  //           "&contactForm[message]=" +
  //           "${message}" +
  //           "&contactForm[source_of_ticket]=" +
  //           "${sourceOfTicket}" +
  //           "&contactForm[phone_no]=" +
  //           "${phoneNumber}" +
  //           "&contactForm[type_of_inquiry]=" +
  //           "${typeOfEnquiry}" +
  //           "&contactForm[email]=" +
  //           "${email}" +
  //           "&contactForm[lastname]=" +
  //           "${lastName}" +
  //           "&contactForm[name]=" +
  //           "${name}" +
  //           "",
  //       contactusRequestJson,
  //       headers: {
  //         "Content-type": "application/json",
  //         "Authorization": AppConstants.defaultToken1
  //       });
  // }
}
