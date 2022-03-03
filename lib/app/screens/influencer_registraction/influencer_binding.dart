import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:solo_luxury/app/screens/influencer_registraction/influencer_registration_controller.dart';

import '../../../data/model/InfluenceRegistration/influencer_registration_model.dart';

class InfluencerRegistrationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InfluencerRegistrationController());
  }
}

class DemoService {
  static Future<InfluencerRegistrationMethodModel?> demo() async {
    try {
      print("response:::::::::::::::");
      var body = json.encode({
        "website": "www.sololuxury.com",
        "first_name": "firstname",
        "last_name": "lastname",
        "phone": "phone",
        "emailaddress": "email",
        "facebook": "fbhandle",
        "facebook_followers": "fbfollowers",
        "instagram": "instahandle",
        "instagram_followers": "instafollowers",
        "twitter": "twitterhandle",
        "twitter_followers": "twitterfollowers",
        "youtube": "youtubehandle",
        "youtube_followers": "youtubefollowers",
        "linkedin": "linkedinhandle",
        "linkedin_followers": "linkedinfollowers",
        "pinterest": "pinteresthandle",
        "pinterest_followers": "pinterestfollowers",
        "worked_on": "projects",
        "website_name": "websitename",
        "url": "websiteurl",
        "country": "country",
        "type": "influencer",
        "lang_code": "storeCode"
      });
      var response = await http.post(
          Uri.parse("https://erp.theluxuryunlimited.com/api/influencer/add"),
          body: body,
          headers: {
            'Content-type': 'application/json',
            'Authorization': 'Bearer pdrqv7sasg7z54851cieiycp8df4pvs8'
          });

      print("response:::::::::::::::${response.body}");
      /* final dio = Dio();

      String baseUrl =
          "https://erp.theluxuryunlimited.com/api/influencer/add";

      var response = await dio.post(baseUrl,
          data: body,
          options: Options(headers: <String, String>{
          'Content-type': 'application/json',
          'Authorization': 'Bearer pdrqv7sasg7z54851cieiycp8df4pvs8'
          }));

      print("response:::::::::::::::${response.data.toString()}");*/
    } catch (e) {
      if (e is HttpException) {
        print('DioError : ${e.message}');
      }
      print("ERROR :${e.toString()}");
      return null;
    }
  }
}
