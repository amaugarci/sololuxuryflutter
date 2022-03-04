import 'dart:convert';
import 'dart:io';

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/data/model/InfluenceRegistration/influencer_registration_model.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/common_methods.dart';
import '../../../utils/get_network_service/APIRepository/influencer_api_repository.dart';
import '../../../utils/network_dio/network_dio.dart';
import 'package:http/http.dart' as http;
import '../../../utils/repository/network_repository.dart';

class InfluencerRegistrationController extends GetxController {
  NetworkRepository networkRepository = NetworkRepository();
  final formKey = GlobalKey<FormState>().obs;
  Rx<TextEditingController> firstName = TextEditingController().obs;
  Rx<TextEditingController> lastName = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> contactNo = TextEditingController().obs;
  Rx<TextEditingController> websiteUrl = TextEditingController().obs;
  Rx<TextEditingController> city = TextEditingController().obs;
  Rx<TextEditingController> country = TextEditingController().obs;
  Rx<TextEditingController> postCode = TextEditingController().obs;
  Rx<TextEditingController> faceBook = TextEditingController().obs;
  Rx<TextEditingController> instagram = TextEditingController().obs;
  Rx<TextEditingController> twitter = TextEditingController().obs;
  Rx<TextEditingController> youtube = TextEditingController().obs;
  Rx<TextEditingController> linkedin = TextEditingController().obs;
  Rx<TextEditingController> pinterest = TextEditingController().obs;
  Rx<TextEditingController> faceBookFollower = TextEditingController().obs;
  Rx<TextEditingController> instagramFollower = TextEditingController().obs;
  Rx<TextEditingController> twitterFollower = TextEditingController().obs;
  Rx<TextEditingController> youtubeFollower = TextEditingController().obs;
  Rx<TextEditingController> linkedinFollower = TextEditingController().obs;
  Rx<TextEditingController> pinterestFollower = TextEditingController().obs;
  Rx<TextEditingController> projectWork = TextEditingController().obs;

  Rx<InfluencerRegistrationMethodModel> influencerRegistrationResponseModel =
      InfluencerRegistrationMethodModel().obs;

  late final InfluencerApiRepository influencerApiRepository;

  InfluencerRegistrationController({required this.influencerApiRepository});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    print("PRIYA DETAILS");
  }

  influencerReg(context, formKey) async {
    try {
      if (formKey.currentState!.validate()) {
        InfluencerRegistrationMethodModel influencerRegistrationMethodModel =
            InfluencerRegistrationMethodModel(
          firstName: firstName.value.toString(),
          country: country.value.toString(),
          emailaddress: email.value.toString(),
          facebook: faceBook.value.toString(),
          facebookFollowers: faceBookFollower.value.toString(),
          instagram: instagram.value.toString(),
          instagramFollowers: instagramFollower.value.toString(),
          lastName: lastName.value.toString(),
          linkedin: linkedin.value.toString(),
          linkedinFollowers: linkedinFollower.value.toString(),
          phone: contactNo.value.toString(),
          pinterest: pinterest.value.toString(),
          pinterestFollowers: pinterestFollower.value.toString(),
          twitter: twitter.value.toString(),
          twitterFollowers: twitterFollower.value.toString(),
          workedOn: projectWork.value.toString(),
          youtube: youtube.value.toString(),
          youtubeFollowers: youtubeFollower.value.toString(),
          website: "WWW.SOLOLUXURY.COM",
          url: websiteUrl.value.toString(),
          langCode: "storeCode",
          type: "influencer",
          websiteName: "websitename",
        );
        influencerRegistrationResponseModel =
            (await influencerApiRepository.getInfluencerAPIResponse(
                    json.encode(influencerRegistrationMethodModel)))
                .obs;
        log("signUpResponseModel : ${influencerRegistrationResponseModelToJson(influencerRegistrationResponseModel.value)}");
      }
    } catch (e) {
      print("ERROR:::::::::::::::::::::${e.toString()}");
      if (e is HttpException) {
        print("ERROR:::::::::::::::::::::${e.toString()}");
      }
    }
  }

/* influencerReg({
    var firstNameVal,
    var lastNameVal,
    var emailVal,
    var contactVal,
    var websiteUrlVal,
    var cityVal,
    var countryVal,
    var postCodeVal,
    var facebookVal,
    var instagramVal,
    var twitterVal,
    var youtubeVal,
    var linkedinVal,
    var pinterestVal,
    var facebookFollowerVal,
    var instagramFollowerVal,
    var twitterFollowerVal,
    var youtubeFollowerVal,
    var linkedinFollowerVal,
    var pinterestFollowerVal,
  }) async {
    dynamic authResponse = await networkRepository.influencerRegistrationMethod(
      firstNameVal: firstName.value.toString(),
      countryVal: country.value.toString(),
      emailVal: email.value.toString(),
      facebookVal: faceBook.value.toString(),
      facebookFollowerVal: faceBookFollower.value.toString(),
      instagramVal: instagram.value.toString(),
      instagramFollowerVal: instagramFollower.value.toString(),
      lastNameVal: lastName.value.toString(),
      linkedinVal: linkedin.value.toString(),
      linkedinFollowerVal: linkedinFollower.value.toString(),
      contactVal: contactNo.value.toString(),
      pinterestVal: pinterest.value.toString(),
      pinterestFollowerVal: pinterestFollower.value.toString(),
      twitterVal: twitter.value.toString(),
      twitterFollowerVal: twitterFollower.value.toString(),
      youtubeVal: youtube.value.toString(),
      youtubeFollowerVal: youtubeFollower.value.toString(),
      // websiteUrlVal: "WWW.SOLOLUXURY.COM",
      websiteUrlVal: websiteUrl.value.toString(),
    );
    printLog(authResponse);
  }*/
}
