import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/data/model/InfluenceRegistration/influencer_registration_model.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/common_methods.dart';
import '../../../utils/network_dio/network_dio.dart';
import 'package:http/http.dart' as http;
import '../../../utils/repository/network_repository.dart';

class InfluencerRegistrationController extends GetxController {
  NetworkRepository networkRepository = NetworkRepository();
  final formKey = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contactNo = TextEditingController();
  TextEditingController websiteUrl = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController postCode = TextEditingController();
  TextEditingController faceBook = TextEditingController();
  TextEditingController instagram = TextEditingController();
  TextEditingController twitter = TextEditingController();
  TextEditingController youtube = TextEditingController();
  TextEditingController linkedin = TextEditingController();
  TextEditingController pinterest = TextEditingController();
  TextEditingController faceBookFollower = TextEditingController();
  TextEditingController instagramFollower = TextEditingController();
  TextEditingController twitterFollower = TextEditingController();
  TextEditingController youtubeFollower = TextEditingController();
  TextEditingController linkedinFollower = TextEditingController();
  TextEditingController pinterestFollower = TextEditingController();
  TextEditingController projectWork = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    print("PRIYA DETAILS");
  }

  influencerReg({
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
      firstNameVal: firstNameVal,
      lastNameVal: lastNameVal,
      emailVal: emailVal,
      contactVal: contactVal,
      cityVal: cityVal,
      countryVal: countryVal,
      facebookVal: facebookVal,
      instagramVal: instagramVal,
      linkedinVal: linkedinVal,
      pinterestVal: pinterestVal,
      postCodeVal: postCodeVal,
      twitterVal: twitterVal,
      youtubeVal: youtubeVal,
      facebookFollowerVal: facebookFollowerVal,
      instagramFollowerVal: instagramFollowerVal,
      linkedinFollowerVal: linkedinFollowerVal,
      pinterestFollowerVal: pinterestFollowerVal,
      twitterFollowerVal: twitterFollowerVal,
      youtubeFollowerVal: youtubeFollowerVal,
      websiteUrlVal: websiteUrlVal,
    );
    printLog(authResponse);
  }
}
