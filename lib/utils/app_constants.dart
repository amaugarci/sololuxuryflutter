enum Environment { DEV, STAGING, PROD }

class AppConstants {
  // Network Constants

  // static String apiEndPoint = "http://192.168.29.135";
  // static String apiEndPoint = "https://solo_luxury.virtual-manager-backend.ml";
  static String imageEndPoint = "https://solo_luxury.s3.amazonaws.com/";
  static String menuEndPoint = "/V1/categories";
  static String estimatesShippingMethodEndPoint =
      "/in-en/V1/carts/mine/estimate-shipping-methods";
  static String shippingInformationEndPoint =
      "/in-en/V1/carts/mine/shipping-information";

  static String apiEndPointNew1 = "https://dev2.brands-labels.com/rest";
  static String apiEndPointNewInfluencer =
      "https://erp.theluxuryunlimited.com/api/influencer/add";
  static String apiEndPointNew = "https://www.sololuxury.com/rest";
  static String apiEndPoint = "https://api.solo_luxury.com";

  // static String apiEndPoint =
  //     "http://solo_luxury-env.eba-hfpkwp9f.us-east-1.elasticbeanstalk.com";

  //Sign Up
  static String login = 'integration/customer/token';

  static const String defaultToken = "Bearer u75tnrg0z2ls8c4yubonwquupncvhqie";

  static const String signUp = "customers";



}
