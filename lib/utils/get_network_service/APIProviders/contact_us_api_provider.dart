import 'package:get/get_connect/connect.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:solo_luxury/data/model/contact_us_response_model.dart';
import '../../app_constants.dart';

abstract class IContactUsProvider {
  Future<Response<ContactUsResponseModel>> getContactUsResponseProvider({required String urlPath,
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
    required String lastName,});
}


class ContactUsAPIProvider extends GetConnect implements IContactUsProvider {

  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => ContactUsResponseModel.fromJson(val);
    httpClient.baseUrl = AppConstants.apiEndPointContactUs;
  }

  @override
  Future<Response<ContactUsResponseModel>> getContactUsResponseProvider({required String urlPath,
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
  }) {
    return post("?contactForm[order_no]="+" "
        +"&contactForm[country]="+" "
        +"IN&contactForm[subject]="+" "
        +"&contactForm[message]="+" "
        +"&contactForm[source_of_ticket]="+" "
        +"&contactForm[phone_no]="+" "
        +"&contactForm[type_of_inquiry]="+" "
        +"&contactForm[email]="+" "
        +"&contactForm[lastname]="+" "
        +"&contactForm[name]="+" "
        +"", contactusRequestJson, headers: {"Content-type" : "application/json", "Authorization" : AppConstants.defaultToken1});
  }

}