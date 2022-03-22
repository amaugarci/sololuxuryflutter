import 'package:get/get.dart';
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
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
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
    return post("?contactForm[order_no]="+orderNo
        +"&contactForm[country]="+country
        +"IN&contactForm[subject]="+subject
        +"&contactForm[message]="+message
        +"&contactForm[source_of_ticket]="+sourceOfTicket
        +"&contactForm[phone_no]="+phoneNumber
        +"&contactForm[type_of_inquiry]="+typeOfEnquiry
        +"&contactForm[email]="+email
        +"&contactForm[lastname]="+lastName
        +"&contactForm[name]="+name
        +"", contactusRequestJson, headers: {"Content-type" : "application/json", "Authorization" : AppConstants.adminToken});
  }

}