enum Environment { DEV, STAGING, PROD }

class AppConstants {
  // Network Constants

  // static String apiEndPoint = "http://192.168.29.135";
  // static String apiEndPoint = "https://solo_luxury.virtual-manager-backend.ml";
  static String imageEndPoint = "https://solo_luxury.s3.amazonaws.com/";
  static String estimatesShippingMethodEndPoint = "/in-en/V1/carts/mine/estimate-shipping-methods";
  static String shippingInformationEndPoint = "/in-en/V1/carts/mine/shipping-information";
  static String storeWebsitesEndPoint = "/V1/store/websites";
  static String storeViewsEndPoint = "/V1/store/storeViews";
  static String storeConfigsEndPoint = "/V1/store/storeConfigs";
  static String jsonEndPoint = "/json";

  static String apiEndPointNew2 = "https://dev3.sololuxury.com/rest";
  static String apiEndPointNew1 = "https://dev2.brands-labels.com/rest";
  static String apiEndPointMyAccount = "https://dev2.brands-labels.com/rest/V1/customers/me";
  static String apiEndPointNewInfluencer =
      "https://erp.theluxuryunlimited.com/api/influencer/add";
  static String apiEndPointNew = "https://www.sololuxury.com/rest";
  static String apiEndPoint = "https://api.solo_luxury.com";
  //static String apiEndPointLogin = "https://dev3.sololuxury.com";
  static String apiEndPointLogin = "https://www.sololuxury.com";
  static String apiCountryGet = "http://ip-api.com";

  // static String apiEndPoint =
  //     "http://solo_luxury-env.eba-hfpkwp9f.us-east-1.elasticbeanstalk.com";

  //Sign Up
  //static String login = '/integration/customer/token';


  static const String defaultToken = "Bearer u75tnrg0z2ls8c4yubonwquupncvhqie";
  static const String defaultToken1 = "Bearer 6yd15hrwmolzw4vjl33bdmy3ry0yqge7";

  static String login = '/rest/V1/integration/customer/token';
  static const String signUp = "/rest/V1/customers";
  static String menuEndPoint = "/rest/V1/categories";

  static const String licenceId = '11434003';

  //static String login = 'integration/customer/token';
  static String addAddress = 'customers/me';
  static String countryList = 'directory/countries';
}
